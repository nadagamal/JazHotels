//
//	CBPaymentCard.swift
//
//	Create by Nada Gamal on 18/9/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class CBPaymentCard : NSObject, NSCoding{

	var cardHolderName : String!
	var cardCode : String!
	var cardNumber : String!
	var cardType : String!
	var expireDate : String!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		cardHolderName = dictionary["CardHolderName"] as? String
		cardCode = dictionary["_CardCode"] as? String
		cardNumber = dictionary["_CardNumber"] as? String
		cardType = dictionary["_CardType"] as? String
		expireDate = dictionary["_ExpireDate"] as? String
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if cardHolderName != nil{
			dictionary["CardHolderName"] = cardHolderName
		}
		if cardCode != nil{
			dictionary["_CardCode"] = cardCode
		}
		if cardNumber != nil{
			dictionary["_CardNumber"] = cardNumber
		}
		if cardType != nil{
			dictionary["_CardType"] = cardType
		}
		if expireDate != nil{
			dictionary["_ExpireDate"] = expireDate
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         cardHolderName = aDecoder.decodeObject(forKey: "CardHolderName") as? String
         cardCode = aDecoder.decodeObject(forKey: "_CardCode") as? String
         cardNumber = aDecoder.decodeObject(forKey: "_CardNumber") as? String
         cardType = aDecoder.decodeObject(forKey: "_CardType") as? String
         expireDate = aDecoder.decodeObject(forKey: "_ExpireDate") as? String

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if cardHolderName != nil{
			aCoder.encode(cardHolderName, forKey: "CardHolderName")
		}
		if cardCode != nil{
			aCoder.encode(cardCode, forKey: "_CardCode")
		}
		if cardNumber != nil{
			aCoder.encode(cardNumber, forKey: "_CardNumber")
		}
		if cardType != nil{
			aCoder.encode(cardType, forKey: "_CardType")
		}
		if expireDate != nil{
			aCoder.encode(expireDate, forKey: "_ExpireDate")
		}

	}

}