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
    @IBOutlet weak var hotelListBtn: UIButton!
    @IBOutlet weak var viewOnMapBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        hotelListContainer.isHidden = false
        hotelOnMapContainer.isHidden = true
    }

    @IBAction func hotelListBtnAction(_ sender: Any)
    {
        hotelListBtn.setTitleColor(#colorLiteral(red: 0.3137254902, green: 0.0431372549, blue: 0.462745098, alpha: 1), for: UIControlState.normal)
        viewOnMapBtn.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.35), for: UIControlState.normal)
        hotelListContainer.isHidden = false
        hotelOnMapContainer.isHidden = true
    }
    @IBAction func viewOnMapBtnAction(_ sender: Any)
    {
        viewOnMapBtn.setTitleColor(#colorLiteral(red: 0.3137254902, green: 0.0431372549, blue: 0.462745098, alpha: 1), for: UIControlState.normal)
        hotelListBtn.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.35), for: UIControlState.normal)
        hotelListContainer.isHidden = true
        hotelOnMapContainer.isHidden = false
    }
    
    @IBAction func editReservationBtn(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    @objc public static func create() -> HotelsViewController {
        
        return UIStoryboard(name: HotelJazConstants.StoryBoard.mainSB, bundle: Bundle.main).instantiateViewController(withIdentifier: String(describing: self)) as! HotelsViewController
    }
}
