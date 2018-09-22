//
//  ReservationsViewController.swift
//  JazHotels
//
//  Created by Nada Gamal Mohamed on 9/9/18.
//  Copyright © 2018 Jaz. All rights reserved.
//

import UIKit
import SCLAlertView
import SVProgressHUD
import Kingfisher
class ReservationsViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var hotelsReservations = [JBHotelReservation]()

    override func viewDidLoad() {
        super.viewDidLoad() 
        tableView.register(UINib(nibName: "HotelTableViewCell", bundle: nil), forCellReuseIdentifier: "hotel_cell")
        self.title = "Reservations"
        SVProgressHUD.show()
        let userData = UserDefaults.getObjectDefault(key: HotelJazConstants.userDefault.userData) as? UserProfile

//        BookingAPIManager().getReservation(userName: userData?.userSynXisInfo?.synXisUserID, pinNumber: userData?.userSynXisInfo?.synXisPassword) { (reservation, error) in
        BookingAPIManager().getReservation(userName: (userData?.userSynXisInfo?.synXisUserID)!, pinNumber: (userData?.userSynXisInfo?.synXisPassword)!) { (reservation, error) in
            SVProgressHUD.dismiss()
            if error != nil{
                DispatchQueue.main.async {
                    SCLAlertView().showInfo("", subTitle: "No data Found")
                }
            }
            else{
                if reservation?.body.oTAHotelResRS.hotelReservations != nil{
                self.hotelsReservations = (reservation?.body.oTAHotelResRS.hotelReservations.hotelReservation)!
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
                }
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
extension ReservationsViewController: UITableViewDelegate , UITableViewDataSource
{
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "hotel_cell") as! HotelTableViewCell
        cell.priceView.isHidden = true
       // cell.fav_btn .setImage(UIImage(named: "addFavH"), for: .normal)
        cell.fav_btn.isHidden = true
        let  hotel = hotelsReservations[indexPath.item]
        cell.hotel_name.text = hotel.roomStays.roomStay.basicPropertyInfo.hotelName
        let imageURL = URL(string: JazHotels.hotelsImages![hotel.roomStays.roomStay.basicPropertyInfo.hotelCode]![0])
        cell.hotel_img.kf.indicatorType = .activity
        cell.hotel_img.kf.setImage(with: imageURL, placeholder: UIImage(named: "jazLauncherLogo"), options: [.transition(ImageTransition.fade(0.7))], progressBlock: nil, completionHandler: nil)
        cell.checkInLblTxt.isHidden = false
        cell.checkInLblValue.isHidden = false
        cell.checkInLblValue.text = hotel.roomStays.roomStay.timeSpan.start

        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return hotelsReservations.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 280
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let viewController = BookingDetailsViewController.create()
        let  hotel = hotelsReservations[indexPath.item]
        viewController.reservationItem = hotel
        self.navigationController?.show(viewController, sender: self)
    }
}
