//
//	CBAmountPercent.swift
//
//	Create by Nada Gamal on 18/9/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class CBAmountPercent : NSObject, NSCoding{

	var amount : String!
	var currencyCode : String!
	var taxInclusive : Bool!
	var nmbrOfNights : String!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		amount = dictionary["_Amount"] as? String
		currencyCode = dictionary["_CurrencyCode"] as? String
		taxInclusive = dictionary["_TaxInclusive"] as? Bool
		nmbrOfNights = dictionary["_NmbrOfNights"] as? String
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if amount != nil{
			dictionary["_Amount"] = amount
		}
		if currencyCode != nil{
			dictionary["_CurrencyCode"] = currencyCode
		}
		if taxInclusive != nil{
			dictionary["_TaxInclusive"] = taxInclusive
		}
		if nmbrOfNights != nil{
			dictionary["_NmbrOfNights"] = nmbrOfNights
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         amount = aDecoder.decodeObject(forKey: "_Amount") as? String
         currencyCode = aDecoder.decodeObject(forKey: "_CurrencyCode") as? String
         taxInclusive = aDecoder.decodeObject(forKey: "_TaxInclusive") as? Bool
         nmbrOfNights = aDecoder.decodeObject(forKey: "_NmbrOfNights") as? String

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if amount != nil{
			aCoder.encode(amount, forKey: "_Amount")
		}
		if currencyCode != nil{
			aCoder.encode(currencyCode, forKey: "_CurrencyCode")
		}
		if taxInclusive != nil{
			aCoder.encode(taxInclusive, forKey: "_TaxInclusive")
		}
		if nmbrOfNights != nil{
			aCoder.encode(nmbrOfNights, forKey: "_NmbrOfNights")
		}

	}

}