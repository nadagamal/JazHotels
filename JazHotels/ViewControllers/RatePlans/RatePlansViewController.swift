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
}

extension RatePlansViewController :UITableViewDelegate , UITableViewDataSource
{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DetailsCell") as! RatePlanTableViewCell

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
        
        return roomRateList.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 287.0
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(headerTapped))
        let cell = tableView.dequeueReusableCell(withIdentifier: "rate_cell") as! RatePlanTableViewCell
        cell.tag = section
        cell.ratePrice.text = roomRateList[section].rates?.rate?.total?.amountAfterTax
        if ratePlans != nil && ratePlans.ratePlan.count>0{
            cell.rateTitle.text = ratePlans.ratePlan[0].ratePlanDescription.name ?? ""
            if ratePlans.ratePlan[0].ratePlanDescription.text != nil{
                let str = ratePlans.ratePlan[0].ratePlanDescription.text.replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression, range: nil)
                cell.rateDesc.text = str
                
            }
            
        }
        cell.addGestureRecognizer(tapGesture)
        return cell
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 180
    }
}
