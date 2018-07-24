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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        //        tableView.register(UINib(nibName: "RatePlanTableViewCell", bundle: nil), forCellReuseIdentifier: "rate_cell")
        
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
    
}

extension RatePlansViewController :UITableViewDelegate , UITableViewDataSource
{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "rate_cell") as! RatePlanTableViewCell
        cell.ratePrice.text = roomRateList[indexPath.row].rates?.rate?.total?.amountAfterTax
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return roomRateList.count
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 150.0
    }
}
