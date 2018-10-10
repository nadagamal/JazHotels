//
//  RatePlansViewController.swift
//  JazHotels
//
//  Created by Zeinab Reda on 7/24/18.
//  Copyright © 2018 Jaz. All rights reserved.
//

import UIKit
import Kingfisher
import PopupDialog
import FirebaseUI
import SVProgressHUD
import FirebaseFirestore
class RatePlansViewController: UIViewController,FUIAuthDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    var roomRateList :[JCRoomRate] = []
    var ratePlans:[JCRatePlan]!
    var roomStay:JCRoomStay!
    var isExpanded = false
    var expandableCells=[Int]()
    var hotelTitle:String?
    var checkInDate:String!
    var checkOutDate:String!
    var chainCode:String!
    var hotelCode:String!
    var roomNum:String!
    var childNum:String!
    var adultsNum:String!
    var selectedRowIndex = 0
    var selectedSectionIndex = 0
    var isFromNotification = false

    fileprivate(set) var auth: Auth? = Auth.auth()
    fileprivate(set) var authUI: FUIAuth? = FUIAuth.defaultAuthUI()
    fileprivate var authStateDidChangeHandle: AuthStateDidChangeListenerHandle?
    fileprivate let db = Firestore.firestore()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Rate Plans"
        self.authUI?.delegate = self
        let providers: [FUIAuthProvider] = [
            FUIGoogleAuth(),
            FUIFacebookAuth(),
            ]
        self.authUI!.providers = providers
        let settings = db.settings
        settings.areTimestampsInSnapshotsEnabled = true
        db.settings = settings
        NotificationCenter.default.addObserver(self, selector: #selector(bookBtnPressed), name: NSNotification.Name("BookNowAction"), object: nil)
  
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = false
        
    }
    @objc public static func create() -> RatePlansViewController {
        
        return UIStoryboard(name: HotelJazConstants.StoryBoard.mainSB, bundle: Bundle.main).instantiateViewController(withIdentifier: String(describing: self)) as! RatePlansViewController
    }
    @IBAction func editReservationBtn(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: true)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @objc func headerTapped(tapGesture:UITapGestureRecognizer){
        isExpanded = true
       let cell = tapGesture.view as! RatePlanTableViewCell
        
        let selectedSection = (tapGesture.view?.tag)!
        if expandableCells.contains(selectedSection){
            var selectedIndex = 0
            for i in (0...expandableCells.count-1){
                if expandableCells[i] == selectedSection{
                    selectedIndex = i
                    break
                }
            }
            expandableCells.remove(at: selectedIndex)
            cell.avaiableRoomBtn.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            DispatchQueue.main.async {
            cell.arrowImg.image = UIImage(named: "arrow_down")
            }

        }
        else{
            expandableCells.append(selectedSection)
            cell.avaiableRoomBtn.backgroundColor = #colorLiteral(red: 0.2431372549, green: 0.537254902, blue: 0.4941176471, alpha: 1)
            DispatchQueue.main.async {
                cell.arrowImg.image = UIImage(named: "opend")

            }

        }
        tableView.reloadData()
        
    }
    func getRoomPrice(ratePlanCode:String) ->String {
        var price:String = ""
        for rate in roomStay.roomRates.roomRate{
            if rate.ratePlanCode == ratePlanCode && rate.rates != nil && rate.rates.rate.base.amountAfterTax != nil{
                price = rate.rates.rate.base.amountAfterTax

//                if rate.rates.rate.tpaExtensions.nightlyRate.count>0{
//                    price = rate.rates.rate.tpaExtensions.nightlyRate[0].priceWithTaxAndFee
//                }  else if rate.rates.rate.total.amountAfterTax != nil{
//                    price = rate.rates.rate.total.amountAfterTax
//                }
                break
            }
        }
        return price
    }
    func getRoomsList(ratePlanCode:String) ->[JCRoomRate] {
        var list = [JCRoomRate]()
        for rate in roomRateList{
            if rate.ratePlanCode == ratePlanCode && rate.rates != nil{
              list.append(rate)
            }
        }
        return list
    }
    func getRoomType(roomTypeCode:String) ->JCRoomType {
        for room in roomStay.roomTypes.roomType{
            if room.roomTypeCode == roomTypeCode{
                return room
            }
        }
        return JCRoomType(fromDictionary: [:])
    }
    func getRoomPrice(roomTypeCode:String) ->String {
        var price:String = ""
        for rate in roomStay.roomRates.roomRate{
            if rate.roomTypeCode == roomTypeCode{
                if rate.rates.rate.base.amountAfterTax != nil{
                  price = rate.rates.rate.base.amountAfterTax
                }
//                if rate.rates.rate.tpaExtensions.nightlyRate.count>0{
//                    price = rate.rates.rate.tpaExtensions.nightlyRate[0].priceWithTaxAndFee
//                }  else if rate.rates.rate.total.amountAfterTax != nil{
//                    price = rate.rates.rate.total.amountAfterTax
//                }
                break
            }
        }
        return price
    }
    @objc func bookBtnPressed(sender:UIButton){
        isFromNotification = true
        bookNowAction(sender: sender)
    }
    @objc func bookNowAction(sender:UIButton){
        var indexPath = NSIndexPath(row: selectedRowIndex, section: selectedSectionIndex)
        if isFromNotification == false{
        let cell = sender.superview?.superview as? RoomDetailsCell
        indexPath = tableView.indexPath(for: cell!) as! NSIndexPath
        }
        else{
            isFromNotification = false
            DispatchQueue.main.async {
                self.dismiss(animated: true, completion: {
                    
                })
            }
        }
        let ratePlan:JCRatePlan = roomStay.ratePlans[indexPath.section]

        let userData = UserDefaults.getObjectDefault(key: HotelJazConstants.userDefault.userData) as? UserProfile
        if userData != nil && userData?.userName != nil{
        //var roomTypeslist = roomStay.roomTypes.roomType as [JCRoomType]
            let ratePlan:JCRatePlan = roomStay.ratePlans[indexPath.section]
            var list = getRoomsList(ratePlanCode: ratePlan.ratePlanCode)
            let room = getRoomType(roomTypeCode: list[indexPath.row].roomTypeCode)
        let viewController = BookHotelViewController.create()
        viewController.roomType = room
        viewController.ratePlan = ratePlan
        viewController.checkOutDate = self.checkOutDate
        viewController.checkInDate = self.checkInDate
        viewController.hotelCode = self.hotelCode
        viewController.adultsNum = self.adultsNum
        viewController.childNum = self.childNum
        viewController.chainCode = self.chainCode
        viewController.roomNum = self.roomNum
        navigationController?.show(viewController, sender: sender)
        }
        else{
            let controller = self.authUI!.authViewController()
            self.navigationController?.present(controller, animated: true, completion: nil)
//            self.navigationController?.present(LoginViewController.create(), animated: true, completion: nil)

        }

    }
    @objc func roomDetailsAction(sender:UIButton){
        guard let cell = sender.superview?.superview as? RoomDetailsCell else {
            return
        }
        
        let indexPath = tableView.indexPath(for: cell) as! NSIndexPath
        selectedSectionIndex = indexPath.section
        selectedRowIndex = indexPath.row
        let viewController = RoomDetailsViewController.create()
        var roomTypeslist = roomStay.roomTypes.roomType as [JCRoomType]
         viewController.room = roomTypeslist[indexPath.row]
       // viewController.bookNowBtn.addTarget(self, action: #selector(bookNowAction(sender:)), for: .touchUpInside)
       // viewController.room = roomTypeslist[indexPath.row]
        let popup = PopupDialog(viewController: viewController,
                                buttonAlignment: .horizontal,
                                transitionStyle: .fadeIn,
                                tapGestureDismissal: true,
                                panGestureDismissal: true)
        
        self.navigationController?.topViewController?.present(popup, animated: true, completion: nil)
    }
    func authUI(_ authUI: FUIAuth, didSignInWith authDataResult: AuthDataResult?, error: Error?) {
        if authDataResult != nil{
            checkAccountFound(user: authDataResult!)
        }    }
    
    func checkAccountFound(user:AuthDataResult)
    {
        db.collection("users").getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                var found = false
                for document in querySnapshot!.documents {
                    if document.documentID == user.user.uid // sigin
                    {
                        print("\(document.documentID) => \(document.data())")
                        
                        let data = document.data() as NSDictionary
                        let userProfile = UserProfile(userContact: UserContact(JSON: data["contact"] as! [String:Any])!, userName: UserName(JSON: data["name"] as! [String:Any])!, userAddress: UserAddress(JSON: data["address"] as! [String:Any])!, userCustomer: UserCustomerLoyalty(JSON: data["customerLoyalty"] as! [String:Any])!, userCardPayment: UserPaymentCard(JSON: data["paymentCard"] as! [String:Any])!, userSynXisInfo: UserSynXisInfo(JSON: data["synXisInfo"] as! [String:Any])!,gender:data["gender"] as! String,userId:user.user.uid,title:data["title"] as? String ?? "")
                        
                        UserDefaults.saveObjectDefault(key: HotelJazConstants.userDefault.userData, value: userProfile)
                        found = true
                        self.viewProfile(userData: userProfile)
                        break
                    }
                    
                }
                
                
                if !found // create user
                {
                    self.createNewUser()
                    
                }
                
                DispatchQueue.main.async {
                    SVProgressHUD.dismiss()
                }
            }
        }
    }
    func viewProfile(userData:UserProfile)
    {
        DispatchQueue.main.async {
            
            UserDefaults.saveObjectDefault(key: HotelJazConstants.userDefault.userData, value: userData)
            
            NotificationCenter.default.post(name: Notification.Name(HotelJazConstants.Notifications.userProfileData), object: userData)
            
            self.dismiss(animated: true, completion: nil)
        }
    }
    func createNewUser()
    {
        let db = Firestore.firestore()
        let user = Auth.auth().currentUser
        
        let userProfile = UserProfile(userContact: UserContact(emailAddress: (user?.email ?? "")!, landLine: "", mobilePhone: (user?.phoneNumber ?? "")!, phoneNumbers: (user?.phoneNumber ?? "")!), userName: UserName(firstName: (user?.displayName ?? "")!, fullName: (user?.displayName ?? "")!, lastName: "", middleInitial: "", middleName: "", photo:(user?.photoURL?.absoluteString ?? "")!), userAddress: UserAddress(), userCustomer: UserCustomerLoyalty(), userCardPayment: UserPaymentCard(), userSynXisInfo: UserSynXisInfo(synXisPassword: (user?.email ?? "")!, synXisUserID: (user?.email ?? "")!),gender:"",userId:(user?.uid)! , title : "Mr.")
        
        
        db.collection("users").document("\(String(describing: (user?.uid)!))").setData(userProfile.toDictionary()) { err in
            if let err = err {
                print("Error writing document: \(err)")
            } else {
                print("Document successfully written!")
            }
        }
        
        self.viewProfile(userData: userProfile)
        
    }
}

