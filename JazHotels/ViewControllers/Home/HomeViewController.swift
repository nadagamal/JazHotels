//
//  ViewController.swift
//  JazHotels
//
//  Created by Nada Gamal Mohamed on 6/20/18.
//  Copyright © 2018 Jaz. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    let icon: UIButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @objc public static func create() -> HomeViewController {
        
        return UIStoryboard(name: HotelJazConstants.StoryBoard.mainSB, bundle: Bundle.main).instantiateViewController(withIdentifier: String(describing: self)) as! HomeViewController
    }

}

