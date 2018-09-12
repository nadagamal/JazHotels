//
//  MenuViewController.swift
//  JazHotels
//
//  Created by Nada Gamal Mohamed on 9/9/18.
//  Copyright © 2018 Jaz. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.tableFooterView = UIView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
      
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
extension MenuViewController:UITableViewDataSource,UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell:MenuCell = tableView.dequeueReusableCell(withIdentifier: "cell") as! MenuCell
        if indexPath.row == 0{
           
            if !UserDefaults.isKeyPresentInUserDefaults(key: HotelJazConstants.userDefault.userData)
            {
                cell.cellTitleLbl.text = "Sign In"
                cell.cellIconImg.image = #imageLiteral(resourceName: "signOut")
            }
            else
            {
                cell.cellTitleLbl.text = "Sign out"
                cell.cellIconImg.image = #imageLiteral(resourceName: "signOut")
            }
        }else{
            cell = tableView.dequeueReusableCell(withIdentifier: "ReservationCell") as! MenuCell
            cell.cellTitleLbl.text = "Reservation"
            cell.cellIconImg.image = #imageLiteral(resourceName: "reservation")
        }
        return cell

    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if !UserDefaults.isKeyPresentInUserDefaults(key: HotelJazConstants.userDefault.userData)
        {
             return 1
        }
        else
        {
             return 2
        }
      
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var selectedCell:UITableViewCell = tableView.cellForRow(at: indexPath)!
        selectedCell.contentView.backgroundColor = UIColor.clear

        if indexPath.row == 0 {
            if !UserDefaults.isKeyPresentInUserDefaults(key: HotelJazConstants.userDefault.userData)
            {
                self.navigationController?.present(LoginViewController.create(), animated: true, completion: nil)

            }
            else
            {
                self.navigationController?.present(LoginViewController.create(), animated: true, completion: nil)
                UserDefaults.removeKeyUserDefault(key:  HotelJazConstants.userDefault.userData)
              
            }
        }
        else // reservartion
        {
            
        }
    }
    
     func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
        var cellToDeSelect:UITableViewCell = tableView.cellForRow(at: indexPath as IndexPath)!
        cellToDeSelect.contentView.backgroundColor = UIColor.clear
    }
}
