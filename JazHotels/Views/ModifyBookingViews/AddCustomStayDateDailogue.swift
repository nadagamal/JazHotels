//
//  AddCustomStayDateDailogue.swift
//  JazHotels
//
//  Created by Zeinab Reda on 9/22/18.
//  Copyright © 2018 Jaz. All rights reserved.
//

import UIKit

class AddCustomStayDateDailogue: UIViewController {
    weak var delegate: BookingDetailsViewController?

    @IBOutlet weak var commentTF: DesignableUITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func addBtnAction(_ sender: Any) {
        delegate?.getUserAddationalRequest(request: commentTF.text ?? "")
        self.delegate?.dismissDialogViewController()

    }
    
    @IBAction func cancelBtnAction(_ sender: Any) {
        self.delegate?.dismissDialogViewController()

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
