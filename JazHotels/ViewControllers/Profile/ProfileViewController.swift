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
    
    @IBOutlet weak var userCity: UILabel!
    @IBOutlet weak var userAddress: UILabel!
    
    @IBOutlet weak var userCreditNumber: UILabel!
    
    static var user:User?
    
    fileprivate var userData:UserProfile?
    
    
    override func viewDidLayoutSubviews() {
        setStatusBarBackgroundColor()
    }
    override func viewWillAppear(_ animated: Bool) {
        
        
        
        self.navigationController?.navigationBar.setGradientBackground()
        
        if !UserDefaults.isKeyPresentInUserDefaults(key: HotelJazConstants.userDefault.userData)
        {
            self.navigationController?.present(LoginViewController.create(), animated: true, completion: nil)
        }
        else
        
        {
            setUserData()
        }
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        NotificationCenter.default.addObserver(self, selector: #selector(ProfileViewController.getProfile(notification:)), name: Notification.Name(HotelJazConstants.Notifications.userProfileData), object: nil)
    }
    
    @objc private func getProfile(notification: Notification) {
        
        if notification.object != nil
        {
            self.userData = notification.object as? UserProfile
        }
        
        
        setUserData()
       
    }
    

    func setStatusBarBackgroundColor() {
        
//        if let statusbar = UIApplication.shared.value(forKey: "statusBar") as? UIView {
//            statusbar.backgroundColor = UIColor.appColor()
//        }
    }

    
    func setUserData()
    {
         let userData = UserDefaults.getObjectDefault(key: HotelJazConstants.userDefault.userData) as? UserProfile
        self.userName.text = userData?.userName?.fullName
        self.userTitle.text = userData?.gender
        self.userMobile.text = userData?.userContact?.phoneNumbers
        self.userCountry.text = userData?.userAddress?.country
        self.userCity.text = userData?.userAddress?.city
        self.userAddress.text = userData?.userAddress?.addressLine1
        self.userCreditNumber.text = userData?.userCardPayment?.cardNumber
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
