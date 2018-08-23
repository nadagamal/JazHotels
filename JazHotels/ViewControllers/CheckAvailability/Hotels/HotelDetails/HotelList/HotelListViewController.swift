//
//  HotelListViewController.swift
//  JazHotels
//
//  Created by Zeinab Reda on 7/5/18.
//  Copyright © 2018 Jaz. All rights reserved.
//

import UIKit
import Kingfisher
import SCLAlertView

class HotelListViewController: UIViewController {

    @IBOutlet weak var hotelTB: UITableView!
    var roomStays: [JCRoomStay]?
    var roomStayInfo: JCBasicPropertyInfo?
    var roomInfoList: [JCCriterion]?
    var hotelTitle:String?
    override func viewDidLoad() {
        super.viewDidLoad()

//        self.navigationItem.title = hotelTitle
        // Do any additional setup after loading the view.
        hotelTB.register(UINib(nibName: "HotelTableViewCell", bundle: nil), forCellReuseIdentifier: "hotel_cell")

        NotificationCenter.default.addObserver(self, selector: #selector(self.updateHotelList(notification:)), name: Notification.Name("getHotelListInfo"), object: nil)

       
    }
    
    @objc public static func create() -> HotelListViewController {
        
        return UIStoryboard(name: HotelJazConstants.StoryBoard.mainSB, bundle: Bundle.main).instantiateViewController(withIdentifier: String(describing: self)) as! HotelListViewController
    }
    
    @objc func updateHotelList(notification: Notification){
        
        self.roomStays = notification.userInfo!["roomStays"] as? [JCRoomStay]
        self.roomStayInfo = notification.userInfo!["roomStayInfo"] as? JCBasicPropertyInfo
        self.roomInfoList = notification.userInfo!["roomInfoList"] as? [JCCriterion]
        self.hotelTitle = notification.userInfo!["hotelTitle"] as? String
        self.hotelTB.reloadData()

    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationItem.title = hotelTitle
        self.navigationController?.navigationBar.isHidden = false
        NotificationCenter.default.addObserver(self, selector: #selector(self.updateHotelList(notification:)), name: Notification.Name("getHotelListInfo"), object: nil)

    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
extension HotelListViewController: UITableViewDelegate , UITableViewDataSource
{
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = hotelTB.dequeueReusableCell(withIdentifier: "hotel_cell") as! HotelTableViewCell
        cell.hotel_name.text = roomStays?[indexPath.row].basicPropertyInfo.hotelName
      
        cell.hotel_place.text = roomStayInfo?.address.cityName
        if (roomStays?[indexPath.row].roomRates?.roomRate.count)!>0 && roomStays?[indexPath.row].roomRates?.roomRate?[0].rates != nil &&  (roomStays?[indexPath.row].roomRates?.roomRate?[0].rates?.rate.tpaExtensions.nightlyRate?.count)!>0{
        cell.hotel_price.text = roomStays?[indexPath.row].roomRates?.roomRate?[0].rates?.rate.tpaExtensions.nightlyRate?[0].price ?? "0"
        }
        if  JazHotels.hotelsImages![(roomStays?[indexPath.row].basicPropertyInfo.hotelCode)!]?[0] != nil
        {
            let imageURL = URL(string: (JazHotels.hotelsImages![(roomStays?[indexPath.row].basicPropertyInfo.hotelCode)!]?[0])!)
            cell.hotel_img.kf.indicatorType = .activity
            cell.hotel_img.kf.setImage(with: imageURL, placeholder: UIImage(named: "jazLauncherLogo"), options: [.transition(ImageTransition.fade(0.7))], progressBlock: nil, completionHandler: nil)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return (roomStays?.count)!
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 280
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        var rateView = RatePlansViewController.create()
        if roomStays?[indexPath.row].roomRates?.roomRate?.count != 0
        {
            rateView.roomRateList = (roomStays?[indexPath.row].roomRates?.roomRate)!
            rateView.ratePlans = roomStays?[indexPath.row].ratePlans

            self.navigationController?.pushViewController(rateView, animated: true)
        }
        else
        {
            DispatchQueue.main.async {
                SCLAlertView().showInfo("", subTitle: "No Rates avaiable")
                
            }
        }
    }
}
