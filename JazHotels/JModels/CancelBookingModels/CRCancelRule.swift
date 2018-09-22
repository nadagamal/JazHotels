//
//	CRCancelRule.swift
//
//	Create by Nada Gamal on 22/9/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class CRCancelRule : NSObject, NSCoding{

	var Amount : String!
	var CurrencyCode : String!
	var CancelRule : CRCancelRule!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		Amount = dictionary["_Amount"] as? String
		CurrencyCode = dictionary["_CurrencyCode"] as? String
		if let CancelRuleData = dictionary["CancelRule"] as? [String:Any]{
			CancelRule = CRCancelRule(fromDictionary: CancelRuleData)
		}
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
		if CancelRule != nil{
			dictionary["CancelRule"] = CancelRule.toDictionary()
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
         CancelRule = aDecoder.decodeObject(forKey: "CancelRule") as? CRCancelRule

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
		if CancelRule != nil{
			aCoder.encode(CancelRule, forKey: "CancelRule")
		}

	}

}