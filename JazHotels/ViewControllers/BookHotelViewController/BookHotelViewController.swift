//
//  BookHotelViewController.swift
//  JazHotels
//
//  Created by Nada Gamal Mohamed on 9/11/18.
//  Copyright © 2018 Jaz. All rights reserved.
//

import UIKit
import SCLAlertView
import SVProgressHUD
class BookHotelViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var roomType:JCRoomType!
    var ratePlan:JCRatePlan!
    var checkInDate:String!
    var checkOutDate:String!
    var chainCode:String!
    var hotelCode:String!
    var roomNum:String!
    var childNum:String!
    var adultsNum:String!
    var amountAfterTax:String!
    var amountBeforeTax:String!
    var hotelName:String!
    var currencyCode:String!
    var isChecked = false
    var userData:UserProfile!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableView.register(UINib(nibName: "CreditCardCell", bundle: nil), forCellReuseIdentifier: "CreditCardCell")

//       tableView.register(UINib(nibName: "CreditCardCell", bundle: nil), forCellReuseIdentifier: "CreditCardCell")
        //tableView.tableFooterView = UIView()
        tableView.tableHeaderView = UIView()
    userData = UserDefaults.getObjectDefault(key: HotelJazConstants.userDefault.userData) as? UserProfile

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @objc public static func create() -> BookHotelViewController {
        
        return UIStoryboard(name: HotelJazConstants.StoryBoard.mainSB, bundle: Bundle.main).instantiateViewController(withIdentifier: String(describing: self)) as! BookHotelViewController
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    func bookRoom(state:String,completion:  @escaping (_ :CBReservation?) -> Void){
        BookingAPIManager().reserveRoom(numberOfAdults: adultsNum, numberOfChild: childNum, numberOfRooms: roomNum, roomTypeCode: roomType.roomTypeCode, ratePlanCode: ratePlan.ratePlanCode, checkInDate: checkInDate, checkOutDate: checkOutDate, hotelCode: hotelCode, chainCode: chainCode, creditCardNum: userData.userCardPayment?.cardNumber?.replacingOccurrences(of: " ", with: "", options: .literal, range: nil) ?? "", creditCardExpireDate: userData.userCardPayment?.expireDate ?? "", cardNameHolder: userData.userCardPayment?.cardHolderName ?? "", state: state) { (response, error) in
            if (response?.body != nil && response?.body.oTAHotelResRS.errors != nil && response?.body.oTAHotelResRS.errors.error != nil && response?.body.oTAHotelResRS.errors.error.shortText != nil){
                DispatchQueue.main.async {
                    SVProgressHUD.dismiss()
                    SCLAlertView().showError("Error", subTitle: response?.body.oTAHotelResRS.errors.error.shortText ?? "")
                    
                }
            }
            else{
               // SCLAlertView().showSuccess("", subTitle: "Modification Successed")
                completion(response)
            }
        }
    }
    @IBAction func confirmReservationAction(_ sender: Any) {
        if isChecked == false{
            SCLAlertView().showWarning("", subTitle: "Please agree on policy first")
        }
        else if userData.userCardPayment?.cardHolderName != nil && userData.userCardPayment?.cardNumber != nil && (userData.userCardPayment?.cardNumber?.count)! >= 14 && userData.userCardPayment?.cardCode != nil && userData.userCardPayment?.expireDate != nil{
        SVProgressHUD.show()
            self.bookRoom(state: "Initiate") { (response) in
                DispatchQueue.main.async {
                    self.bookRoom(state: "Commit") { (response) in
                        DispatchQueue.main.async {
                            SVProgressHUD.dismiss()
                        SCLAlertView().showSuccess("", subTitle: "Done")
                            var reservationItem = FirestoreHotelReservation(JSON: [:])
                            reservationItem?.adultsQuantity = self.adultsNum
//                            reservationItem?.amountAfterTax = ratePlan.ratePlanDescription.
                            reservationItem?.childrenQuantity = self.childNum
                            reservationItem?.cancellationPolicy = response?.body.oTAHotelResRS.hotelReservations.hotelReservation.roomStays.roomStay.cancelPenalties.cancelPenalty.penaltyDescription.text.replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression, range: nil)
                            reservationItem?.guaranteePolicy = self.ratePlan.guarantee.guaranteeDescription.text.replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression, range: nil)
                            reservationItem?.numberOfUnits = self.roomNum
                            reservationItem?.ratePlanCode = response?.body.oTAHotelResRS.hotelReservations.hotelReservation.roomStays.roomStay.ratePlans.ratePlan.ratePlanCode
                            reservationItem?.ratePlanName = response?.body.oTAHotelResRS.hotelReservations.hotelReservation.roomStays.roomStay.ratePlans.ratePlan.ratePlanName
                            reservationItem?.roomTypeCode = response?.body.oTAHotelResRS.hotelReservations.hotelReservation.roomStays.roomStay.roomTypes.roomType.roomTypeCode
                            reservationItem?.checkIn = self.checkInDate
                            reservationItem?.checkOut = self.checkOutDate
                            reservationItem?.roomTypeName = response?.body.oTAHotelResRS.hotelReservations.hotelReservation.roomStays.roomStay.roomTypes.roomType.roomDescription.name
                            reservationItem?.hotelCode = self.hotelCode
                            reservationItem?.hotelName = self.hotelName
                            reservationItem?.chainCode = self.chainCode
                            reservationItem?.amountAfterTax = response?.body.oTAHotelResRS.hotelReservations.hotelReservation.resGlobalInfo.total.amountAfterTax
                            reservationItem?.amountBeforeTax = response?.body.oTAHotelResRS.hotelReservations.hotelReservation.resGlobalInfo.total.amountBeforeTax
                            reservationItem?.specialRequests = ""
                            reservationItem?.currencyCode = response?.body.oTAHotelResRS.hotelReservations.hotelReservation.resGlobalInfo.total.currencyCode
                            reservationItem?.status = response?.body.oTAHotelResRS.resResponseType
                            reservationItem?.confirmationId = response?.body.oTAHotelResRS.hotelReservations.hotelReservation.uniqueID.iD; UserOperation.addReservation(firestoreHotelReservation:reservationItem! )
                        }
                        
                    }
                }

            }
    
        }
        else{
            SCLAlertView().showWarning("", subTitle: "Please Fill Missing Fields")

        }
    }
    @objc func editBtnPressed(sender:UIButton){
        let indexPath = NSIndexPath(row: 0, section: 0)
        let cell = tableView.cellForRow(at: indexPath as IndexPath) as! CreditCardCell
        cell.cardNameTxt.isUserInteractionEnabled = true
        cell.cardNumberTxt.isUserInteractionEnabled = true
        cell.cvcTxt.isUserInteractionEnabled = true
        cell.cardExpirationDateTxt.isUserInteractionEnabled = true
        cell.cardNameTxt.becomeFirstResponder()
    }
    @objc func agreeBtnAction(sender:UIButton){
        let indexPath = NSIndexPath(row: 3, section: 1)
        let cell = tableView.cellForRow(at: indexPath as IndexPath) as! InfoCell
        if cell.agreeBtn.imageView?.image == UIImage(named: "checkDone"){
            cell.agreeBtn .setImage(UIImage(named: "check"), for: .normal)
        isChecked = false
        }
        else{
            cell.agreeBtn .setImage(UIImage(named: "checkDone"), for: .normal)
            isChecked = true

        }
    }
}
extension BookHotelViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell:UITableViewCell!
        
        if indexPath.row == 0 && indexPath.section == 0{
           let cell = tableView.dequeueReusableCell(withIdentifier: "CreditCardCell") as! CreditCardCell
            if userData.userCardPayment != nil{
                cell.cardNameTxt.text = userData.userCardPayment?.cardHolderName
                cell.cardNumberTxt.text = userData.userCardPayment?.cardNumber
                cell.cvcTxt.text = userData.userCardPayment?.cardCode
                cell.cardExpirationDateTxt.text = userData.userCardPayment?.expireDate
            }
            return cell
        }
        else if indexPath.section == 1{
         if indexPath.row == 0{
           let cell = tableView.dequeueReusableCell(withIdentifier: "CardEditBtnCell") as! InfoCell
            cell.editCreditCardBtn.addTarget(self, action: #selector(editBtnPressed), for: .touchUpInside)
            return cell

        }
        
        else if indexPath.row == 1{
            let cell = tableView.dequeueReusableCell(withIdentifier: "CancellationCell") as! InfoCell
            cell.cancellationsTxt.text = ratePlan.cancelPenalties.cancelPenalty.penaltyDescription.text.replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression, range: nil)
            return cell
        }
        else  if indexPath.row == 2{
           let cell = tableView.dequeueReusableCell(withIdentifier: "BookingCell") as! InfoCell
            cell.bookingTxt.text = ratePlan.guarantee.guaranteeDescription.text.replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression, range: nil)
            return cell
        }
        else  if indexPath.row == 3{
           let cell = tableView.dequeueReusableCell(withIdentifier: "CheckCell") as! InfoCell
            cell.agreeBtn.addTarget(self, action: #selector(agreeBtnAction), for: .touchUpInside)
            return cell
        }
        }
        return cell
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0{
            return 1
        }
        return 4
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 185.0
        }
        else{
         if indexPath.row == 0 {
            return 65.0
        }
        else if indexPath.row == 1{
            return 100
        }
        else if indexPath.row == 2 {
            return 150
        }
        }
      return 70
    }
  
}
