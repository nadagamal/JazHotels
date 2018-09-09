//
//	JBTax.swift
//
//	Create by Nada Gamal on 9/9/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class JBTax : NSObject, NSCoding{

	var amount : String!
	var chargeFrequency : String!
	var code : String!
	var effectiveDate : String!
	var expireDate : String!
	var taxDescription : [JBTaxDescription]!
	var currencyCode : String!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		amount = dictionary["Amount"] as? String
		chargeFrequency = dictionary["ChargeFrequency"] as? String
		code = dictionary["Code"] as? String
		effectiveDate = dictionary["EffectiveDate"] as? String
		expireDate = dictionary["ExpireDate"] as? String
		taxDescription = [JBTaxDescription]()
		if let taxDescriptionArray = dictionary["TaxDescription"] as? [[String:Any]]{
			for dic in taxDescriptionArray{
				let value = JBTaxDescription(fromDictionary: dic)
				taxDescription.append(value)
			}
		}
		currencyCode = dictionary["CurrencyCode"] as? String
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
		if chargeFrequency != nil{
			dictionary["ChargeFrequency"] = chargeFrequency
		}
		if code != nil{
			dictionary["Code"] = code
		}
		if effectiveDate != nil{
			dictionary["EffectiveDate"] = effectiveDate
		}
		if expireDate != nil{
			dictionary["ExpireDate"] = expireDate
		}
		if taxDescription != nil{
			var dictionaryElements = [[String:Any]]()
			for taxDescriptionElement in taxDescription {
				dictionaryElements.append(taxDescriptionElement.toDictionary())
			}
			dictionary["TaxDescription"] = dictionaryElements
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
         amount = aDecoder.decodeObject(forKey: "Amount") as? String
         chargeFrequency = aDecoder.decodeObject(forKey: "ChargeFrequency") as? String
         code = aDecoder.decodeObject(forKey: "Code") as? String
         effectiveDate = aDecoder.decodeObject(forKey: "EffectiveDate") as? String
         expireDate = aDecoder.decodeObject(forKey: "ExpireDate") as? String
         taxDescription = aDecoder.decodeObject(forKey :"TaxDescription") as? [JBTaxDescription]
         currencyCode = aDecoder.decodeObject(forKey: "CurrencyCode") as? String

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
		if chargeFrequency != nil{
			aCoder.encode(chargeFrequency, forKey: "ChargeFrequency")
		}
		if code != nil{
			aCoder.encode(code, forKey: "Code")
		}
		if effectiveDate != nil{
			aCoder.encode(effectiveDate, forKey: "EffectiveDate")
		}
		if expireDate != nil{
			aCoder.encode(expireDate, forKey: "ExpireDate")
		}
		if taxDescription != nil{
			aCoder.encode(taxDescription, forKey: "TaxDescription")
		}
		if currencyCode != nil{
			aCoder.encode(currencyCode, forKey: "CurrencyCode")
		}

	}

}