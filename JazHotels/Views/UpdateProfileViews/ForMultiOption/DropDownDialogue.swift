//
//  DropDownDialogue.swift
//  JazHotels
//
//  Created by Zeinab Reda on 9/22/18.
//  Copyright © 2018 Jaz. All rights reserved.
//

import UIKit
import iOSDropDown

class DropDownDialogue: UIViewController {

    @IBOutlet weak var optionTF: DropDown!
    var optionArray:[String] = []
    var optionId:[Int] = []
    override func viewDidLoad() {
        super.viewDidLoad()
       // optionTF.hideArrow = false
        optionTF.optionIds = optionId
        optionTF.optionArray = optionArray
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
