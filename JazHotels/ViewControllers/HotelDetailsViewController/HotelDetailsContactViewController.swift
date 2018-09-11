//
//  HotelDetailsContactViewController.swift
//  JazHotels
//
//  Created by Nada Gamal Mohamed on 7/14/18.
//  Copyright © 2018 Jaz. All rights reserved.
//

import UIKit
import XLPagerTabStrip
class HotelDetailsContactViewController: UITableViewController , IndicatorInfoProvider{
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
        navigationController?.show(BookHotelViewController.create(), sender: sender)

    }
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return itemInfo
    }
    @objc public static func create() -> HotelDetailsContactViewController {
        
        return UIStoryboard(name: HotelJazConstants.StoryBoard.mainSB, bundle: Bundle.main).instantiateViewController(withIdentifier: String(describing: self)) as! HotelDetailsContactViewController
    }
}
