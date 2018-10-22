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
    var checkInDate:String!
    var checkOutDate:String!
    var chainCode:String!
    var hotelCode:String!
    var roomNum:String!
    var childNum:String!
    var adultsNum:String!
    var userInfo:Dictionary<String, Any>!
    override func viewDidLoad() {
        super.viewDidLoad()

//        self.navigationItem.title = hotelTitle
        // Do any additional setup after loading the view.
        hotelTB.register(UINib(nibName: "HotelTableViewCell", bundle: nil), forCellReuseIdentifier: "hotel_cell")
//        NotificationCenter.default.addObserver(self, selector: #selector(self.updateHotelList(notification:)), name: Notification.Name("getHotelListInfo"), object: nil)
        if userInfo != nil{
            updateHotelList()
        }
       
    }
    
    @objc public static func create() -> HotelListViewController {
        
        return UIStoryboard(name: HotelJazConstants.StoryBoard.mainSB, bundle: Bundle.main).instantiateViewController(withIdentifier: String(describing: self)) as! HotelListViewController
    }
    
    @objc func updateHotelList(){
        
        self.roomStays = userInfo!["roomStays"] as? [JCRoomStay]
        self.roomStayInfo = userInfo!["roomStayInfo"] as? JCBasicPropertyInfo
        self.roomInfoList = userInfo!["roomInfoList"] as? [JCCriterion]
        self.hotelTitle = userInfo!["hotelTitle"] as? String
        self.hotelTB.reloadData()

    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationItem.title = hotelTitle
        self.navigationController?.navigationBar.isHidden = false
//        NotificationCenter.default.addObserver(self, selector: #selector(self.updateHotelList(notification:)), name: Notification.Name("getHotelListInfo"), object: nil)

    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func getRoomPrice(ratePlanCode:String,roomStay:JCRoomStay) ->String {
        var price:String = ""
        for rate in roomStay.roomRates.roomRate{
            if rate.ratePlanCode == ratePlanCode{
                if rate.rates.rate.base.amountBeforeTax != nil{
                price = rate.rates.rate.base.amountBeforeTax
                }
//                else if rate.rates.rate.total.amountAfterTax != nil{
//                    price = rate.rates.rate.total.amountAfterTax
//                }
                break
            }
        }
        return price
    }
    func getHotelLocation(hotelCode:String)->String{
        for hotel in JazHotels.hotels{
            if hotel.hotelCode == hotelCode && hotel.contactInfos.contactInfo.addresses.address.addressLine != nil && hotel.contactInfos.contactInfo.addresses.address.addressLine.count>1{
                let location = hotel.contactInfos.contactInfo.addresses.address.addressLine[1] + "  -  " + hotel.contactInfos.contactInfo.addresses.address.cityName
                return location
            }
        }
        return ""
    }
    @objc func favBtnAction(sender:UIButton){
        guard let cell = sender.superview?.superview?.superview as? HotelTableViewCell else {
            return
        }

        var list = [String]()
        if UserDefaults.standard.object(forKey: "Favourites") != nil{
            list = UserDefaults.standard.object(forKey: "Favourites") as! [String]
        }
        if list.count>0 && list .contains((roomStays?[sender.tag].basicPropertyInfo.hotelCode)!){
            for i in 0...list.count-1{
                list.remove(at: i)
                break
                
            }
            cell.fav_btn .setImage(#imageLiteral(resourceName: "favHeader"), for: .normal)

        }
        else{
            cell.fav_btn .setImage(#imageLiteral(resourceName: "addFavH"), for: .normal)
            list.append((roomStays?[sender.tag].basicPropertyInfo.hotelCode)!)
        }
        UserDefaults.standard.set(list, forKey: "Favourites")
        UserDefaults.standard.synchronize()
    }
    
}
extension HotelListViewController: UITableViewDelegate , UITableViewDataSource
{
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = hotelTB.dequeueReusableCell(withIdentifier: "hotel_cell") as! HotelTableViewCell
        cell.hotel_name.text = roomStays?[indexPath.row].basicPropertyInfo.hotelName
      
        cell.hotel_place.text = getHotelLocation(hotelCode: roomStays?[indexPath.row].basicPropertyInfo.hotelCode ?? "")
        cell.fav_btn.tag = indexPath.row
        cell.fav_btn.addTarget(self, action: #selector(favBtnAction), for: .touchUpInside)
        if (roomStays?[indexPath.row].ratePlans != nil && roomStays?[indexPath.row].ratePlans != nil && (roomStays?[indexPath.row].ratePlans.count)!>0){
            let ratePlan:JCRatePlan = (roomStays?[indexPath.row].ratePlans[0])!
            cell.hotel_price.text = getRoomPrice(ratePlanCode: ratePlan.ratePlanCode,roomStay: (roomStays?[indexPath.row])!)
          //  roomStays?[indexPath.row].roomRates?.roomRate?[0].rates?.rate.tpaExtensions.nightlyRate?[0].price ?? "0"
        }
        if  JazHotels.hotelsImages![(roomStays?[indexPath.row].basicPropertyInfo.hotelCode)!]?[0] != nil{
            let imageURL = URL(string: (JazHotels.hotelsImages![(roomStays?[indexPath.row].basicPropertyInfo.hotelCode)!]?[0])!)
            cell.hotel_img.kf.indicatorType = .activity
            cell.hotel_img.kf.setImage(with: imageURL, placeholder: UIImage(named: "placeholder"), options: [.transition(ImageTransition.fade(0.7))], progressBlock: nil, completionHandler: nil)
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
        
        let rateView = RatePlansViewController.create()
        if roomStays?[indexPath.row].roomRates?.roomRate?.count != 0 && roomStays?[indexPath.row].roomRates?.roomRate != nil
        {
            rateView.roomRateList = (roomStays?[indexPath.row].roomRates?.roomRate)!
            rateView.ratePlans = roomStays?[indexPath.row].ratePlans
            rateView.roomStay = roomStays?[indexPath.row]
            rateView.checkOutDate = self.checkOutDate
            rateView.checkInDate = self.checkInDate
            rateView.hotelCode = roomStays?[indexPath.row].basicPropertyInfo.hotelCode
            rateView.adultsNum = self.adultsNum
            rateView.childNum = self.childNum
            rateView.chainCode = self.chainCode
            rateView.roomNum = self.roomNum
            if roomStays?[indexPath.row].basicPropertyInfo.hotelName != nil{
            rateView.hotelTitle = roomStays?[indexPath.row].basicPropertyInfo.hotelName
            }
            self.navigationController?.pushViewController(rateView, animated: true)
        }
        else
        {
            DispatchQueue.main.async {
                SCLAlertView().showInfo("", subTitle: "Your search did not match any available")
                
            }
        }
    }
}
