//
//	MRTax.swift
//
//	Create by Nada Gamal on 22/9/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class MRTax : NSObject, NSCoding{

	var Amount : String!
	var CurrencyCode : String!
	var TaxDescription : [MRTaxDescription]!
	var ChargeFrequency : String!
	var Code : String!
	var EffectiveDate : String!
	var ExpireDate : String!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		Amount = dictionary["_Amount"] as? String
		CurrencyCode = dictionary["_CurrencyCode"] as? String
		TaxDescription = [MRTaxDescription]()
		if let TaxDescriptionArray = dictionary["TaxDescription"] as? [[String:Any]]{
			for dic in TaxDescriptionArray{
				let value = MRTaxDescription(fromDictionary: dic)
				TaxDescription.append(value)
			}
		}
		ChargeFrequency = dictionary["_ChargeFrequency"] as? String
		Code = dictionary["_Code"] as? String
		EffectiveDate = dictionary["_EffectiveDate"] as? String
		ExpireDate = dictionary["_ExpireDate"] as? String
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
		if TaxDescription != nil{
			var dictionaryElements = [[String:Any]]()
			for TaxDescriptionElement in TaxDescription {
				dictionaryElements.append(TaxDescriptionElement.toDictionary())
			}
			dictionary["TaxDescription"] = dictionaryElements
		}
		if ChargeFrequency != nil{
			dictionary["_ChargeFrequency"] = ChargeFrequency
		}
		if Code != nil{
			dictionary["_Code"] = Code
		}
		if EffectiveDate != nil{
			dictionary["_EffectiveDate"] = EffectiveDate
		}
		if ExpireDate != nil{
			dictionary["_ExpireDate"] = ExpireDate
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
         TaxDescription = aDecoder.decodeObject(forKey :"TaxDescription") as? [MRTaxDescription]
         ChargeFrequency = aDecoder.decodeObject(forKey: "_ChargeFrequency") as? String
         Code = aDecoder.decodeObject(forKey: "_Code") as? String
         EffectiveDate = aDecoder.decodeObject(forKey: "_EffectiveDate") as? String
         ExpireDate = aDecoder.decodeObject(forKey: "_ExpireDate") as? String

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
		if TaxDescription != nil{
			aCoder.encode(TaxDescription, forKey: "TaxDescription")
		}
		if ChargeFrequency != nil{
			aCoder.encode(ChargeFrequency, forKey: "_ChargeFrequency")
		}
		if Code != nil{
			aCoder.encode(Code, forKey: "_Code")
		}
		if EffectiveDate != nil{
			aCoder.encode(EffectiveDate, forKey: "_EffectiveDate")
		}
		if ExpireDate != nil{
			aCoder.encode(ExpireDate, forKey: "_ExpireDate")
		}

	}

}