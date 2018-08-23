//
//  RatePlansViewController.swift
//  JazHotels
//
//  Created by Zeinab Reda on 7/24/18.
//  Copyright © 2018 Jaz. All rights reserved.
//

import UIKit

class RatePlansViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var roomRateList :[JCRoomRate] = []
    var ratePlans:JCRatePlan!
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
}

extension RatePlansViewController :UITableViewDelegate , UITableViewDataSource
{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DetailsCell") as! RoomDetailsCell

        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if expandableCells.contains(section){
            return 1
        }else{
            return 0
        }
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return roomStay.ratePlans.ratePlan.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 295.0
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(headerTapped))
        let cell = tableView.dequeueReusableCell(withIdentifier: "rate_cell") as! RatePlanTableViewCell
        cell.tag = section
        let ratePlan:JCRatePlan = roomStay.ratePlans.ratePlan[section]
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
