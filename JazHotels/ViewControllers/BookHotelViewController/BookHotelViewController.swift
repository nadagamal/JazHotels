//
//  BookHotelViewController.swift
//  JazHotels
//
//  Created by Nada Gamal Mohamed on 9/11/18.
//  Copyright © 2018 Jaz. All rights reserved.
//

import UIKit

class BookHotelViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @objc public static func create() -> BookHotelViewController {
        
        return UIStoryboard(name: HotelJazConstants.StoryBoard.mainSB, bundle: Bundle.main).instantiateViewController(withIdentifier: String(describing: self)) as! BookHotelViewController
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func confirmReservationAction(_ sender: Any) {
    }
    
}
extension BookHotelViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell:UITableViewCell!
        if indexPath.row == 0{
            cell = tableView.dequeueReusableCell(withIdentifier: "CardHolderCell")
        }
        else  if indexPath.row == 1{
            cell = tableView.dequeueReusableCell(withIdentifier: "CardNumberCell")
        }
        else  if indexPath.row == 2{
            cell = tableView.dequeueReusableCell(withIdentifier: "CardDetailsCell")
        }
        else  if indexPath.row == 3{
            cell = tableView.dequeueReusableCell(withIdentifier: "CardEditBtnCell")
        }
        else  if indexPath.row == 4{
            cell = tableView.dequeueReusableCell(withIdentifier: "ArrivalDateCell")
        }
        else  if indexPath.row == 5{
            cell = tableView.dequeueReusableCell(withIdentifier: "CancellationCell")
        }
        else  if indexPath.row == 6{
            cell = tableView.dequeueReusableCell(withIdentifier: "BookingCell")
        }
        else  if indexPath.row == 7{
            cell = tableView.dequeueReusableCell(withIdentifier: "CheckCell")
        }
        return cell
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 8
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 || indexPath.row == 1 || indexPath.row == 2 || indexPath.row == 3{
           return 75
        }
        else  if indexPath.row == 4 || indexPath.row == 5 || indexPath.row == 6 {
            return 95
        }
      return 70
    }
}
