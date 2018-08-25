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

class LoginViewController: UIViewController , GIDSignInUIDelegate  {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        GIDSignIn.sharedInstance().uiDelegate = self
        NotificationCenter.default.addObserver(self, selector: #selector(LoginViewController.signInWithGoogle(notification:)), name: Notification.Name(HotelJazConstants.SocialPath.kSocialAuthenticationPathGoogle), object: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
        }
        
    }
    
    @IBAction func siginGoogleAction(_ sender: Any) {
        SVProgressHUD.show()
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
                    
                    print("Sucess")
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
                        
                        print("Sucess")
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
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error?) {
        if error != nil {
            return
        }
        
        guard let authentication = user.authentication else { return }
        let credential = GoogleAuthProvider.credential(withIDToken: authentication.idToken,
                                                       accessToken: authentication.accessToken)
        
        
        Auth.auth().signInAndRetrieveData(with: credential) { (authResult, error) in
            if error != nil {
                // ...
                return
            }
            // User is signed in
            // ...
        }
    }
}
