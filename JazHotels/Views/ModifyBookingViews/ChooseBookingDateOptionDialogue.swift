//
//  DropDownDialogue.swift
//  JazHotels
//
//  Created by Zeinab Reda on 9/22/18.
//  Copyright © 2018 Jaz. All rights reserved.
//

import UIKit
import LSDialogViewController

enum ModifyReservation
{
    case changeStayDates
    case addtionalRequest
}
class ChooseBookingDateOptionDialogue: UIViewController {

    weak var delegate: BookingDetailsViewController?
    fileprivate var userData:UserProfile?

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    @IBAction func addSpecialRequestsAction(_ sender: Any) {
        
        delegate?.dismissDialogViewController()
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1), execute: {
            // Put your code which should be executed with a delay here
            self.delegate?.getUserModifcation(choice: .addtionalRequest)

        })
    }
    @IBAction func changeStayDateAction(_ sender: Any) {
        delegate?.dismissDialogViewController()
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1), execute: {
            // Put your code which should be executed with a delay here
            self.delegate?.getUserModifcation(choice: .changeStayDates)
            
        })
    }
    
    @IBAction func cancelBtnAction(_ sender: Any) {
        self.delegate?.dismissDialogViewController()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

}
