//
//  ProfileViewController.swift
//  JazHotels
//
//  Created by Zeinab Reda on 7/4/18.
//  Copyright © 2018 Jaz. All rights reserved.
//

import UIKit
import FirebaseFirestore
import McPicker
import LSDialogViewController
protocol UpdateProfile
{
    func reloadProfile(user:UserProfile)
}

protocol changeBookingDates {
    func getBookingDates(startDate:String,endDate:String,nights:String)
    func getUserModifcation(choice:ModifyReservation)
    func getUserAddationalRequest(request:String)
}
class ProfileViewController: UIViewController {

    @IBOutlet weak var profileImg: UIImageView!
    @IBOutlet weak var userName: UILabel!

    @IBOutlet weak var userTitle: McTextField!
    
    @IBOutlet weak var userMobile: UITextField!
    
    @IBOutlet weak var userCountry: McTextField!
    
    @IBOutlet weak var userCity: UITextField!
    @IBOutlet weak var userAddress: UITextField!
    
    @IBOutlet weak var userCreditNumber: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    static var user:User?
    var currentTitle:String = ""
    
    fileprivate var userData:UserProfile?
    fileprivate var countries: [String] = {
        
        var arrayOfCountries: [String] = []
        
        for code in NSLocale.isoCountryCodes as [String] {
            let id = NSLocale.localeIdentifier(fromComponents: [NSLocale.Key.countryCode.rawValue: code])
            let name = NSLocale(localeIdentifier: "en_UK").displayName(forKey: NSLocale.Key.identifier, value: id) ?? "Country not found for code: \(code)"
            arrayOfCountries.append(name)
        }
        
        return arrayOfCountries
    }()
    
    fileprivate var attributeNames:[String] = ["Title","Full Name","Gender","Phone Number","Country","Address","Membership Number"]
    fileprivate var genderList:[String] = ["Male","Female"]
    fileprivate var titleList:[String] = ["Mr.","Mrs.","Miss.","Pr.","Prof.","Dr.","Rev."]

   
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
//        self.navigationController?.setTransparentNavigation()
        UINavigationBar.appearance().shadowImage = UIImage()
        UINavigationBar.appearance().setBackgroundImage(UIImage(), for: .default)
        UINavigationBar.appearance().isTranslucent = false      

        if !UserDefaults.isKeyPresentInUserDefaults(key: HotelJazConstants.userDefault.userData)
        {
            self.navigationController?.present(LoginViewController.create(), animated: true, completion: nil)
        }
        else
        
        {
            self.userData = UserDefaults.getObjectDefault(key: HotelJazConstants.userDefault.userData) as? UserProfile
            self.tableView.reloadData()

        }
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        NotificationCenter.default.addObserver(self, selector: #selector(ProfileViewController.getProfile(notification:)), name: Notification.Name(HotelJazConstants.Notifications.userProfileData), object: nil)
        

    }
    @IBAction func menuBtnAction(_ sender: Any) {
        
        
    }
    
    
    
    @objc private func getProfile(notification: Notification) {
        
        if notification.object != nil
        {
            self.userData = notification.object as? UserProfile
        }
        
    }
 
