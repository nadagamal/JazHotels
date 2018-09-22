//
//  LoginViewController.swift
//  JazHotels
//
//  Created by Zeinab Reda on 8/13/18.
//  Copyright © 2018 Jaz. All rights reserved.
//

import UIKit
import Firebase
import GoogleSignIn
import FirebaseAuth
import Firebase
import FBSDKLoginKit
import TwitterKit
import SVProgressHUD
import FirebaseFirestore

class LoginViewController: UIViewController , GIDSignInUIDelegate  {
    
    fileprivate let db = Firestore.firestore()
    fileprivate var user:User?

    override func viewDidLoad() {
        super.viewDidLoad()
        GIDSignIn.sharedInstance().uiDelegate = self
        NotificationCenter.default.addObserver(self, selector: #selector(LoginViewController.signInWithGoogle(notification:)), name: Notification.Name(HotelJazConstants.SocialPath.kSocialAuthenticationPathGoogle), object: nil)
        let settings = db.settings
        settings.areTimestampsInSnapshotsEnabled = true
        db.settings = settings

    }
    
    @objc public static func create() -> LoginViewController {
        
        return UIStoryboard(name: HotelJazConstants.StoryBoard.authSB, bundle: Bundle.main).instantiateViewController(withIdentifier: String(describing: self)) as! LoginViewController
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func closeView(_ sender: Any) {

        let mainSB = UIStoryboard(name: HotelJazConstants.StoryBoard.mainSB, bundle: nil)
        let tabBarHome = mainSB.instantiateViewController(withIdentifier: "HomeTabbar") as? RaisedTabBarController
        DispatchQueue.main.async {
            self.present(tabBarHome!, animated: false, completion: nil)
        }
        
    }
    @objc private func signInWithGoogle(notification: Notification) {
        
        let user = notification.object as! GIDGoogleUser
   

        guard let authentication = user.authentication else { return }
        let credential = GoogleAuthProvider.credential(withIDToken: authentication.idToken,
                                                       accessToken: authentication.accessToken)
        
        
        Auth.auth().signInAndRetrieveData(with: credential) { (authResult, error) in
            if error != nil {
                DispatchQueue.main.async {
                    SVProgressHUD.dismiss()
                }
                print(error?.localizedDescription ?? "")
                return
            }
            
            self.checkAccountFound(user: authResult!)
        }
        
    }
    
    @IBAction func siginGoogleAction(_ sender: Any) {
        DispatchQueue.main.async {
            SVProgressHUD.show()
            
        }
        GIDSignIn.sharedInstance().signIn()
    }
    
    @IBAction func siginFacebookAction(_ sender: Any) {
        
        SVProgressHUD.show()

        let fbLoginManager = FBSDKLoginManager()
        fbLoginManager.logIn(withReadPermissions: ["public_profile", "email"], from: self) { (result, error) in
    

            if let error = error {
              
                print("Failed to login: \(error.localizedDescription)")
                return
            }
            
            guard let accessToken = FBSDKAccessToken.current() else {
                print("Failed to get access token")
                return
            }
            
            let credential = FacebookAuthProvider.credential(withAccessToken: accessToken.tokenString)
            
            // Perform login by calling Firebase APIs
            Auth.auth().signInAndRetrieveData(with: credential, completion: { (authResult, error) in
               
                if let error = error {
                    DispatchQueue.main.async {
                        SVProgressHUD.dismiss()
                    }
                    print("Login error: \(error.localizedDescription)")
                    DispatchQueue.main.async {
                    let alertController = UIAlertController(title: "Login Error", message: error.localizedDescription, preferredStyle: .alert)
                    let okayAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    alertController.addAction(okayAction)
                    self.present(alertController, animated: true, completion: nil)
                    }
                    
                    return
                }
                    
                else
                {
                    self.checkAccountFound(user: authResult!)

                }
            })
            
        }
    }
    
    
    
    @IBAction func siginTwitterAction(_ sender: Any) {
        
        TWTRTwitter.sharedInstance().logIn(completion: { [weak self] (session, error) in
            SVProgressHUD.show()

            if (session != nil) {
                debugPrint("signed in as \(String(describing: session?.userName))")
                debugPrint("signed in as \(String(describing: session?.authToken))")
                debugPrint("signed in as \(String(describing: session?.authTokenSecret))")
                
                let credential = TwitterAuthProvider.credential(withToken: (session?.authToken)!, secret: (session?.authTokenSecret)!)
                
                Auth.auth().signInAndRetrieveData(with: credential) { (authResult, error) in
                   
                    if let error = error {
                        DispatchQueue.main.async {
                            SVProgressHUD.dismiss()
                        print("Login error: \(error.localizedDescription)")
                        let alertController = UIAlertController(title: "Login Error", message: error.localizedDescription, preferredStyle: .alert)
                        let okayAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                        alertController.addAction(okayAction)
                        self?.present(alertController, animated: true, completion: nil)
                        }
                        
                        return
                    }
                        
                    else
                    {
                        self?.checkAccountFound(user: authResult!)

                    }
                  
                    
                }
                
            } else {
                DispatchQueue.main.async {
                    SVProgressHUD.dismiss()
                }
                debugPrint("error: \(String(describing: error?.localizedDescription))")
                
            }
        })
        
    }
    
    
    func viewProfile(userData:UserProfile)
    {
        DispatchQueue.main.async {

        UserDefaults.saveObjectDefault(key: HotelJazConstants.userDefault.userData, value: userData)
        
        NotificationCenter.default.post(name: Notification.Name(HotelJazConstants.Notifications.userProfileData), object: userData)

        self.dismiss(animated: true, completion: nil)
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
    
    
    func createNewUser()
    {
        let db = Firestore.firestore()
        let user = Auth.auth().currentUser

        let userProfile = UserProfile(userContact: UserContact(emailAddress: (user?.email ?? "")!, landLine: "", mobilePhone: "", phoneNumbers: (user?.phoneNumber ?? "")!), userName: UserName(firstName: (user?.displayName ?? "")!, fullName: (user?.displayName ?? "")!, lastName: "", middleInitial: "", middleName: "", photo:(user?.photoURL?.absoluteString ?? "")!), userAddress: UserAddress(), userCustomer: UserCustomerLoyalty(), userCardPayment: UserPaymentCard(), userSynXisInfo: UserSynXisInfo(synXisPassword: (user?.email ?? "")!, synXisUserID: (user?.email ?? "")!),gender:"",userId:(user?.uid)! , title : "Mr.")
            
            
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
