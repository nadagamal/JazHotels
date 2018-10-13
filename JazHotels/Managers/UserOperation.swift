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
            //            let userData = UserDefaults.getUserDefault(key: HotelJazConstants.userDefault.userData) as? UserProfile
            let userData = UserDefaults.getObjectDefault(key: HotelJazConstants.userDefault.userData) as? UserProfile
            userData?.userCardPayment =  paymentCard
            
            UserDefaults.saveObjectDefault(key: HotelJazConstants.userDefault.userData, value: userData ?? "")
            
            db.collection("users").document(userData!.userId ?? "").setData(userData?.toDictionary() ?? [:]) { err in
                if let err = err {
                    print("Error writing document: \(err)")
                } else {
                    print("Document successfully written!")
                }
            }
        }
    }
    
    
    static   func updateUser(user:UserProfile)
    {
        UserDefaults.saveObjectDefault(key: HotelJazConstants.userDefault.userData, value: user)
        
        let db = Firestore.firestore()
        db.collection("users").document("\(String(describing: (user.userId)!))").updateData(user.toDictionary())
    }
    
    static func removeReservation(firestoreHotelReservation:FirestoreHotelReservation)
    {
        let db = Firestore.firestore()
        let settings = db.settings
        settings.areTimestampsInSnapshotsEnabled = true
        db.settings = settings
        let userData = UserDefaults.getObjectDefault(key: HotelJazConstants.userDefault.userData) as? UserProfile

        db.collection("users").document(userData!.userId ?? "").collection("hotelReservations").getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                var found = false
                for document in querySnapshot!.documents {
                    if document.documentID == firestoreHotelReservation.confirmationId// already exsit (Nada hwa ana 3yza a3fa document id hwa bysave b eh y3ni hotel code wala feen Id elly 2lotili 3leh msh mktob fe object)
                    {
                        found = true
                        // remove reservation
                       db.collection("users").document(userData!.userId ?? "").collection("hotelReservations").document(firestoreHotelReservation.hotelCode ?? "").delete(completion: { (error) in
                            print("Error deleting document: \(String(describing: err))")
                            
                        })
                    }
                    if !found // save reservation
                    {
                        print("Not found")
                    }
                    
                }
            }
            
        }
    }
    
    static func addReservation(firestoreHotelReservation:FirestoreHotelReservation)
    {
        let db = Firestore.firestore()
        let settings = db.settings
        settings.areTimestampsInSnapshotsEnabled = true
        db.settings = settings
        
        let userData = UserDefaults.getObjectDefault(key: HotelJazConstants.userDefault.userData) as? UserProfile
        
        db.collection("users").document(userData!.userId ?? "").collection("hotelReservations").getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                var found = false
                for document in querySnapshot!.documents {
                    if document.documentID == firestoreHotelReservation.hotelCode// already exsit (Nada hwa ana 3yza a3fa document id hwa bysave b eh y3ni hotel code wala feen Id elly 2lotili 3leh msh mktob fe object)
                    {
                        found = true
                        // update reservation
                        db.collection("users").document(userData!.userId ?? "").collection("hotelReservations").document().setData(firestoreHotelReservation.toDictionary()) { err in
                            if let err = err {
                                print("Error writing document: \(err)")
                            } else {
                                print("Document successfully written!")
                            }
                        }
                        break
                    }
                }
                
                if !found // save reservation
                {
                    self.saveReservation(firestoreHotelReservation: firestoreHotelReservation)
                }
                
            }
        }
        
    }
    
    
    static func saveReservation(firestoreHotelReservation:FirestoreHotelReservation)
    {
        let db = Firestore.firestore()
        let userData = UserDefaults.getObjectDefault(key: HotelJazConstants.userDefault.userData) as? UserProfile
        
          db.collection("users").document(userData!.userId ?? "").collection("hotelReservations").document("\(String(describing: (firestoreHotelReservation.hotelCode)!))").setData(firestoreHotelReservation.toDictionary()) { err in
            if let err = err {
                print("Error writing document: \(err)")
            } else {
                print("Document successfully written!")
            }
        }
    }
    
    static func getReservations(completion:  @escaping (_ :[FirestoreHotelReservation]?) -> Void)
    {
        let db = Firestore.firestore()
        let settings = db.settings
        settings.areTimestampsInSnapshotsEnabled = true
        db.settings = settings
        var reservations = [FirestoreHotelReservation]()
        let userData = UserDefaults.getObjectDefault(key: HotelJazConstants.userDefault.userData) as? UserProfile
        db.collection("users").document(userData!.userId ?? "").collection("hotelReservations").getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                for document in querySnapshot!.documents {
                var item = FirestoreHotelReservation(JSON: document.data())
                    reservations.append(item!)
                }
                completion(reservations)
                
            }
        }
    }
}
