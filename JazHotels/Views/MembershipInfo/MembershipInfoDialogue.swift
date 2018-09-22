//
//  DropDownDialogue.swift
//  JazHotels
//
//  Created by Zeinab Reda on 9/22/18.
//  Copyright © 2018 Jaz. All rights reserved.
//

import UIKit

class MembershipInfoDialogue: UIViewController {

    @IBOutlet weak var memberShipNumber: UILabel!
    @IBOutlet weak var programCode: UILabel!
    @IBOutlet weak var loyaltyLevel: UILabel!
    @IBOutlet weak var points: UILabel!
    @IBOutlet weak var effectiveDate: UILabel!
    @IBOutlet weak var expireDate: UILabel!
    weak var delegate: ProfileViewController?

    fileprivate var userData:UserProfile?

    override func viewDidLoad() {
        super.viewDidLoad()
        userData = UserDefaults.getObjectDefault(key: HotelJazConstants.userDefault.userData) as? UserProfile
        memberShipNumber.text = userData?.userCustomer?.membershipNumber
        programCode.text = userData?.userCustomer?.programCode
        loyaltyLevel.text = userData?.userCustomer?.loyaltyLevel
        points.text = userData?.userCustomer?.points
        effectiveDate.text = userData?.userCustomer?.effectiveDate
        expireDate.text = userData?.userCustomer?.expireDate
       
        // Do any additional setup after loading the view.
    }
    @IBAction func okBtnAction(_ sender: Any) {
        self.delegate?.dismissDialogViewController()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
