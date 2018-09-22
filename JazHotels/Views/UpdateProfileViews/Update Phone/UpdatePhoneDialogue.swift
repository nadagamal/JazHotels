//
//  DropDownDialogue.swift
//  JazHotels
//
//  Created by Zeinab Reda on 9/22/18.
//  Copyright © 2018 Jaz. All rights reserved.
//

import UIKit

class UpdatePhoneDialogue: UIViewController {

    @IBOutlet weak var mobilePhone: DesignableUITextField!
    @IBOutlet weak var landeLine: DesignableUITextField!
    var phone:String?
    var landline:String?
    fileprivate var userData:UserProfile?
    weak var delegate: ProfileViewController?

    override func viewDidLoad() {
        super.viewDidLoad()
        userData = UserDefaults.getObjectDefault(key: HotelJazConstants.userDefault.userData) as? UserProfile

        self.mobilePhone.text  = phone
        self.landeLine.text = landline
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func updateBtnAction(_ sender: Any) {
        
        userData?.userContact?.mobilePhone = mobilePhone.text
        userData?.userContact?.landLine = landeLine.text
        UserOperation.updateUser(user: userData!)
        self.delegate?.dismissDialogViewController()
        self.delegate?.reloadProfile(user: userData!)

    }
  
    @IBAction func cancelBtnAction(_ sender: Any) {
        self.delegate?.dismissDialogViewController()
    }
}
