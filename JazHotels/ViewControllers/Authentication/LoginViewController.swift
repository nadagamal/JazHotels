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
//        let settings = db.settings
//        settings.areTimestampsInSnapshotsEnabled = true
//        db.settings = settings
//
//        var ref: DocumentReference? = nil
//        ref = db.collection("users").addDocument(data: [
//            "first": "Zeinab",
//            "last": "Reda"
//        ]) { err in
//            if let err = err {
//                print("Error adding document: \(err)")
//            } else {
//                print("Document added with ID: \(ref!.documentID)")
//            }
//        }

    }
    
    @objc public static func create() -> LoginViewController {
        
        return UIStoryboard(name: HotelJazConstants.StoryBoard.authSB, bundle: Bundle.main).instantiateViewController(withIdentifier: String(describing: self)) as! LoginViewController
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func closeView(_ sender: Any) {
//        self.dismiss(animated: true, completion: nil)
//        self.navigationController?.dismiss(animated: true, completion: {
//
//            tabBarHome?.selectedIndex = 0
//
//        })
        
        let mainSB = UIStoryboard(name: HotelJazConstants.StoryBoard.mainSB, bundle: nil)
        let tabBarHome = mainSB.instantiateViewController(withIdentifier: "HomeTabbar") as? RaisedTabBarController
        self.present(tabBarHome!, animated: true, completion: nil)
        
    }
    @objc private func signInWithGoogle(notification: Notification) {
        
        SVProgressHUD.dismiss()
        let user = notification.object as! GIDGoogleUser
        
        guard let authentication = user.authentication else { return }
        let credential = GoogleAuthProvider.credential(withIDToken: authentication.idToken,
                                                       accessToken: authentication.accessToken)
        
        
        Auth.auth().signInAndRetrieveData(with: credential) { (authResult, error) in
            if error != nil {
                
                print(error?.localizedDescription ?? "")
                return
            }
            print(authResult?.user.email)
            self.user?.fullName = authResult?.user.displayName
            self.user?.emailAddress = authResult?.user.email
            self.viewProfile()
        }
        
    }
    
    @IBAction func siginGoogleAction(_ sender: Any) {
        GIDSignIn.sharedInstance().signIn()
    }
    
    @IBAction func siginFacebookAction(_ sender: Any) {
        
        
        let fbLoginManager = FBSDKLoginManager()
        fbLoginManager.logIn(withReadPermissions: ["public_profile", "email"], from: self) { (result, error) in
    
            SVProgressHUD.show()

            if let error = error {
                DispatchQueue.main.async {
                    SVProgressHUD.dismiss()
                }
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
                
                DispatchQueue.main.async {
                    SVProgressHUD.dismiss()
                }
                
                if let error = error {
                    print("Login error: \(error.localizedDescription)")
                    let alertController = UIAlertController(title: "Login Error", message: error.localizedDescription, preferredStyle: .alert)
                    let okayAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    alertController.addAction(okayAction)
                    self.present(alertController, animated: true, completion: nil)
                    
                    return
                }
                    
                else
                {
                    print(authResult?.user.email)
                    self.user?.fullName = authResult?.user.displayName
                    self.user?.emailAddress = authResult?.user.email
                    self.viewProfile()
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
                    DispatchQueue.main.async {
                        SVProgressHUD.dismiss()
                    }
                    
                    if let error = error {
                        print("Login error: \(error.localizedDescription)")
                        let alertController = UIAlertController(title: "Login Error", message: error.localizedDescription, preferredStyle: .alert)
                        let okayAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                        alertController.addAction(okayAction)
                        self?.present(alertController, animated: true, completion: nil)
                        
                        return
                    }
                        
                    else
                    {
                        self?.user?.fullName = authResult?.user.displayName
                        self?.user?.emailAddress = authResult?.user.email

                        self?.viewProfile()
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
    
    
    func viewProfile()
    {
        UserDefaults.saveObjectDefault(key: HotelJazConstants.userDefault.userData, value: self.user ?? "")

        self.dismiss(animated: true, completion: nil)

     
        
        
        
    }
   
}
