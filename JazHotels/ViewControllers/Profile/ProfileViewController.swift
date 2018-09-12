//
//  ProfileViewController.swift
//  JazHotels
//
//  Created by Zeinab Reda on 7/4/18.
//  Copyright © 2018 Jaz. All rights reserved.
//

import UIKit
import FirebaseFirestore
import McPicker

class ProfileViewController: UITableViewController {

    @IBOutlet weak var profileImg: UIImageView!
    @IBOutlet weak var userName: UILabel!

    @IBOutlet weak var userTitle: McTextField!
    
    @IBOutlet weak var userMobile: UITextField!
    
    @IBOutlet weak var userCountry: McTextField!
    
    @IBOutlet weak var userCity: UITextField!
    @IBOutlet weak var userAddress: UITextField!
    
    @IBOutlet weak var userCreditNumber: UITextField!
    
    static var user:User?
    
    fileprivate var userData:UserProfile?
    var countries: [String] = {
        
        var arrayOfCountries: [String] = []
        
        for code in NSLocale.isoCountryCodes as [String] {
            let id = NSLocale.localeIdentifier(fromComponents: [NSLocale.Key.countryCode.rawValue: code])
            let name = NSLocale(localeIdentifier: "en_UK").displayName(forKey: NSLocale.Key.identifier, value: id) ?? "Country not found for code: \(code)"
            arrayOfCountries.append(name)
        }
        
        return arrayOfCountries
    }()
    
    var genderList:[String] = ["Male","Female"]
    
    override func viewWillLayoutSubviews()  {
        self.tableView.backgroundView?.layer.insertSublayer(UIColor.appColor(), at: 0)

    }
    override func viewDidAppear(_ animated: Bool) {
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
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
        
//        userCountry.optionArray = countries
//        userCountry.didSelect { (selectedText, index, id) in
//            print(selectedText)
//            self.userData?.userAddress?.country = selectedText
//            self.updateUser(user: self.userData!)
//        }
//        userTitle.optionArray = genderList
//        userTitle.didSelect { (selectedText, index, id) in
//            print(selectedText)
//            self.userData?.gender = selectedText
//            self.updateUser(user: self.userData!)
//        }
        
        
        var mcInputView = McPicker(data: [countries])
        mcInputView.backgroundColor = .gray
        userCountry.inputViewMcPicker = mcInputView
        userCountry.doneHandler = { [weak userCountry] (selections) in
            userCountry?.text = selections[0]!
            self.userData?.userAddress?.country = selections[0]!
            self.updateUser(user: self.userData!)
        }
        userCountry.selectionChangedHandler = { [weak userCountry] (selections, componentThatChanged) in
            userCountry?.text = selections[componentThatChanged]!
        
        }
      
        userCountry.textFieldWillBeginEditingHandler = { [weak userCountry] (selections) in
            if userCountry?.text == "" {
                // Selections always default to the first value per component
                userCountry?.text = selections[0]
            }
        }
        
        
        
        
        mcInputView = McPicker(data: [genderList])
        mcInputView.backgroundColor = .gray
        userTitle.inputViewMcPicker = mcInputView
        userTitle.doneHandler = { [weak userTitle] (selections) in
            userTitle?.text = selections[0]!
            self.userData?.gender  = selections[0]!
            self.updateUser(user: self.userData!)
        }
        userTitle.selectionChangedHandler = { [weak userTitle] (selections, componentThatChanged) in
            userTitle?.text = selections[componentThatChanged]!
            
        }
        
        userTitle.textFieldWillBeginEditingHandler = { [weak userTitle] (selections) in
            if userTitle?.text == "" {
                // Selections always default to the first value per component
                userTitle?.text = selections[0]
            }
        }
    }
    
    @objc private func getProfile(notification: Notification) {
        
        if notification.object != nil
        {
            self.userData = notification.object as? UserProfile
        }
    
        setUserData()
       
    }
 

    
    func setUserData()
    {
         let userData = UserDefaults.getObjectDefault(key: HotelJazConstants.userDefault.userData) as? UserProfile
        self.userData = userData
        self.userName.text = userData?.userName?.fullName ?? ""
        self.userTitle.text = userData?.gender ?? ""
        self.userMobile.text = userData?.userContact?.phoneNumbers ?? ""
        self.userCountry.text = userData?.userAddress?.country ?? ""
        self.userCity.text = userData?.userAddress?.city ?? ""
        self.userAddress.text = userData?.userAddress?.addressLine1 ??  ""
        self.userCreditNumber.text = userData?.userCardPayment?.cardNumber ?? ""
    }
    @objc public static func create() -> ProfileViewController {
        
        return UIStoryboard(name: HotelJazConstants.StoryBoard.authSB, bundle: Bundle.main).instantiateViewController(withIdentifier: String(describing: self)) as! ProfileViewController
    }

 
    @IBAction func creditNumberChanged(_ sender: Any) {
        self.userData?.userCardPayment?.cardNumber  = userCreditNumber.text!
        self.updateUser(user: self.userData!)
    }
    @IBAction func phoneNumberChange(_ sender: Any) {
        self.userData?.userContact?.phoneNumbers  = userMobile.text!
        self.updateUser(user: self.userData!)

    }
    
    @IBAction func cityChange(_ sender: Any) {
        self.userData?.userAddress?.city  = userCity.text!
        self.updateUser(user: self.userData!)
    }
    
    @IBAction func areaChange(_ sender: Any) {
        self.userData?.userAddress?.fullAddress  = userAddress.text!
        self.updateUser(user: self.userData!)
    }
    func updateUser(user:UserProfile)
    {
        UserDefaults.saveObjectDefault(key: HotelJazConstants.userDefault.userData, value: user)

        let db = Firestore.firestore()
        db.collection("users").document("\(String(describing: (user.userId)!))").updateData(user.toDictionary())
       
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
   
}
