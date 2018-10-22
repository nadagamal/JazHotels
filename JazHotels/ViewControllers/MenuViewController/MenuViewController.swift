//
//  MenuViewController.swift
//  JazHotels
//
//  Created by Nada Gamal Mohamed on 9/9/18.
//  Copyright © 2018 Jaz. All rights reserved.
//

import UIKit
import FBSDKLoginKit
import FirebaseUI
import FirebaseAuth
import FirebaseFirestore
import SVProgressHUD
class MenuViewController: UIViewController ,FUIAuthDelegate{
    
    @IBOutlet weak var tableView: UITableView!
    fileprivate(set) var auth: Auth? = Auth.auth()
    fileprivate(set) var authUI: FUIAuth? = FUIAuth.defaultAuthUI()
    fileprivate var authStateDidChangeHandle: AuthStateDidChangeListenerHandle?
    fileprivate let db = Firestore.firestore()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.tableFooterView = UIView()
        self.navigationController?.navigationBar.tintColor = UIColor.white
        
        self.authUI?.delegate = self
        let providers: [FUIAuthProvider] = [
            FUIGoogleAuth(),
            FUIFacebookAuth(),
            ]
        self.authUI!.providers = providers
        let settings = db.settings
        settings.areTimestampsInSnapshotsEnabled = true
        db.settings = settings
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func authUI(_ authUI: FUIAuth, didSignInWith authDataResult: AuthDataResult?, error: Error?) {
        if authDataResult != nil{
        checkAccountFound(user: authDataResult!)
        }
    }
    
    func checkAccountFound(user:AuthDataResult)
    {
        db.collection("users").getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                var found = false
                for document in querySnapshot!.documents {
                    if document.documentID == user.user.uid // sigin
                    {
                        print("\(document.documentID) => \(document.data())")
                        
                        let data = document.data() as NSDictionary
                        let userProfile = UserProfile(userContact: UserContact(JSON: data["contact"] as! [String:Any])!, userName: UserName(JSON: data["name"] as! [String:Any])!, userAddress: UserAddress(JSON: data["address"] as! [String:Any])!, userCustomer: UserCustomerLoyalty(JSON: data["customerLoyalty"] as! [String:Any])!, userCardPayment: UserPaymentCard(JSON: data["paymentCard"] as! [String:Any])!, userSynXisInfo: UserSynXisInfo(JSON: data["synXisInfo"] as! [String:Any])!,gender:data["gender"] as! String,userId:user.user.uid,title:data["title"] as? String ?? "")
                        
                        UserDefaults.saveObjectDefault(key: HotelJazConstants.userDefault.userData, value: userProfile)
                        found = true
                        self.viewProfile(userData: userProfile)
                        break
                    }
                    
                }
                
                
                if !found // create user
                {
                    self.createNewUser()
                    
                }
                
                DispatchQueue.main.async {
                    SVProgressHUD.dismiss()
                }
            }
        }
    }
    func viewProfile(userData:UserProfile)
    {
        DispatchQueue.main.async {
            
            UserDefaults.saveObjectDefault(key: HotelJazConstants.userDefault.userData, value: userData)
            
            NotificationCenter.default.post(name: Notification.Name(HotelJazConstants.Notifications.userProfileData), object: userData)
            
            self.dismiss(animated: true, completion: nil)
        }
    }
    func createNewUser()
    {
        let db = Firestore.firestore()
        let user = Auth.auth().currentUser
        
        let userProfile = UserProfile(userContact: UserContact(emailAddress: (user?.email ?? "")!, landLine: "", mobilePhone: (user?.phoneNumber ?? "")!, phoneNumbers: (user?.phoneNumber ?? "")!), userName: UserName(firstName: (user?.displayName ?? "")!, fullName: (user?.displayName ?? "")!, lastName: "", middleInitial: "", middleName: "", photo:(user?.photoURL?.absoluteString ?? "")!), userAddress: UserAddress(), userCustomer: UserCustomerLoyalty(), userCardPayment: UserPaymentCard(), userSynXisInfo: UserSynXisInfo(synXisPassword: (user?.email ?? "")!, synXisUserID: (user?.email ?? "")!),gender:"",userId:(user?.uid)! , title : "Mr.")
        
        
        db.collection("users").document("\(String(describing: (user?.uid)!))").setData(userProfile.toDictionary()) { err in
            if let err = err {
                print("Error writing document: \(err)")
            } else {
                print("Document successfully written!")
            }
        }
        
        self.viewProfile(userData: userProfile)
        
    }

}
extension MenuViewController:UITableViewDataSource,UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell:MenuCell = tableView.dequeueReusableCell(withIdentifier: "cell") as! MenuCell
        if indexPath.row == 0
        {
            
            if !UserDefaults.isKeyPresentInUserDefaults(key: HotelJazConstants.userDefault.userData)
            {
                cell.cellTitleLbl.text = "Sign In"
                cell.cellIconImg.image = UIImage(named: "signIn")
            }
            else
            {
                cell.cellTitleLbl.text = "Sign out"
                cell.cellIconImg.image = UIImage(named: "signOut")
            }
        }
        else if indexPath.row == 1 && UserDefaults.isKeyPresentInUserDefaults(key: HotelJazConstants.userDefault.userData)
        {
            cell = tableView.dequeueReusableCell(withIdentifier: "ReservationCell") as! MenuCell
            cell.cellTitleLbl.text = "Reservation"
            cell.cellIconImg.image = #imageLiteral(resourceName: "reservation")
        }
        else{
            cell = tableView.dequeueReusableCell(withIdentifier: "ContactUs") as! MenuCell
            cell.cellTitleLbl.text = "Contact Us"
            cell.cellIconImg.image = #imageLiteral(resourceName: "call-answer")
        }
        return cell
        
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if !UserDefaults.isKeyPresentInUserDefaults(key: HotelJazConstants.userDefault.userData)
        {
            return 2
        }
        else
        {
            return 3
        }
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.row == 0 {
            DispatchQueue.main.async {
                if !UserDefaults.isKeyPresentInUserDefaults(key: HotelJazConstants.userDefault.userData)
                {
                    FBSDKLoginManager().logOut()
                    
                    // self.navigationController?.present(LoginViewController.create(), animated: true, completion: nil)
                    
                    let controller = self.authUI!.authViewController()
                    self.navigationController?.present(controller, animated: true, completion: nil)
                    
                }
                else
                {
                    //  self.navigationController?.present(LoginViewController.create(), animated: true, completion: nil)
                    let controller = self.authUI!.authViewController()
                    self.navigationController?.present(controller, animated: true, completion: nil)
                    UserDefaults.removeKeyUserDefault(key:  HotelJazConstants.userDefault.userData)
                    
                }
            }
        }
        else // reservartion
        {
            
        }
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        let cellToDeSelect:UITableViewCell = tableView.cellForRow(at: indexPath as IndexPath)!
        cellToDeSelect.contentView.backgroundColor = UIColor.clear
    }
}
