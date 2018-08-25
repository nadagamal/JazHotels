//
//  AppDelegate.swift
//  JazHotels
//
//  Created by Nada Gamal Mohamed on 6/20/18.
//  Copyright © 2018 Jaz. All rights reserved.
//

import UIKit
import IQKeyboardManagerSwift
import Firebase
import GoogleSignIn
import FirebaseAuth
import FBSDKCoreKit
import TwitterKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate,UITabBarDelegate, GIDSignInDelegate {

    var window: UIWindow?
    open var tabbarController: UITabBarController?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.

        IQKeyboardManager.shared.enable = true

        UITabBar.appearance().layer.borderWidth = 0.0
        UITabBar.appearance().clipsToBounds = true
        
        GradientNavigationBar.appearance().colors = [Helper.hexStringToUIColor(hex: "DF1B8E"), Helper.hexStringToUIColor(hex: "7E0E8B"),Helper.hexStringToUIColor(hex: "5E0E8B")]

        GradientNavigationBar.appearance().startPoint = CGPoint.zero
        GradientNavigationBar.appearance().endPoint = CGPoint(x: 1, y: 1)

        
        FirebaseApp.configure()
        
        GIDSignIn.sharedInstance().clientID = FirebaseApp.app()?.options.clientID
        FBSDKApplicationDelegate.sharedInstance().application(application, didFinishLaunchingWithOptions: launchOptions)
        GIDSignIn.sharedInstance().delegate = self
        TWTRTwitter.sharedInstance().start(withConsumerKey: "btrzmWJV3VYvBqagPXDjKi1Mu", consumerSecret: "utYexWTFtmmJtEQiXp72J7Ke3jGjIxnFADHgj42Da64IjsOdpQ")


        
        
        return true
    }
    
  
    @available(iOS 9.0, *)
    func application(_ app: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey: Any] = [:]) -> Bool {
        
        

//        if TWTRTwitter.sharedInstance().application(app, open:url, options: options) {
//            return true
//        }
//
        return GIDSignIn.sharedInstance().handle(url,sourceApplication:options[UIApplicationOpenURLOptionsKey.sourceApplication] as? String,
                                                 annotation: [:]) || FBSDKApplicationDelegate.sharedInstance().application(app, open: url, options: options) || TWTRTwitter.sharedInstance().application(app, open: url, options: options)

            }
    
    
    func application(_ application: UIApplication, open url: URL, sourceApplication: String?, annotation: Any) -> Bool {
        return GIDSignIn.sharedInstance().handle(url,
                                                 sourceApplication: sourceApplication,
                                                 annotation: annotation)
    }
    
    func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        
    }
    
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error?) {
        // ...
        if error != nil {
            // ...
            return
        }
        
        guard user.authentication != nil else { return }
        let credential = GoogleAuthProvider.credential(withIDToken: user.authentication.idToken,
                                                       accessToken: user.authentication.accessToken)
        

        Auth.auth().signInAndRetrieveData(with: credential) { (authResult, error) in
            if error != nil {
                // ...
                return
            }
            // User is signed in
            // ...
        }
        
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: HotelJazConstants.SocialPath.kSocialAuthenticationPathGoogle), object: user)

        // ...
    }
    
    func sign(_ signIn: GIDSignIn!, didDisconnectWith user: GIDGoogleUser!, withError error: Error!) {
       
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: HotelJazConstants.SocialPath.kSocialAuthenticationPathGoogle), object: user)

    }
    
    

    
    

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

