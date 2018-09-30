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
class RatePlansViewController: UIViewController {
    
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
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Rate Plans"
  
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = false
        
    }
    @objc public static func create() -> RatePlansViewController {
        
        return UIStoryboard(name: HotelJazConstants.StoryBoard.mainSB, bundle: Bundle.main).instantiateViewController(withIdentifier: String(describing: self)) as! RatePlansViewController
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
        }
        else{
            expandableCells.append(selectedSection)
            cell.avaiableRoomBtn.backgroundColor = #colorLiteral(red: 0.2431372549, green: 0.537254902, blue: 0.4941176471, alpha: 1)

        }
        tableView.reloadData()
        
    }
    func getRoomPrice(ratePlanCode:String) ->String {
        var price:String = ""
        for rate in roomStay.roomRates.roomRate{
            if rate.ratePlanCode == ratePlanCode && rate.rates != nil{
                if rate.rates.rate.tpaExtensions.nightlyRate.count>0{
                    price = rate.rates.rate.tpaExtensions.nightlyRate[0].priceWithTaxAndFee
                }
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
                if rate.rates.rate.tpaExtensions.nightlyRate.count>0{
                    price = rate.rates.rate.tpaExtensions.nightlyRate[0].priceWithTaxAndFee
                }
                break
            }
        }
        return price
    }
    @objc func bookNowAction(sender:UIButton){
        guard let cell = sender.superview?.superview as? RoomDetailsCell else {
            return
        }
        
        let indexPath = tableView.indexPath(for: cell) as! NSIndexPath
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
            self.navigationController?.present(LoginViewController.create(), animated: true, completion: nil)

        }

    }
    @objc func roomDetailsAction(sender:UIButton){
        guard let cell = sender.superview?.superview as? RoomDetailsCell else {
            return
        }
        
        let indexPath = tableView.indexPath(for: cell) as! NSIndexPath
        
        let viewController = RoomDetailsViewController.create()
        var roomTypeslist = roomStay.roomTypes.roomType as [JCRoomType]
        viewController.room = roomTypeslist[indexPath.row]
        let popup = PopupDialog(viewController: viewController,
                                buttonAlignment: .horizontal,
                                transitionStyle: .fadeIn,
                                tapGestureDismissal: true,
                                panGestureDismissal: true)
        
        self.navigationController?.topViewController?.present(popup, animated: true, completion: nil)
    }
}

extension RatePlansViewController :UITableViewDelegate , UITableViewDataSource
{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DetailsCell") as! RoomDetailsCell
        let ratePlan:JCRatePlan = roomStay.ratePlans[indexPath.section]
        var list = getRoomsList(ratePlanCode: ratePlan.ratePlanCode)
        let room = getRoomType(roomTypeCode: list[indexPath.row].roomTypeCode)
        cell.priceLbl.text = getRoomPrice(roomTypeCode: room.roomTypeCode)
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
        
        return 295.0
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
        }
        else{
        cell.avaiableRoomBtn.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            cell.avaiableRoomBtn.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)

        }
        if ratePlan != nil{
            cell.rateTitle.text = ratePlan.ratePlanDescription.name ?? ""
            if ratePlan.ratePlanDescription.text != nil{
                let str = ratePlan.ratePlanDescription.text.replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression, range: nil)
                cell.rateDesc.text = str
                
            }
            
        }
        cell.addGestureRecognizer(tapGesture)
        return cell
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 185
    }
}
