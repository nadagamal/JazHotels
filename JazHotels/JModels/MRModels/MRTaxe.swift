//
//	MRTaxe.swift
//
//	Create by Nada Gamal on 22/9/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class MRTaxe : NSObject, NSCoding{

	var Tax : MRTax!
	var Taxx : [MRTax]!
	var Amount : String!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		if let TaxData = dictionary["Tax"] as? [String:Any]{
			Tax = MRTax(fromDictionary: TaxData)
		}
		Taxx = [MRTax]()
		if let TaxArray = dictionary["Tax"] as? [[String:Any]]{
			for dic in TaxArray{
				let value = MRTax(fromDictionary: dic)
				Taxx.append(value)
			}
		}
		Amount = dictionary["_Amount"] as? String
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if Tax != nil{
			dictionary["Tax"] = Tax.toDictionary()
		}
		if Taxx != nil{
			var dictionaryElements = [[String:Any]]()
			for TaxElement in Taxx {
				dictionaryElements.append(TaxElement.toDictionary())
			}
			dictionary["Tax"] = dictionaryElements
		}
		if Amount != nil{
			dictionary["_Amount"] = Amount
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         Tax = aDecoder.decodeObject(forKey: "Tax") as? MRTax
         Taxx = aDecoder.decodeObject(forKey :"Tax") as? [MRTax]
         Amount = aDecoder.decodeObject(forKey: "_Amount") as? String

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if Tax != nil{
			aCoder.encode(Tax, forKey: "Tax")
		}
		if Taxx != nil{
			aCoder.encode(Taxx, forKey: "Tax")
		}
		if Amount != nil{
			aCoder.encode(Amount, forKey: "_Amount")
		}

	}

}
