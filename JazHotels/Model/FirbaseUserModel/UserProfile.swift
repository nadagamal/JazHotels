//
//  UserProfile.swift
//  JazHotels
//
//  Created by Zeinab Reda on 9/11/18.
//  Copyright © 2018 Jaz. All rights reserved.
//

import UIKit

class UserProfile: NSObject , NSCoding{

    var userContact:UserContact?
    var userName:UserName?
    var userAddress:UserAddress?
    var userCustomer:UserCustomerLoyalty?
    var userCardPayment:UserPaymentCard?
    var firestoreHotelReservation:FirestoreHotelReservation?
    var userSynXisInfo:UserSynXisInfo?
    var gender:String?
    var userId:String?
    var title:String?
    
    init( userContact:UserContact,userName:UserName ,userAddress:UserAddress , userCustomer:UserCustomerLoyalty , userCardPayment:UserPaymentCard, userSynXisInfo:UserSynXisInfo?,gender:String,userId:String,title:String) {
        self.userName = userName
        self.userAddress = userAddress
        self.userContact = userContact
        self.userCustomer = userCustomer
        self.userSynXisInfo = userSynXisInfo
        self.userCardPayment = userCardPayment
        self.gender = gender
        self.userId = userId
        self.title = title
    }
    
    
    func toDictionary() -> [String:Any]
    {
        var dictionary :[String:Any] = [:]
        if userName != nil{
            dictionary["name"] = userName?.toJSON()
        }
        if userAddress != nil{
            dictionary["address"] = userAddress?.toJSON()
        }
        if userContact != nil{
            dictionary["contact"] = userContact?.toJSON()
        }
        if userCustomer != nil{
            dictionary["customerLoyalty"] = userCustomer?.toJSON()
        }
        if userSynXisInfo != nil{
            dictionary["synXisInfo"] = userSynXisInfo?.toJSON()
        }
        if userCardPayment != nil{
            dictionary["paymentCard"] = userCardPayment?.toJSON()
        }
        if gender != nil{
            dictionary["gender"] = gender
        }
        
        if title != nil
        {
             dictionary["title"] = title
        }
        
        return dictionary
    }
    /**
     * NSCoding required initializer.
     * Fills the data from the passed decoder
     */
    @objc required init(coder aDecoder: NSCoder)
    {
        userName = aDecoder.decodeObject(forKey: "userName") as? UserName
        userAddress = aDecoder.decodeObject(forKey: "userAddress") as? UserAddress
        userContact = aDecoder.decodeObject(forKey: "userContact") as? UserContact
        userCustomer = aDecoder.decodeObject(forKey: "userCustomer") as? UserCustomerLoyalty
        userSynXisInfo = aDecoder.decodeObject(forKey: "userSynXisInfo") as? UserSynXisInfo
        userCardPayment = aDecoder.decodeObject(forKey: "userCardPayment") as? UserPaymentCard
        gender = aDecoder.decodeObject(forKey: "gender") as? String
        userId = aDecoder.decodeObject(forKey: "userId") as? String
        title = aDecoder.decodeObject(forKey: "title") as? String
        

    }
    
    /**
     * NSCoding required method.
     * Encodes mode properties into the decoder
     */
    @objc func encode(with aCoder: NSCoder)
    {
        if userName != nil{
            aCoder.encode(userName, forKey: "userName")
        }
        if userAddress != nil{
            aCoder.encode(userAddress, forKey: "userAddress")
        }
        if userContact != nil{
            aCoder.encode(userContact, forKey: "userContact")
        }
        if userCustomer != nil{
            aCoder.encode(userCustomer, forKey: "userCustomer")
        }
        if userSynXisInfo != nil{
            aCoder.encode(userSynXisInfo, forKey: "userSynXisInfo")
        }
        if userCardPayment != nil{
            aCoder.encode(userCardPayment, forKey: "userCardPayment")
        }
        if gender != nil{
            aCoder.encode(gender, forKey: "gender")
        }
        if userId != nil{
            aCoder.encode(userId, forKey: "userId")
        }
        if title != nil {
            aCoder.encode(title, forKey: "title")
        }
        
    }
    
}