extension RatePlansViewController :UITableViewDelegate , UITableViewDataSource
{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DetailsCell") as! RoomDetailsCell
        let ratePlan:JCRatePlan = roomStay.ratePlans[indexPath.section]
        var list = getRoomsList(ratePlanCode: ratePlan.ratePlanCode)
        let room = getRoomType(roomTypeCode: list[indexPath.row].roomTypeCode)
        cell.priceLbl.text = getRoomPrice(roomTypeCode: room.roomTypeCode) + " USD"
        cell.roomDescriptionLbl.text = room.roomDescription.text.replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression, range: nil)
        cell.bookNowBtn.addTarget(self, action: #selector(bookNowAction(sender:)), for: .touchUpInside)
        cell.bookNowBtn.tag = indexPath.row
        cell.roomDetailsBtn.addTarget(self, action: #selector(roomDetailsAction(sender:)), for: .touchUpInside)
        cell.roomNameLbl.text = room.roomDescription.name
        let imageURL = URL(string: (room.roomDescription!.image))
        cell.imgView.kf.indicatorType = .activity
        cell.imgView.kf.setImage(with: imageURL, placeholder: UIImage(named: "jazLauncherLogo"), options: [.transition(ImageTransition.fade(0.7))], progressBlock: nil, completionHandler: nil)
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let ratePlan:JCRatePlan = roomStay.ratePlans[section]
        if expandableCells.contains(section){
            return getRoomsList(ratePlanCode: ratePlan.ratePlanCode).count
        }else{
            return 0
        }
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        if roomStay.ratePlans != nil && roomStay.ratePlans != nil && roomStay.ratePlans.count != 0{
        return roomStay.ratePlans.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 320.0
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(headerTapped))
        let cell = tableView.dequeueReusableCell(withIdentifier: "rate_cell") as! RatePlanTableViewCell
        cell.tag = section
        let ratePlan:JCRatePlan = roomStay.ratePlans[section]
        cell.ratePrice.text = getRoomPrice(ratePlanCode: ratePlan.ratePlanCode)
        if expandableCells.contains(section){
            cell.avaiableRoomBtn.backgroundColor = #colorLiteral(red: 0.2431372549, green: 0.537254902, blue: 0.4941176471, alpha: 1)
            cell.avaiableRoomBtn.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
            cell.arrowImg.image = UIImage(named: "opend")
        }
        else{
        cell.avaiableRoomBtn.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            cell.avaiableRoomBtn.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
            cell.arrowImg.image = UIImage(named: "closed")


        }
        if ratePlan != nil{
            cell.rateTitle.text = ratePlan.ratePlanDescription.name ?? ""
            if ratePlan.ratePlanDescription.text != nil{
                let str = ratePlan.ratePlanDescription.text.replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression, range: nil)
                cell.rateDesc.textContainer.maximumNumberOfLines = 2
                cell.rateDesc.text = str
                
            }
            
        }
        cell.addGestureRecognizer(tapGesture)
        return cell
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 230
    }
}
