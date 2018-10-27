//
//  FavouriteViewController.swift
//  JazHotels
//
//  Created by Zeinab Reda on 7/4/18.
//  Copyright © 2018 Jaz. All rights reserved.
//

import UIKit
import Kingfisher
class FavoriteViewController: UIViewController {
    
    @IBOutlet weak var noDataFoundLbl: UILabel!
    @IBOutlet weak var tableView: UITableView!
    var hotelsList = [JHotelDescriptiveContent]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        tableView.register(UINib(nibName: "HotelTableViewCell", bundle: nil), forCellReuseIdentifier: "hotel_cell")
      //  self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func menuBtnAction(_ sender: Any) {
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
//        self.navigationController?.isNavigationBarHidden = false
        
        if UserDefaults.standard.object(forKey: "Favourites") != nil{
            var list = [String]()
            list = UserDefaults.standard.object(forKey: "Favourites") as! [String]
            hotelsList = getHotels(codes: list)
            if hotelsList.count == 0{
                self.noDataFoundLbl.isHidden = false
//                self.tableView.isHidden = true
            }else{
                self.noDataFoundLbl.isHidden = true
//                self.tableView.isHidden = false
            }
            self.tableView.reloadData()
        }
    }
    
    func getHotels(codes:[String]) -> [JHotelDescriptiveContent] {
        var hotels = [JHotelDescriptiveContent]()
        for code in codes{
            for hotel in JazHotels.hotels {
                if code == hotel.hotelCode{
                    hotels.append(hotel)
                }
            }
        }
        return hotels
    }
    
    
}
extension FavoriteViewController: UITableViewDelegate , UITableViewDataSource
{
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "hotel_cell") as! HotelTableViewCell
        cell.priceView.isHidden = true
        cell.fav_btn .setImage(UIImage(named: "addFavH"), for: .normal)
        let  hotel = hotelsList[indexPath.item]
        cell.hotel_name.text = hotel.hotelName
        let imageURL = URL(string: JazHotels.hotelsImages![hotel.hotelCode]![0])
        cell.hotel_img.kf.indicatorType = .activity
        cell.hotel_img.kf.setImage(with: imageURL, placeholder: UIImage(named: "placeholder"), options: [.transition(ImageTransition.fade(0.7))], progressBlock: nil, completionHandler: nil)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return hotelsList.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 280
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let hotelDetailsVC = UIStoryboard(name: HotelJazConstants.StoryBoard.mainSB, bundle: nil).instantiateViewController(withIdentifier: "HotelDetailsViewController") as! HotelDetailsViewController
        let  hotel = hotelsList[indexPath.item]
        hotelDetailsVC.hotel = hotel
        self.navigationController?.show(hotelDetailsVC, sender: nil)
    }
}
