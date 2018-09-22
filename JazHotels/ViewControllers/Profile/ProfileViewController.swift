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
import LSDialogViewController

class ProfileViewController: UIViewController {

    @IBOutlet weak var profileImg: UIImageView!
    @IBOutlet weak var userName: UILabel!

    @IBOutlet weak var userTitle: McTextField!
    
    @IBOutlet weak var userMobile: UITextField!
    
    @IBOutlet weak var userCountry: McTextField!
    
    @IBOutlet weak var userCity: UITextField!
    @IBOutlet weak var userAddress: UITextField!
    
    @IBOutlet weak var userCreditNumber: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
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
    
    private var attributeNames:[String] = ["Title","Full Name","Gender","Phone Number","Country","Address","Membership Number"]
    var genderList:[String] = ["Male","Female"]
    
    override func viewWillLayoutSubviews()  {

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
            self.userData = UserDefaults.getObjectDefault(key: HotelJazConstants.userDefault.userData) as? UserProfile
            self.tableView.reloadData()

        }
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        NotificationCenter.default.addObserver(self, selector: #selector(ProfileViewController.getProfile(notification:)), name: Notification.Name(HotelJazConstants.Notifications.userProfileData), object: nil)
        

    }
    @IBAction func menuBtnAction(_ sender: Any) {
        
        
        
        
    }
    
    @objc private func getProfile(notification: Notification) {
        
        if notification.object != nil
        {
            self.userData = notification.object as? UserProfile
        }
    
       // setUserData()
       
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
extension ProfileViewController : UITableViewDataSource , UITableViewDelegate
{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "profile_cell", for: indexPath) as! ProfileCellTableViewCell
        cell.attributeName.text = attributeNames[indexPath.row]
        if indexPath.row == 0 // title
        {
            cell.attributeValue.text = userData?.title ?? ""
        }
        else if indexPath.row == 1 // full Name
        {
            cell.attributeValue.text = userData?.userName?.fullName ?? ""
        }
        else if indexPath.row == 2 // gender
        {
            cell.attributeValue.text = userData?.gender ?? ""
        }
        else if indexPath.row == 3 // phone
        {
            cell.attributeValue.text = userData?.userContact?.phoneNumbers ?? ""
        }
        else if indexPath.row == 4 // country
        {
            cell.attributeValue.text = userData?.userAddress?.city ?? ""
        }
        else if indexPath.row == 5 // address
        {
            cell.attributeValue.text = userData?.userAddress?.fullAddress ??  ""
        }
        else if indexPath.row == 6 // membership
        {
            cell.attributeValue.text = userData?.userCustomer?.membershipNumber ??  ""
        }
      
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let dialogViewController: DropDownDialogue = DropDownDialogue(nibName:"DropDownDialogue", bundle: nil)
        dialogViewController.optionArray = countries
        dialogViewController.optionId = []
        //        dialogViewController.modalPresentationStyle = .overFullScreen
        self.presentDialogViewController(dialogViewController, animationPattern: LSAnimationPattern.zoomInOut, completion: { () -> Void in })

    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 80
    }
    
}
