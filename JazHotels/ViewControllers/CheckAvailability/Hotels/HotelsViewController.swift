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