    @objc public static func create() -> ProfileViewController {
        
        return UIStoryboard(name: HotelJazConstants.StoryBoard.authSB, bundle: Bundle.main).instantiateViewController(withIdentifier: String(describing: self)) as! ProfileViewController
    }
  
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
  
}
extension ProfileViewController : UITableViewDataSource , UITableViewDelegate , UpdateProfile 
{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "profile_cell", for: indexPath) as! ProfileCellTableViewCell
        cell.attributeName.text = attributeNames[indexPath.row]
        if indexPath.row == 0 // title
        {
            cell.attributeValue.text = userData?.title ?? ""
        }
        else if indexPath.row == 1 // full Name
        {
            cell.attributeValue.text = userData?.userName?.fullName ?? ""
        }
        else if indexPath.row == 2 // gender
        {
            cell.attributeValue.text = userData?.gender ?? ""
        }
        else if indexPath.row == 3 // phone
        {
            cell.attributeValue.text = userData?.userContact?.mobilePhone ?? ""
        }
        else if indexPath.row == 4 // country
        {
            cell.attributeValue.text = userData?.userAddress?.country ?? ""
        }
        else if indexPath.row == 5 // address
        {
            cell.attributeValue.text = userData?.userAddress?.fullAddress ??  ""
        }
        else if indexPath.row == 6 // membership
        {
            cell.attributeValue.text = userData?.userCustomer?.membershipNumber ??  ""
        }
      
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        if indexPath.row == 0
//        {
//
//            let dialogViewController: ChooseBookingDateOptionDialogue = ChooseBookingDateOptionDialogue(nibName:"ChooseBookingDateOptionDialogue", bundle: nil)
//            dialogViewController.delegate = self
//
//            self.presentDialogViewController(dialogViewController, animationPattern: LSAnimationPattern.zoomInOut, completion: { () -> Void in })
//
//        }
//       else
            if indexPath.row == 0 || indexPath.row == 2 || indexPath.row == 4
        {
            let dialogViewController: DropDownDialogue = DropDownDialogue(nibName:"DropDownDialogue", bundle: nil)
            dialogViewController.delegate = self

            if indexPath.row == 0 // update title
            {
                dialogViewController.optionArray = titleList
                dialogViewController.optionId = Array(repeating: 0, count: titleList.count)
                dialogViewController.currentOption = self.userData?.title ?? ""
                dialogViewController.type = .title
            }
            else if indexPath.row == 2 // update gender
            {
                dialogViewController.optionArray = genderList
                dialogViewController.optionId = Array(repeating: 0, count: genderList.count)
                dialogViewController.currentOption = self.userData?.gender ?? ""
                dialogViewController.type = .gender


            }
            else if indexPath.row == 4 // update country
            {
                dialogViewController.optionArray = countries
                dialogViewController.optionId = Array(repeating: 0, count: countries.count)
                dialogViewController.currentOption = self.userData?.userAddress?.country ?? ""
                dialogViewController.type = .country
            }
            
            self.presentDialogViewController(dialogViewController, animationPattern: LSAnimationPattern.zoomInOut, completion: { () -> Void in })
        }
            
        else if indexPath.row == 1 // update name
        {
            let dialogViewController: UpdateNameDialogue = UpdateNameDialogue(nibName:"UpdateNameDialogue", bundle: nil)
            dialogViewController.delegate = self

            dialogViewController.fname = self.userData?.userName?.firstName ?? ""
            dialogViewController.lname = self.userData?.userName?.lastName ?? ""
            dialogViewController.mname = self.userData?.userName?.middleName ?? ""
            self.presentDialogViewController(dialogViewController, animationPattern: LSAnimationPattern.zoomInOut, completion: { () -> Void in })
        }
        else if indexPath.row == 3 // update phone
        {
            let dialogViewController: UpdatePhoneDialogue = UpdatePhoneDialogue(nibName:"UpdatePhoneDialogue", bundle: nil)
            dialogViewController.delegate = self
            dialogViewController.phone = self.userData?.userContact?.mobilePhone ?? ""
            dialogViewController.landline = self.userData?.userContact?.landLine ?? ""
            self.presentDialogViewController(dialogViewController, animationPattern: LSAnimationPattern.zoomInOut, completion: { () -> Void in })

        }
        else if indexPath.row == 5 // update Address
        {
            let dialogViewController: UpdateAddressDialogue = UpdateAddressDialogue(nibName:"UpdateAddressDialogue", bundle: nil)
            dialogViewController.delegate = self
            dialogViewController.line1 = self.userData?.userAddress?.addressLine1 ?? ""
            dialogViewController.line2 = self.userData?.userAddress?.addressLine2 ?? ""
            dialogViewController.line3 = self.userData?.userAddress?.addressLine3 ?? ""
            dialogViewController.cityStr = self.userData?.userAddress?.city ?? ""
            dialogViewController.stateStr = self.userData?.userAddress?.state ?? ""
            dialogViewController.postalCodeStr = self.userData?.userAddress?.zip ?? ""
            self.presentDialogViewController(dialogViewController, animationPattern: LSAnimationPattern.zoomInOut, completion: { () -> Void in })
        }
        
        
        else // show membership
        {
            let dialogViewController: MembershipInfoDialogue = MembershipInfoDialogue(nibName:"MembershipInfoDialogue", bundle: nil)
            dialogViewController.delegate = self
            self.presentDialogViewController(dialogViewController, animationPattern: LSAnimationPattern.zoomInOut, completion: { () -> Void in })
            
        }
     
        

    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 80
    }
    func reloadProfile(user:UserProfile) {
        self.userData = user
        self.tableView.reloadData()
    }

}
