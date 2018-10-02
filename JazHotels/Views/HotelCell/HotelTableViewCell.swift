//
//  HotelCollectionViewCell.swift
//  JazHotels
//
//  Created by Zeinab Reda on 7/5/18.
//  Copyright © 2018 Jaz. All rights reserved.
//

import UIKit

class HotelTableViewCell: UITableViewCell {
    override func awakeFromNib() {
        var overlay: UIView!
        if self.reuseIdentifier == "HotelDetailsCell"{
         overlay  =  UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: self.hotel_img.frame.size.height+5))
            overlay.backgroundColor = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 0.3)
            self.hotel_img.addSubview(overlay)

        }
        else if self.reuseIdentifier == "hotel_cell"{
            
        }
        else{
            overlay  =  UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width-32, height: self.hotel_img.frame.size.height+5))
            overlay.backgroundColor = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 0.3)
            self.hotel_img.addSubview(overlay)

        }
    }
    @IBOutlet weak var jazLogoImg: UIImageView!
    @IBOutlet weak var priceView: UIView!
    @IBOutlet weak var hotel_img: UIImageView!
    @IBOutlet weak var fav_btn: UIButton!
    @IBOutlet weak var hotel_price: UILabel!
    @IBOutlet weak var hotel_price_currency: UILabel!
    @IBOutlet weak var hotel_place: UILabel!
    @IBOutlet weak var hotel_name: UILabel!
    @IBOutlet weak var checkInLblTxt: UILabel!
    @IBOutlet weak var checkInLblValue: UILabel!
}
