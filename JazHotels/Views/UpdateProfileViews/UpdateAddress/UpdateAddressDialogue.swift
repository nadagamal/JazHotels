//
//  DropDownDialogue.swift
//  JazHotels
//
//  Created by Zeinab Reda on 9/22/18.
//  Copyright © 2018 Jaz. All rights reserved.
//

import UIKit

class UpdateAddressDialogue: UIViewController {

    @IBOutlet weak var addressLine1: DesignableUITextField!
    @IBOutlet weak var addressLine2: DesignableUITextField!
    @IBOutlet weak var addressLine3: DesignableUITextField!
    @IBOutlet weak var city: DesignableUITextField!
    @IBOutlet weak var state: DesignableUITextField!
    @IBOutlet weak var postalCode: DesignableUITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func updateBtnAction(_ sender: Any) {
    }
  
    @IBAction func cancelBtnAction(_ sender: Any) {
    }
}
