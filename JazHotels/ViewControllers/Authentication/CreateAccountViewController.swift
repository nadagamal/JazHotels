//
//  CreateAccountViewController.swift
//  JazHotels
//
//  Created by Zeinab Reda on 8/25/18.
//  Copyright © 2018 Jaz. All rights reserved.
//

import UIKit
import ACFloatingTextfield_Swift

class CreateAccountViewController: UIViewController {

    @IBOutlet weak var mailTF: ACFloatingTextfield!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func closeBtnAcrion(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    

}
