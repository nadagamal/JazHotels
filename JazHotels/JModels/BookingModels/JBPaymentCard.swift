//
//	JBPaymentCard.swift
//
//	Create by Nada Gamal on 9/9/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class JBPaymentCard : NSObject, NSCoding{

	var cardCode : String!
	var cardHolderName : String!
	var cardNumber : String!
	var cardType : String!
	var expireDate : String!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		cardCode = dictionary["CardCode"] as? String
		cardHolderName = dictionary["CardHolderName"] as? String
		cardNumber = dictionary["CardNumber"] as? String
		cardType = dictionary["CardType"] as? String
		expireDate = dictionary["ExpireDate"] as? String
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if cardCode != nil{
			dictionary["CardCode"] = cardCode
		}
		if cardHolderName != nil{
			dictionary["CardHolderName"] = cardHolderName
		}
		if cardNumber != nil{
			dictionary["CardNumber"] = cardNumber
		}
		if cardType != nil{
			dictionary["CardType"] = cardType
		}
		if expireDate != nil{
			dictionary["ExpireDate"] = expireDate
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         cardCode = aDecoder.decodeObject(forKey: "CardCode") as? String
         cardHolderName = aDecoder.decodeObject(forKey: "CardHolderName") as? String
         cardNumber = aDecoder.decodeObject(forKey: "CardNumber") as? String
         cardType = aDecoder.decodeObject(forKey: "CardType") as? String
         expireDate = aDecoder.decodeObject(forKey: "ExpireDate") as? String

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if cardCode != nil{
			aCoder.encode(cardCode, forKey: "CardCode")
		}
		if cardHolderName != nil{
			aCoder.encode(cardHolderName, forKey: "CardHolderName")
		}
		if cardNumber != nil{
			aCoder.encode(cardNumber, forKey: "CardNumber")
		}
		if cardType != nil{
			aCoder.encode(cardType, forKey: "CardType")
		}
		if expireDate != nil{
			aCoder.encode(expireDate, forKey: "ExpireDate")
		}

	}

}