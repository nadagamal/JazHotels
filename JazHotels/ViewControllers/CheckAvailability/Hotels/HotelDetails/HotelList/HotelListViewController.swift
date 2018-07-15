//
//  HotelListViewController.swift
//  JazHotels
//
//  Created by Zeinab Reda on 7/5/18.
//  Copyright © 2018 Jaz. All rights reserved.
//

import UIKit

class HotelListViewController: UIViewController {

    @IBOutlet weak var hotelTB: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        hotelTB.register(UINib(nibName: "HotelTableViewCell", bundle: nil), forCellReuseIdentifier: "hotel_cell")

    }

    @objc public static func create() -> HotelListViewController {
        
        return UIStoryboard(name: HotelJazConstants.StoryBoard.mainSB, bundle: Bundle.main).instantiateViewController(withIdentifier: String(describing: self)) as! HotelListViewController
    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = false
        
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
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 10
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 280
    }
}
