//
//  DropDownDialogue.swift
//  JazHotels
//
//  Created by Zeinab Reda on 9/22/18.
//  Copyright © 2018 Jaz. All rights reserved.
//

import UIKit
import iOSDropDown
enum typeDropDown
{
    case gender
    case country
    case title
}
class DropDownDialogue: UIViewController {

    @IBOutlet weak var optionTF: DropDown!
    var optionArray:[String] = []
    var optionId:[Int] = []
    var currentOption:String = ""
    var type:typeDropDown?
    fileprivate var userData:UserProfile?
    weak var delegate: ProfileViewController?

    override func viewDidLoad() {
        super.viewDidLoad()
       userData = UserDefaults.getObjectDefault(key: HotelJazConstants.userDefault.userData) as? UserProfile

        self.optionTF.text =  self.currentOption
        optionTF.hideArrow = false
        optionTF.optionIds = optionId
        optionTF.optionArray = optionArray


        self.optionTF.didSelect { (selectedText, index, id) in
            switch self.type
            {
            case .some(.gender):
                self.userData?.gender  = selectedText
                break
                
            case .some(.country):
                self.userData?.userAddress?.country  = selectedText

                break
            case .some(.title):
                self.userData?.title  = selectedText
                
                break
            case .none:
                print("None")
                
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func updateBtnAction(_ sender: Any) {
        UserOperation.updateUser(user: self.userData!)
        self.delegate?.dismissDialogViewController()
        self.delegate?.reloadProfile(user: userData!)

    }
  
    @IBAction func cancelBtnAction(_ sender: Any) {
        
        self.delegate?.dismissDialogViewController()

    }
}
