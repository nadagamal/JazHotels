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

class LoginViewController: UIViewController , GIDSignInUIDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        NotificationCenter.default.addObserver(self, selector: #selector(LoginViewController.signInWithGoogle(notification:)), name: Notification.Name(HotelJazConstants.SocialPath.kSocialAuthenticationPathGoogle), object: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @objc private func signInWithGoogle(notification: Notification) {
        
//        let user = notification.object as! GIDGoogleUser
        
    }
    
    @IBAction func siginGoogleAction(_ sender: Any) {
        
        GIDSignIn.sharedInstance().signIn()
        
    }
    
    @IBAction func siginFacebookAction(_ sender: Any) {
        
    }
    @IBAction func siginTwitterAction(_ sender: Any) {
        
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
