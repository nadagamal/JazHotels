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
        }
        else{
            expandableCells.append(selectedSection)
        }
        tableView.reloadData()
        
    }
    func getRoomPrice(ratePlanCode:String) ->String {
        var price:String = ""
        for rate in roomStay.roomRates.roomRate{
            if rate.ratePlanCode == ratePlanCode{
                price = rate.rates.rate.total.amountAfterTax
                break
            }
        }
        return price
    }
    func getRoomPrice(roomTypeCode:String) ->String {
        var price:String = ""
        for rate in roomStay.roomRates.roomRate{
            if rate.roomTypeCode == roomTypeCode{
                price = rate.rates.rate.total.amountAfterTax
                break
            }
        }
        return price
    }
    @objc func bookNowAction(sender:UIButton){
        navigationController?.show(BookHotelViewController.create(), sender: sender)

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
        var roomTypeslist = roomStay.roomTypes.roomType as [JCRoomType]
        cell.priceLbl.text = getRoomPrice(roomTypeCode: roomTypeslist[indexPath.row].roomTypeCode)
        cell.roomDescriptionLbl.text = roomTypeslist[indexPath.row].roomDescription.text.replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression, range: nil)
        cell.bookNowBtn.addTarget(self, action: #selector(bookNowAction(sender:)), for: .touchUpInside)
        cell.roomDetailsBtn.addTarget(self, action: #selector(roomDetailsAction(sender:)), for: .touchUpInside)

        cell.roomNameLbl.text = roomTypeslist[indexPath.row].roomDescription.name
        let imageURL = URL(string: (roomTypeslist[indexPath.row].roomDescription!.image))
        cell.imgView.kf.indicatorType = .activity
        cell.imgView.kf.setImage(with: imageURL, placeholder: UIImage(named: "jazLauncherLogo"), options: [.transition(ImageTransition.fade(0.7))], progressBlock: nil, completionHandler: nil)
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if expandableCells.contains(section){
            return roomStay.roomTypes.roomType.count
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
