//
//  BookingDetailsViewController.swift
//  JazHotels
//
//  Created by Nada Gamal Mohamed on 9/11/18.
//  Copyright © 2018 Jaz. All rights reserved.
//

import UIKit

class BookingDetailsViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func modifyReservationAction(_ sender: Any) {
    }
    
    @IBAction func cancelReservationAction(_ sender: Any) {
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    @objc public static func create() -> BookingDetailsViewController {
        
        return UIStoryboard(name: HotelJazConstants.StoryBoard.mainSB, bundle: Bundle.main).instantiateViewController(withIdentifier: String(describing: self)) as! BookingDetailsViewController
    }
}
extension BookingDetailsViewController:UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell:UITableViewCell!
        
        if indexPath.row == 0{
            cell = tableView.dequeueReusableCell(withIdentifier: "HotelDetailsCell") as! HotelTableViewCell            
        }
        else if indexPath.row == 1{
            cell = tableView.dequeueReusableCell(withIdentifier: "DateCell")
        }
        else  if indexPath.row == 2{
            cell = tableView.dequeueReusableCell(withIdentifier: "RatePlanCell")
        }
        else  if indexPath.row == 3{
            cell = tableView.dequeueReusableCell(withIdentifier: "RoomDetailsCell")
        }
        else  if indexPath.row == 4{
            cell = tableView.dequeueReusableCell(withIdentifier: "ConfirmationCodeCell")
        }
        else  if indexPath.row == 5{
            cell = tableView.dequeueReusableCell(withIdentifier: "PriceCell")
        }
        else  if indexPath.row == 6{
            cell = tableView.dequeueReusableCell(withIdentifier: "InfoCell")
        }
        return cell
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0{
            return 188
        }
        else if indexPath.row == 1{
            return 57
        }
        else  if indexPath.row == 2{
            return 57
        }
        else  if indexPath.row == 3{
            return 57
        }
        else  if indexPath.row == 4{
            return 57
        }
        else  if indexPath.row == 5{
            return 57
        }
        else{
            return 100
        }
    }
}
