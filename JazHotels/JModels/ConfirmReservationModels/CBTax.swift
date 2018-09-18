//
//	CBTax.swift
//
//	Create by Nada Gamal on 18/9/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class CBTax : NSObject, NSCoding{

	var taxDescription : [CBTaxDescription]!
	var amount : String!
	var chargeFrequency : String!
	var code : String!
	var effectiveDate : String!
	var expireDate : String!
	var currencyCode : String!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		taxDescription = [CBTaxDescription]()
		if let taxDescriptionArray = dictionary["TaxDescription"] as? [[String:Any]]{
			for dic in taxDescriptionArray{
				let value = CBTaxDescription(fromDictionary: dic)
				taxDescription.append(value)
			}
		}
		amount = dictionary["_Amount"] as? String
		chargeFrequency = dictionary["_ChargeFrequency"] as? String
		code = dictionary["_Code"] as? String
		effectiveDate = dictionary["_EffectiveDate"] as? String
		expireDate = dictionary["_ExpireDate"] as? String
		currencyCode = dictionary["_CurrencyCode"] as? String
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if taxDescription != nil{
			var dictionaryElements = [[String:Any]]()
			for taxDescriptionElement in taxDescription {
				dictionaryElements.append(taxDescriptionElement.toDictionary())
			}
			dictionary["TaxDescription"] = dictionaryElements
		}
		if amount != nil{
			dictionary["_Amount"] = amount
		}
		if chargeFrequency != nil{
			dictionary["_ChargeFrequency"] = chargeFrequency
		}
		if code != nil{
			dictionary["_Code"] = code
		}
		if effectiveDate != nil{
			dictionary["_EffectiveDate"] = effectiveDate
		}
		if expireDate != nil{
			dictionary["_ExpireDate"] = expireDate
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
         taxDescription = aDecoder.decodeObject(forKey :"TaxDescription") as? [CBTaxDescription]
         amount = aDecoder.decodeObject(forKey: "_Amount") as? String
         chargeFrequency = aDecoder.decodeObject(forKey: "_ChargeFrequency") as? String
         code = aDecoder.decodeObject(forKey: "_Code") as? String
         effectiveDate = aDecoder.decodeObject(forKey: "_EffectiveDate") as? String
         expireDate = aDecoder.decodeObject(forKey: "_ExpireDate") as? String
         currencyCode = aDecoder.decodeObject(forKey: "_CurrencyCode") as? String

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if taxDescription != nil{
			aCoder.encode(taxDescription, forKey: "TaxDescription")
		}
		if amount != nil{
			aCoder.encode(amount, forKey: "_Amount")
		}
		if chargeFrequency != nil{
			aCoder.encode(chargeFrequency, forKey: "_ChargeFrequency")
		}
		if code != nil{
			aCoder.encode(code, forKey: "_Code")
		}
		if effectiveDate != nil{
			aCoder.encode(effectiveDate, forKey: "_EffectiveDate")
		}
		if expireDate != nil{
			aCoder.encode(expireDate, forKey: "_ExpireDate")
		}
		if currencyCode != nil{
			aCoder.encode(currencyCode, forKey: "_CurrencyCode")
		}

	}

}