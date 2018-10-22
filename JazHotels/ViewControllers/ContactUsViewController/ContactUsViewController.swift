//
//  ContactUsViewController.swift
//  JazHotels
//
//  Created by Nada Gamal Mohamed on 10/17/18.
//  Copyright © 2018 Jaz. All rights reserved.
//

import UIKit
import MessageUI
import Messages
import SCLAlertView
class ContactUsViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableView.tableFooterView = UIView(frame: CGRect.zero)
        self.title = "Contact Us"
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func linkedInAction(_ sender: Any) {
        if #available(iOS 10.0, *) {
            UIApplication.shared.open(URL(string: "https://www.linkedin.com/company/jazhotelgroup/")!, options: [:]) { (handler) in
                
            }
        } else {
            // Fallback on earlier versions
        }
    }
    @IBAction func pintrestAction(_ sender: Any) {
        if #available(iOS 10.0, *) {
            UIApplication.shared.open(URL(string: "https://www.pinterest.com/jazhotelgroup/")!, options: [:]) { (handler) in
                
            }
        } else {
            // Fallback on earlier versions
        }
    }
    @IBAction func twitterAction(_ sender: Any) {
        if #available(iOS 10.0, *) {
            UIApplication.shared.open(URL(string: "https://twitter.com/Jaz_Hotels?lang=en")!, options: [:]) { (handler) in
                
            }
        } else {
            // Fallback on earlier versions
        }
    }
    @IBAction func youtubeAction(_ sender: Any) {
        if #available(iOS 10.0, *) {
            UIApplication.shared.open(URL(string: "https://www.youtube.com/channel/UCqSBDQ8ceZN4JCqy756JIgA?view_as=subscriber")!, options: [:]) { (handler) in
                
            }
        } else {
            // Fallback on earlier versions
        }
    }
    @IBAction func facebookAction(_ sender: Any) {
        if #available(iOS 10.0, *) {
            UIApplication.shared.open(URL(string: "https://www.facebook.com/jazhotelgroup/")!, options: [:]) { (handler) in
                
            }
        } else {
            // Fallback on earlier versions
        }
    }
    
    @IBAction func instagramAction(_ sender: Any) {
        if #available(iOS 10.0, *) {
            UIApplication.shared.open(URL(string: "https://www.instagram.com/jazhotelgroup/")!, options: [:]) { (handler) in
                
            }
        } else {
            // Fallback on earlier versions
        }
        
    }
}
extension ContactUsViewController: UITableViewDelegate , UITableViewDataSource,MFMailComposeViewControllerDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell:MenuCell!
        if indexPath.row == 0{
            cell = tableView.dequeueReusableCell(withIdentifier: "TelCell") as! MenuCell
            return cell
        }
        else if indexPath.row == 1{
            cell = tableView.dequeueReusableCell(withIdentifier: "WhatsappCell") as! MenuCell
            return cell
        }
        else if indexPath.row == 2{
            cell = tableView.dequeueReusableCell(withIdentifier: "MailCell") as! MenuCell
            return cell
        }
        cell.selectionStyle = UITableViewCellSelectionStyle.none

        return cell;
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0{
            if let url = URL(string: "tel://" + "0238541111") {
                UIApplication.shared.openURL(url)
            }
        }
        else if indexPath.row == 1{
            if let url = URL(string: "tel://" + "01202222782") {
                UIApplication.shared.openURL(url)
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
                composeVC.setToRecipients(["info@jazhotels.com"])
                composeVC.setSubject("Contact Us")
//                composeVC.setMessageBody("Hotel Address" + hotel.contactInfos.contactInfo.addresses.address.addressLine[0] + "  -  " + hotel.contactInfos.contactInfo.addresses.address.cityName, isHTML: false)
                
                // Present the view controller modally.
                self.present(composeVC, animated: true, completion: nil)
            }
        }
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        self.dismiss(animated: true, completion: nil)
    }
}
