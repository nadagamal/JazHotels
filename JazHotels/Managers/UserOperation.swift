//
//  UserOperation.swift
//  JazHotels
//
//  Created by Zeinab Reda on 9/18/18.
//  Copyright © 2018 Jaz. All rights reserved.
//

import UIKit
import Firebase

class UserOperation: NSObject {

    static func saveUserCreditCard(paymentCard:UserPaymentCard)
    {
        let db = Firestore.firestore()
        
        if UserDefaults.isKeyPresentInUserDefaults(key: HotelJazConstants.userDefault.userData)
        {
            let userData = UserDefaults.getUserDefault(key: HotelJazConstants.userDefault.userData) as! UserProfile
            
            userData.userCardPayment =  paymentCard
            
            UserDefaults.saveObjectDefault(key: HotelJazConstants.userDefault.userData, value: userData)
            
            db.collection("users").document(userData.userId ?? "").setData(userData.toDictionary()) { err in
                if let err = err {
                    print("Error writing document: \(err)")
                } else {
                    print("Document successfully written!")
                }
            }
        }
    }
    
}
