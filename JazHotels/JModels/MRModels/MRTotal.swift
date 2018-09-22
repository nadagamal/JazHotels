//
//	MRTotal.swift
//
//	Create by Nada Gamal on 22/9/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class MRTotal : NSObject, NSCoding{

	var AmountAfterTax : String!
	var AmountBeforeTax : String!
	var CurrencyCode : String!
	var Taxes : MRTaxe!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		AmountAfterTax = dictionary["_AmountAfterTax"] as? String
		AmountBeforeTax = dictionary["_AmountBeforeTax"] as? String
		CurrencyCode = dictionary["_CurrencyCode"] as? String
		if let TaxesData = dictionary["Taxes"] as? [String:Any]{
			Taxes = MRTaxe(fromDictionary: TaxesData)
		}
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if AmountAfterTax != nil{
			dictionary["_AmountAfterTax"] = AmountAfterTax
		}
		if AmountBeforeTax != nil{
			dictionary["_AmountBeforeTax"] = AmountBeforeTax
		}
		if CurrencyCode != nil{
			dictionary["_CurrencyCode"] = CurrencyCode
		}
		if Taxes != nil{
			dictionary["Taxes"] = Taxes.toDictionary()
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         AmountAfterTax = aDecoder.decodeObject(forKey: "_AmountAfterTax") as? String
         AmountBeforeTax = aDecoder.decodeObject(forKey: "_AmountBeforeTax") as? String
         CurrencyCode = aDecoder.decodeObject(forKey: "_CurrencyCode") as? String
         Taxes = aDecoder.decodeObject(forKey: "Taxes") as? MRTaxe

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if AmountAfterTax != nil{
			aCoder.encode(AmountAfterTax, forKey: "_AmountAfterTax")
		}
		if AmountBeforeTax != nil{
			aCoder.encode(AmountBeforeTax, forKey: "_AmountBeforeTax")
		}
		if CurrencyCode != nil{
			aCoder.encode(CurrencyCode, forKey: "_CurrencyCode")
		}
		if Taxes != nil{
			aCoder.encode(Taxes, forKey: "Taxes")
		}

	}

}