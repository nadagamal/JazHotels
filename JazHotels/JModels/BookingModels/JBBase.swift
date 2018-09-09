//
//	JBBase.swift
//
//	Create by Nada Gamal on 9/9/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class JBBase : NSObject, NSCoding{

	var amountAfterTax : String!
	var amountBeforeTax : String!
	var currencyCode : String!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		amountAfterTax = dictionary["AmountAfterTax"] as? String
		amountBeforeTax = dictionary["AmountBeforeTax"] as? String
		currencyCode = dictionary["CurrencyCode"] as? String
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if amountAfterTax != nil{
			dictionary["AmountAfterTax"] = amountAfterTax
		}
		if amountBeforeTax != nil{
			dictionary["AmountBeforeTax"] = amountBeforeTax
		}
		if currencyCode != nil{
			dictionary["CurrencyCode"] = currencyCode
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         amountAfterTax = aDecoder.decodeObject(forKey: "AmountAfterTax") as? String
         amountBeforeTax = aDecoder.decodeObject(forKey: "AmountBeforeTax") as? String
         currencyCode = aDecoder.decodeObject(forKey: "CurrencyCode") as? String

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if amountAfterTax != nil{
			aCoder.encode(amountAfterTax, forKey: "AmountAfterTax")
		}
		if amountBeforeTax != nil{
			aCoder.encode(amountBeforeTax, forKey: "AmountBeforeTax")
		}
		if currencyCode != nil{
			aCoder.encode(currencyCode, forKey: "CurrencyCode")
		}

	}

}