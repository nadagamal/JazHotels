//
//	CBTotal.swift
//
//	Create by Nada Gamal on 18/9/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class CBTotal : NSObject, NSCoding{

	var taxes : CBTaxe!
	var amountAfterTax : String!
	var amountBeforeTax : String!
	var currencyCode : String!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		if let taxesData = dictionary["Taxes"] as? [String:Any]{
			taxes = CBTaxe(fromDictionary: taxesData)
		}
		amountAfterTax = dictionary["_AmountAfterTax"] as? String
		amountBeforeTax = dictionary["_AmountBeforeTax"] as? String
		currencyCode = dictionary["_CurrencyCode"] as? String
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if taxes != nil{
			dictionary["Taxes"] = taxes.toDictionary()
		}
		if amountAfterTax != nil{
			dictionary["_AmountAfterTax"] = amountAfterTax
		}
		if amountBeforeTax != nil{
			dictionary["_AmountBeforeTax"] = amountBeforeTax
		}
		if currencyCode != nil{
			dictionary["_CurrencyCode"] = currencyCode
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         taxes = aDecoder.decodeObject(forKey: "Taxes") as? CBTaxe
         amountAfterTax = aDecoder.decodeObject(forKey: "_AmountAfterTax") as? String
         amountBeforeTax = aDecoder.decodeObject(forKey: "_AmountBeforeTax") as? String
         currencyCode = aDecoder.decodeObject(forKey: "_CurrencyCode") as? String

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if taxes != nil{
			aCoder.encode(taxes, forKey: "Taxes")
		}
		if amountAfterTax != nil{
			aCoder.encode(amountAfterTax, forKey: "_AmountAfterTax")
		}
		if amountBeforeTax != nil{
			aCoder.encode(amountBeforeTax, forKey: "_AmountBeforeTax")
		}
		if currencyCode != nil{
			aCoder.encode(currencyCode, forKey: "_CurrencyCode")
		}

	}

}