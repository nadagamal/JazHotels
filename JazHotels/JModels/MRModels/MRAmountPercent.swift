//
//	MRAmountPercent.swift
//
//	Create by Nada Gamal on 22/9/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class MRAmountPercent : NSObject, NSCoding{

	var Amount : String!
	var CurrencyCode : String!
	var TaxInclusive : Bool!
	var NmbrOfNights : String!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		Amount = dictionary["_Amount"] as? String
		CurrencyCode = dictionary["_CurrencyCode"] as? String
		TaxInclusive = dictionary["_TaxInclusive"] as? Bool
		NmbrOfNights = dictionary["_NmbrOfNights"] as? String
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if Amount != nil{
			dictionary["_Amount"] = Amount
		}
		if CurrencyCode != nil{
			dictionary["_CurrencyCode"] = CurrencyCode
		}
		if TaxInclusive != nil{
			dictionary["_TaxInclusive"] = TaxInclusive
		}
		if NmbrOfNights != nil{
			dictionary["_NmbrOfNights"] = NmbrOfNights
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         Amount = aDecoder.decodeObject(forKey: "_Amount") as? String
         CurrencyCode = aDecoder.decodeObject(forKey: "_CurrencyCode") as? String
         TaxInclusive = aDecoder.decodeObject(forKey: "_TaxInclusive") as? Bool
         NmbrOfNights = aDecoder.decodeObject(forKey: "_NmbrOfNights") as? String

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if Amount != nil{
			aCoder.encode(Amount, forKey: "_Amount")
		}
		if CurrencyCode != nil{
			aCoder.encode(CurrencyCode, forKey: "_CurrencyCode")
		}
		if TaxInclusive != nil{
			aCoder.encode(TaxInclusive, forKey: "_TaxInclusive")
		}
		if NmbrOfNights != nil{
			aCoder.encode(NmbrOfNights, forKey: "_NmbrOfNights")
		}

	}

}