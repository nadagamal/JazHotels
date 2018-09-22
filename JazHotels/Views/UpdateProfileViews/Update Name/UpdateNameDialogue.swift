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
    weak var delegate: ProfileViewController?

    var fname:String?
    var lname:String?
    var mname:String?
    fileprivate var userData:UserProfile?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.firstName.text = fname
        self.lastName.text = lname
        self.midName.text = mname
        userData = UserDefaults.getObjectDefault(key: HotelJazConstants.userDefault.userData) as? UserProfile

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func updateBtnAction(_ sender: Any) {
        userData?.userName?.firstName = firstName.text
        userData?.userName?.middleName = midName.text
        userData?.userName?.lastName = lastName.text
        userData?.userName?.fullName = "\(firstName.text!)  \(lastName.text!)"

        UserOperation.updateUser(user: userData!)
        self.delegate?.dismissDialogViewController()
        self.delegate?.reloadProfile(user: userData!)


    }
  
    @IBAction func cancelBtnAction(_ sender: Any) {
        self.delegate?.dismissDialogViewController()

    }
}
