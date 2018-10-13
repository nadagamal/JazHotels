//
//  HotelsViewController.swift
//  JazHotels
//
//  Created by Zeinab Reda on 7/4/18.
//  Copyright © 2018 Jaz. All rights reserved.
//

import UIKit

class HotelsViewController: UIViewController {

    @IBOutlet weak var hotelListContainer: UIView!
    @IBOutlet weak var hotelOnMapContainer: UIView!
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
    
    @IBOutlet weak var hotelListBtn: UIButton!
    @IBOutlet weak var viewOnMapBtn: UIButton!
    
    //    let price =  roomStays?[0].roomRates?.roomRate?[0].rates?.rate.tpaExtensions.nightlyRate?[0].price

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = hotelTitle
//        NotificationCenter.default.post(name: Notification.Name("getHotelListInfo"), object: nil , userInfo: ["roomStays":roomStays ?? [] ,"roomStayInfo": roomStayInfo ?? "" , "roomInfoList":roomInfoList ?? [] ,"hotelTitle":hotelTitle ?? ""])

        hotelListContainer.isHidden = false
        hotelOnMapContainer.isHidden = true
    }
    
//    @objc func updateHotelList(notification: Notification){
//
//        self.roomStays = notification.userInfo!["roomStays"] as? [JCRoomStay]
//        self.roomStayInfo = notification.userInfo!["roomStayInfo"] as? JCBasicPropertyInfo
//        self.roomInfoList = notification.userInfo!["roomInfoList"] as? [JCCriterion]
//
//    }

    @IBAction func hotelListBtnAction(_ sender: Any)
    {

        hotelListBtn.setTitleColor(#colorLiteral(red: 0, green: 0.5215686275, blue: 0.4705882353, alpha: 1), for: UIControlState.normal)
        viewOnMapBtn.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.35), for: UIControlState.normal)
        hotelListContainer.isHidden = false
        hotelOnMapContainer.isHidden = true
    }
    @IBAction func viewOnMapBtnAction(_ sender: Any)
    {
        viewOnMapBtn.setTitleColor(#colorLiteral(red: 0, green: 0.5215686275, blue: 0.4705882353, alpha: 1), for: UIControlState.normal)
        hotelListBtn.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.35), for: UIControlState.normal)
        hotelListContainer.isHidden = true
        hotelOnMapContainer.isHidden = false
    }
    
    @IBAction func editReservationBtn(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    @objc public static func create() -> HotelsViewController {
        
        return UIStoryboard(name: HotelJazConstants.StoryBoard.mainSB, bundle: Bundle.main).instantiateViewController(withIdentifier: String(describing: self)) as! HotelsViewController
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "HotelsListSegue"{
            let hotelView = segue.destination as! HotelListViewController
            hotelView.checkInDate = self.checkInDate
            hotelView.checkOutDate = self.checkOutDate
            hotelView.adultsNum = self.adultsNum
            hotelView.childNum = self.childNum
            hotelView.roomNum = self.roomNum
            hotelView.chainCode = "16401"
            hotelView.userInfo = ["roomStays":roomStays ?? [] ,"roomStayInfo": roomStayInfo ?? "" , "roomInfoList":roomInfoList ?? [] ,"hotelTitle":hotelTitle ?? ""]
        }
        else if segue.identifier == "HotelsMapSegue"{
            let hotelView = segue.destination as! HotelOnMapViewController
            hotelView.userInfo = ["roomStays":roomStays ?? [] ,"roomStayInfo": roomStayInfo ?? "" , "roomInfoList":roomInfoList ?? [] ,"hotelTitle":hotelTitle ?? ""]
        }
    }

}
