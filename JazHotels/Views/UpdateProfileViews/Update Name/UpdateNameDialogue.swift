//
//  DropDownDialogue.swift
//  JazHotels
//
//  Created by Zeinab Reda on 9/22/18.
//  Copyright © 2018 Jaz. All rights reserved.
//

import UIKit

class UpdateNameDialogue: UIViewController {

    @IBOutlet weak var firstName: DesignableUITextField!
    @IBOutlet weak var midName: DesignableUITextField!
    
    @IBOutlet weak var lastName: DesignableUITextField!
    
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
