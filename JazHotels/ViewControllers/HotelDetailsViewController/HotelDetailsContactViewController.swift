//
//  HotelDetailsContactViewController.swift
//  JazHotels
//
//  Created by Nada Gamal Mohamed on 7/14/18.
//  Copyright © 2018 Jaz. All rights reserved.
//

import UIKit
import XLPagerTabStrip
import SCLAlertView
import Messages
import MessageUI
import SafariServices
class HotelDetailsContactViewController: UITableViewController , IndicatorInfoProvider , MFMailComposeViewControllerDelegate , SFSafariViewControllerDelegate{
    var itemInfo: IndicatorInfo = "Contact"
    var hotel:JHotelDescriptiveContent!
    @IBOutlet weak var websiteLbl: UILabel!
    @IBOutlet weak var websiteCell: UITableViewCell!
    @IBOutlet weak var mailLbl: UILabel!
    @IBOutlet weak var messageCell: UITableViewCell!
    @IBOutlet weak var phoneCell: UITableViewCell!
    @IBOutlet weak var locationCell: UITableViewCell!
    @IBOutlet weak var locationLbl: UILabel!
    
    @IBOutlet weak var footerCell: UITableViewCell!
    @IBOutlet weak var phoneLbl: UILabel!
    init(itemInfo: IndicatorInfo) {
        self.itemInfo = itemInfo
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if hotel.contactInfos != nil && hotel.contactInfos.contactInfo != nil && hotel.contactInfos.contactInfo.addresses != nil && hotel.contactInfos.contactInfo.addresses.address != nil && hotel.contactInfos.contactInfo.addresses.address.addressLine != nil && hotel.contactInfos.contactInfo.addresses.address.addressLine.count>0{
            locationLbl.text = hotel.contactInfos.contactInfo.addresses.address.addressLine[0] + "  -  " + hotel.contactInfos.contactInfo.addresses.address.cityName
            
        }
        if hotel.contactInfos != nil && hotel.contactInfos.contactInfo != nil && hotel.contactInfos.contactInfo.phones != nil && hotel.contactInfos.contactInfo.phones.phone != nil && hotel.contactInfos.contactInfo.phones.phoneNumber != nil{
        phoneLbl.text = hotel.contactInfos.contactInfo.phones.phoneNumber
    }
        if hotel.contactInfos != nil && hotel.contactInfos.contactInfo != nil && hotel.contactInfos.contactInfo.emails != nil && hotel.contactInfos.contactInfo.emails.email != nil{
         mailLbl.text = hotel.contactInfos.contactInfo.emails.email
        }
      if JazHotels.hotelsURLs![hotel.hotelCode] != nil{
        websiteLbl.text = JazHotels.hotelsURLs![hotel.hotelCode]!
        }
        
        
}

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: - IndicatorInfoProvider
    
    

    @IBAction func bookNowAction(_ sender: Any) {
        //  navigationController?.show(BookHotelViewController.create(), sender: sender)
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "BookHotel"), object: hotel)
        self.tabBarController?.selectedIndex = 2
    }
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return itemInfo
    }
    @objc public static func create() -> HotelDetailsContactViewController {
        
        return UIStoryboard(name: HotelJazConstants.StoryBoard.mainSB, bundle: Bundle.main).instantiateViewController(withIdentifier: String(describing: self)) as! HotelDetailsContactViewController
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0{
            // location
            let viewController = HotelOnMapViewController.create()
            if let location =  JazHotels.hotelsCoords![(hotel.hotelCode)!]{
                viewController.hotelLocation = Location(latitude: Double(location[0] )! , longtitude: Double(location[1] )!)
                viewController.hotelNameTitle = hotel.hotelName
                self.navigationController?.show(viewController, sender: self)
            }
            
            
        }
        else if indexPath.row == 1{
          //phone
            if hotel.contactInfos.contactInfo.phones.phoneNumber != nil{
            if let url = URL(string: "tel://" + hotel.contactInfos.contactInfo.phones.phoneNumber) {
                UIApplication.shared.openURL(url)
            }
            }
        }
        else if indexPath.row == 2{
            //Message
            if !MFMailComposeViewController.canSendMail() {
                print("Mail services are not available")
                SCLAlertView().showError("", subTitle: "Mail services are not available")
                return
            }
            else{
                let composeVC = MFMailComposeViewController()
                composeVC.mailComposeDelegate = self
                
                // Configure the fields of the interface.
                composeVC.setToRecipients([hotel.contactInfos.contactInfo.emails.email])
                composeVC.setSubject(hotel.hotelName)
                composeVC.setMessageBody("Hotel Address" + hotel.contactInfos.contactInfo.addresses.address.addressLine[0] + "  -  " + hotel.contactInfos.contactInfo.addresses.address.cityName, isHTML: false)
                
                // Present the view controller modally.
                self.present(composeVC, animated: true, completion: nil)
            }
        }
        else if indexPath.row == 3{
            // website
            let safariVC = SFSafariViewController(url: NSURL(string: JazHotels.hotelsURLs![hotel.hotelCode]!) as! URL)
            self.present(safariVC, animated: true, completion: nil)
            safariVC.delegate = self
            
        }
        else if indexPath.row == 4{
            
        }
    }
    func safariViewControllerDidFinish(controller: SFSafariViewController) {
        controller.dismiss(animated: true, completion: nil)
    }
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        self.dismiss(animated: true, completion: nil)
    }
}
