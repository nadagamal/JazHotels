//
//  HotelDestinationViewController.swift
//  JazHotels
//
//  Created by Nada Gamal Mohamed on 9/24/18.
//  Copyright © 2018 Jaz. All rights reserved.
//

import UIKit
import Kingfisher
class HotelDestinationViewController: UIViewController {
    
    var hotels = [Destination]()
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        readHotelImagesJSON()
       // self.tableView.tableHeaderView = UIView()
        self.tableView.tableFooterView = UIView()
        self.navigationController?.navigationBar.setValue(true, forKey: "hidesShadow")

    }
    
    func readHotelImagesJSON(){
        if let path = Bundle.main.path(forResource: "destinations", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
                if let jsonResult = jsonResult as? Array<Any>{
                    for item in jsonResult{
                        self.hotels.append(Destination(fromDictionary: item as! [String : Any]))
                    }
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                }
            } catch {
            }
        }
    }
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    //MARK:- Get Hotel Codes by city name or hotel name
    func getHotels(text:String) -> [JHotelDescriptiveContent] {
        var codes = [JHotelDescriptiveContent]()
        for hotel in JazHotels.hotels {
            if text == hotel.hotelName || text == hotel.contactInfos.contactInfo.addresses.address.cityName{
                codes.append(hotel)
            }
        }
        return codes
    }
    
}
extension HotelDestinationViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView .dequeueReusableCell(withIdentifier: "HotelDetailsCell") as! HotelTableViewCell
        let  hotel = hotels[indexPath.section]
        cell.hotel_name.text = hotel.title
        let imageURL = URL(string: hotel.image)
        cell.hotel_img.kf.indicatorType = .activity
        cell.hotel_img.kf.setImage(with: imageURL, placeholder: UIImage(named: "jazLauncherLogo"), options: [.transition(ImageTransition.fade(0.7))], progressBlock: nil, completionHandler: nil)
        cell.hotel_place.text = hotel.location
        return cell
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return hotels.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let  hotel = hotels[indexPath.section]
        var hotelList=[JHotelDescriptiveContent]()
        hotelList = self.getHotels(text: hotel.id)
        let viewController = HomeViewController.create()
        viewController.hotelList = hotelList
        self.navigationController?.pushViewController(viewController, animated: true)

    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 181
    }
}
