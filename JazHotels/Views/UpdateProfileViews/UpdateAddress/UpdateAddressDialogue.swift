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
    weak var delegate: ProfileViewController?

    var line1:String?
    var line2:String?
    var line3:String?
    var cityStr:String?
    var stateStr:String?
    var postalCodeStr:String?
    fileprivate var userData:UserProfile?

    override func viewDidLoad() {
        super.viewDidLoad()
        userData = UserDefaults.getObjectDefault(key: HotelJazConstants.userDefault.userData) as? UserProfile
        addressLine1.text = line1
        addressLine2.text = line2
        addressLine3.text = line3
        city.text = cityStr
        state.text = stateStr
        postalCode.text = postalCodeStr
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func updateBtnAction(_ sender: Any) {
        userData?.userAddress?.addressLine1 = addressLine1.text
        userData?.userAddress?.addressLine2 = addressLine2.text
        userData?.userAddress?.addressLine3 = addressLine3.text
        userData?.userAddress?.city = city.text
        userData?.userAddress?.state = state.text
        userData?.userAddress?.zip = postalCode.text
        var fullAddress:String = ""
        if addressLine1.text != ""
        {
            fullAddress.append(addressLine1.text!)
            
        }
        if addressLine2.text != ""
        {
            fullAddress.append(" , ")
            fullAddress.append(addressLine2.text!)

        }
        if addressLine3.text != ""
        {
            fullAddress.append(" , ")
            fullAddress.append(addressLine3.text!)

        }
        if city.text != ""
        {
            fullAddress.append(" , ")
            fullAddress.append(city.text!)

        }
        if state.text != ""
        {
            fullAddress.append(" , ")
            fullAddress.append(state.text!)

        }
        if postalCode.text != ""
        {
            fullAddress.append(" , ")
            fullAddress.append(postalCode.text!)

        }
        userData?.userAddress?.fullAddress = fullAddress
        UserOperation.updateUser(user: userData!)
        self.delegate?.dismissDialogViewController()
        self.delegate?.reloadProfile(user: userData!)

    }
  
    @IBAction func cancelBtnAction(_ sender: Any) {
        self.delegate?.dismissDialogViewController()

    }
}
