//
//  BookingDetailsViewController.swift
//  JazHotels
//
//  Created by Nada Gamal Mohamed on 9/11/18.
//  Copyright © 2018 Jaz. All rights reserved.
//

import UIKit
import Kingfisher
import SCLAlertView
import LSDialogViewController
import SVProgressHUD
class BookingDetailsViewController: UIViewController,changeBookingDates {
    
    @IBOutlet weak var tableView: UITableView!
    var reservationItem:JBHotelReservation!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.title = reservationItem.roomStays.roomStay.basicPropertyInfo.hotelName
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func modifyReservationAction(_ sender: Any) {
        
        let dialogViewController: ChooseBookingDateOptionDialogue = ChooseBookingDateOptionDialogue(nibName:"ChooseBookingDateOptionDialogue", bundle: nil)
        dialogViewController.delegate = self
        
        self.presentDialogViewController(dialogViewController, animationPattern: LSAnimationPattern.zoomInOut, completion: { () -> Void in })
    }
    
    @IBAction func cancelReservationAction(_ sender: Any) {
        BookingAPIManager().cancelReservation(confirmationId: reservationItem.uniqueID.iD, hotelCode: reservationItem.roomStays.roomStay.basicPropertyInfo.hotelCode, chainCode: reservationItem.roomStays.roomStay.basicPropertyInfo.chainCode) { (bookingModel, error) in
            if error == nil{
                DispatchQueue.main.async {
                    if bookingModel?.soapBody.OTACancelRS.errors != nil && bookingModel?.soapBody.OTACancelRS.errors.error != nil && bookingModel?.soapBody.OTACancelRS.errors.error.shortText != nil{
                        DispatchQueue.main.async {
                            SCLAlertView().showError("Error", subTitle: bookingModel?.soapBody.OTACancelRS.errors.error.shortText ?? "")
                            
                        }
                    }else{
                        self.navigationController?.popViewController(animated: true)
                    }
                }
            }
            else{
                DispatchQueue.main.async {
                    
                    SCLAlertView().showError("Error", subTitle: "Reservation cannot cancelled")
                    
                }
            }
        }
    }
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    @objc public static func create() -> BookingDetailsViewController {
        
        return UIStoryboard(name: HotelJazConstants.StoryBoard.mainSB, bundle: Bundle.main).instantiateViewController(withIdentifier: String(describing: self)) as! BookingDetailsViewController
    }
    func getBookingDates(startDate: String, endDate: String, nights: String) {
        print(startDate)
        print(endDate)
        var childNum = "0"
        var adultNum = "0"
        if reservationItem.roomStays.roomStay.guestCounts.guestCount != nil && reservationItem.roomStays.roomStay.guestCounts.guestCount.count == 1{
            adultNum = reservationItem.roomStays.roomStay.guestCounts.guestCount[0].count
            
        }
        else if reservationItem.roomStays.roomStay.guestCounts.guestCount != nil && reservationItem.roomStays.roomStay.guestCounts.guestCount.count == 2{
            adultNum = reservationItem.roomStays.roomStay.guestCounts.guestCount[0].count
            childNum = reservationItem.roomStays.roomStay.guestCounts.guestCount[1].count
            
        }
        var ratePlanCode = ""
        if reservationItem.roomStays.roomStay.ratePlans != nil && reservationItem.roomStays.roomStay.ratePlans.count>0{
            ratePlanCode = reservationItem.roomStays.roomStay.ratePlans[0].ratePlanCode
        }
        SVProgressHUD.show()

        BookingAPIManager().modifyReservation(numberOfAdults: adultNum, numberOfChild: childNum, numberOfRooms: reservationItem.roomStays.roomStay.roomTypes.roomType?.numberOfUnits ?? "", roomTypeCode: reservationItem.roomStays.roomStay.roomTypes.roomType.roomTypeCode, ratePlanCode: ratePlanCode, checkInDate: startDate, checkOutDate: endDate, hotelCode: reservationItem.roomStays.roomStay.basicPropertyInfo.hotelCode, chainCode: reservationItem.roomStays.roomStay.basicPropertyInfo.chainCode, confirmationId: reservationItem.uniqueID.iD,comments: "") { (response, error) in
            if response?.Body.OTAHotelResModifyRS.errors != nil && response?.Body.OTAHotelResModifyRS.errors.error != nil && response?.Body.OTAHotelResModifyRS.errors.error.shortText != nil{
                DispatchQueue.main.async {
                    SVProgressHUD.dismiss()
                    SCLAlertView().showError("Error", subTitle: response?.Body.OTAHotelResModifyRS.errors.error.shortText ?? "")

                }
            }
            else{
                DispatchQueue.main.async {
                    SVProgressHUD.dismiss()
                    SCLAlertView().showSuccess("", subTitle: "Modification Successed")
                }
            }
            
        }
    }
    func getUserModifcation(choice: ModifyReservation) {
        switch choice {
        case .changeStayDates:
            let dialogViewController: SelectBookingDateDialogue = SelectBookingDateDialogue(nibName:"SelectBookingDateDialogue", bundle: nil)
            dialogViewController.delegate = self
            DispatchQueue.main.async {
                self.presentDialogViewController(dialogViewController, animationPattern: LSAnimationPattern.zoomInOut, completion: { () -> Void in })

            }
            
            break
        case .addtionalRequest:
            let dialogViewController: AddCustomStayDateDailogue = AddCustomStayDateDailogue(nibName:"AddCustomStayDateDailogue", bundle: nil)
            dialogViewController.delegate = self
            DispatchQueue.main.async {
            self.presentDialogViewController(dialogViewController, animationPattern: LSAnimationPattern.zoomInOut, completion: { () -> Void in })
            }
            break
            
        }
    }
    
