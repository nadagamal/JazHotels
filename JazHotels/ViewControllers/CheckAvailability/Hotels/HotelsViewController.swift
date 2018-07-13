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
    override func viewDidLoad() {
        super.viewDidLoad()
        hotelListContainer.isHidden = false
        hotelOnMapContainer.isHidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
   
}
