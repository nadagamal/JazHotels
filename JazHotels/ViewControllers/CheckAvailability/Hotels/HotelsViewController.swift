//
//  HotelsViewController.swift
//  JazHotels
//
//  Created by Zeinab Reda on 7/4/18.
//  Copyright © 2018 Jaz. All rights reserved.
//

import UIKit

class HotelsViewController: UIViewController {

    @IBOutlet weak var hotelListContainer: UIView!
    @IBOutlet weak var hotelOnMapContainer: UIView!
    var roomPrice:String?
    var roomCurrency:String?
    var rooms:JHotelDescriptiveContent?
    override func viewDidLoad() {
        super.viewDidLoad()
        hotelListContainer.isHidden = false
        hotelOnMapContainer.isHidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    @objc public static func create() -> HotelsViewController {
        
        return UIStoryboard(name: HotelJazConstants.StoryBoard.mainSB, bundle: Bundle.main).instantiateViewController(withIdentifier: String(describing: self)) as! HotelsViewController
    }
}