    func getUserAddationalRequest(request: String) {
        var startDate = reservationItem.roomStays.roomStay.timeSpan.start
        var endDate = reservationItem.roomStays.roomStay.timeSpan.end
        var childNum = "0"
        var adultNum = "0"
        if reservationItem.roomStays.roomStay.guestCounts.guestCount != nil && reservationItem.roomStays.roomStay.guestCounts.guestCount.count == 1{
            adultNum = reservationItem.roomStays.roomStay.guestCounts.guestCount[0].count
            
        }
        else if reservationItem.roomStays.roomStay.guestCounts.guestCount != nil && reservationItem.roomStays.roomStay.guestCounts.guestCount.count == 2{
            adultNum = reservationItem.roomStays.roomStay.guestCounts.guestCount[0].count
            childNum = reservationItem.roomStays.roomStay.guestCounts.guestCount[1].count
            
        }
        var ratePlanCode = ""
        if reservationItem.roomStays.roomStay.ratePlans != nil && reservationItem.roomStays.roomStay.ratePlans.count>0{
            ratePlanCode = reservationItem.roomStays.roomStay.ratePlans[0].ratePlanCode
        }
        SVProgressHUD.show()

        BookingAPIManager().modifyReservation(numberOfAdults: adultNum, numberOfChild: childNum, numberOfRooms: reservationItem.roomStays.roomStay.roomTypes.roomType?.numberOfUnits ?? "", roomTypeCode: reservationItem.roomStays.roomStay.roomTypes.roomType.roomTypeCode, ratePlanCode: ratePlanCode, checkInDate: startDate ?? "", checkOutDate: endDate ?? "", hotelCode: reservationItem.roomStays.roomStay.basicPropertyInfo.hotelCode, chainCode: reservationItem.roomStays.roomStay.basicPropertyInfo.chainCode, confirmationId: reservationItem.uniqueID.iD,comments: request) { (response, error) in
            if (response?.Body.OTAHotelResModifyRS.errors != nil && response?.Body.OTAHotelResModifyRS.errors.error != nil && response?.Body.OTAHotelResModifyRS.errors.error.shortText != nil) || response?.Body.OTAHotelResModifyRS.ResResponseType == "Unsuccessful"{
                DispatchQueue.main.async {
                    SVProgressHUD.dismiss()

                    SCLAlertView().showError("Error", subTitle: response?.Body.OTAHotelResModifyRS.errors.error.shortText ?? "")
                    
                }
            }
            else{
                DispatchQueue.main.async {
                    SVProgressHUD.dismiss()
                    SCLAlertView().showSuccess("", subTitle: "Modification Successed")
                }
                
            }
            
        }
    }
    
}
extension BookingDetailsViewController:UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell:UITableViewCell!
        
        if indexPath.row == 0{
            let cell = tableView.dequeueReusableCell(withIdentifier: "HotelDetailsCell") as! HotelTableViewCell
            cell.hotel_name.text = reservationItem.roomStays.roomStay.basicPropertyInfo.hotelName
            cell.hotel_place.text = reservationItem.roomStays.roomStay.basicPropertyInfo.address.cityName
            if  JazHotels.hotelsImages![reservationItem.roomStays.roomStay.basicPropertyInfo.hotelCode!]?[0] != nil{
                let imageURL = URL(string: ((JazHotels.hotelsImages![reservationItem.roomStays.roomStay.basicPropertyInfo.hotelCode!]?[0])!))
                cell.hotel_img.kf.indicatorType = .activity
                cell.hotel_img.kf.setImage(with: imageURL, placeholder: UIImage(named: "jazLauncherLogo"), options: [.transition(ImageTransition.fade(0.7))], progressBlock: nil, completionHandler: nil)
                cell.jazLogoImg.isHidden = true
            }
            return cell
        }
        else if indexPath.row == 1{
            let cell = tableView.dequeueReusableCell(withIdentifier: "DateCell") as! BookingDetailsCell
            cell.leftValueLbl.text = reservationItem.roomStays.roomStay.timeSpan.start
            cell.rightValueLbl.text = reservationItem.roomStays.roomStay.timeSpan.end
            return cell
        }
        else  if indexPath.row == 2{
            let cell = tableView.dequeueReusableCell(withIdentifier: "RatePlanCell") as! BookingDetailsCell
            cell.leftValueLbl.text = reservationItem.roomStays.roomStay.roomTypes.roomType.roomDescription.name
            if reservationItem.roomStays.roomStay.roomTypes.roomType.additionalDetails != nil && reservationItem.roomStays.roomStay.roomTypes.roomType.additionalDetails.additionalDetail.count > 0{
                cell.rightValueLbl.text = reservationItem.roomStays.roomStay.roomTypes.roomType.additionalDetails.additionalDetail[0].detailDescription.text
            }
            return cell
        }
        else  if indexPath.row == 3{
            let cell = tableView.dequeueReusableCell(withIdentifier: "RoomDetailsCell") as! BookingDetailsCell
            var childNum = "0"
            var adultNum = "0"
            cell.leftValueLbl.text = reservationItem.roomStays.roomStay.roomTypes.roomType.numberOfUnits ?? "" + " Room"
            if reservationItem.roomStays.roomStay.guestCounts.guestCount != nil && reservationItem.roomStays.roomStay.guestCounts.guestCount.count == 1{
                adultNum = reservationItem.roomStays.roomStay.guestCounts.guestCount[0].count
                cell.rightValueLbl.text = adultNum + "adults"
                
            }
            else if reservationItem.roomStays.roomStay.guestCounts.guestCount != nil && reservationItem.roomStays.roomStay.guestCounts.guestCount.count == 2{
                adultNum = reservationItem.roomStays.roomStay.guestCounts.guestCount[0].count
                childNum = reservationItem.roomStays.roomStay.guestCounts.guestCount[1].count
                cell.rightValueLbl.text = adultNum + " adults, " + childNum + " childern"
                
            }
            return cell
            
        }
        else  if indexPath.row == 4{
            let cell = tableView.dequeueReusableCell(withIdentifier: "ConfirmationCodeCell") as! BookingDetailsCell
            cell.leftValueLbl.text = reservationItem.uniqueID.iD
            return cell
            
        }
        else  if indexPath.row == 5{
            let cell = tableView.dequeueReusableCell(withIdentifier: "PriceCell") as! BookingDetailsCell
            cell.rightValueLbl.text = reservationItem.roomStays.roomStay.total.amountAfterTax + "$"
            return cell
            
        }
        else  if indexPath.row == 6{
            cell = tableView.dequeueReusableCell(withIdentifier: "InfoCell")
        }
        return cell
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0{
            return 188
        }
        else if indexPath.row == 1{
            return 57
        }
        else  if indexPath.row == 2{
            return 75
        }
        else  if indexPath.row == 3{
            return 57
        }
        else  if indexPath.row == 4{
            return 57
        }
        else  if indexPath.row == 5{
            return 57
        }
        else{
            return 157
        }
    }
}
