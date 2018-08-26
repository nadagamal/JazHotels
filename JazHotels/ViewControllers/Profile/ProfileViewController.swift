//
//  ProfileViewController.swift
//  JazHotels
//
//  Created by Zeinab Reda on 7/4/18.
//  Copyright © 2018 Jaz. All rights reserved.
//

import UIKit

class ProfileViewController: UITableViewController {

    @IBOutlet weak var profileImg: UIImageView!
    @IBOutlet weak var userName: UILabel!

    @IBOutlet weak var userTitle: UILabel!
    
    @IBOutlet weak var userMobile: UILabel!
    
    @IBOutlet weak var userCountry: UILabel!
    
    @IBOutlet weak var userAddress: UILabel!
    
    @IBOutlet weak var userCreditNumber: UILabel!
    
    static var user:User?
    
    
    override func viewWillAppear(_ animated: Bool) {
        
        self.navigationController?.navigationBar.isHidden = true
        
        if !UserDefaults.isKeyPresentInUserDefaults(key: HotelJazConstants.userDefault.userData)
        {
            self.navigationController?.present(LoginViewController.create(), animated: true, completion: nil)
        }
        else
        
        {
           let userData = UserDefaults.getObjectDefault(key: HotelJazConstants.userDefault.userData) as? User
            userName.text = userData?.fullName

        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @objc public static func create() -> ProfileViewController {
        
        return UIStoryboard(name: HotelJazConstants.StoryBoard.authSB, bundle: Bundle.main).instantiateViewController(withIdentifier: String(describing: self)) as! ProfileViewController
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func editProfileBtn(_ sender: Any) {
        
    }
}
