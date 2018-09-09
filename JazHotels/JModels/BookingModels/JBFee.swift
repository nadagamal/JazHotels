//
//	JBFee.swift
//
//	Create by Nada Gamal on 9/9/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class JBFee : NSObject, NSCoding{

	var amount : String!
	var currencyCode : String!
	var fee : JBFee!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		amount = dictionary["Amount"] as? String
		currencyCode = dictionary["CurrencyCode"] as? String
		if let feeData = dictionary["Fee"] as? [String:Any]{
			fee = JBFee(fromDictionary: feeData)
		}
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if amount != nil{
			dictionary["Amount"] = amount
		}
		if currencyCode != nil{
			dictionary["CurrencyCode"] = currencyCode
		}
		if fee != nil{
			dictionary["Fee"] = fee.toDictionary()
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         amount = aDecoder.decodeObject(forKey: "Amount") as? String
         currencyCode = aDecoder.decodeObject(forKey: "CurrencyCode") as? String
         fee = aDecoder.decodeObject(forKey: "Fee") as? JBFee

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if amount != nil{
			aCoder.encode(amount, forKey: "Amount")
		}
		if currencyCode != nil{
			aCoder.encode(currencyCode, forKey: "CurrencyCode")
		}
		if fee != nil{
			aCoder.encode(fee, forKey: "Fee")
		}

	}

}