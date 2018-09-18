//
//	CBTaxe.swift
//
//	Create by Nada Gamal on 18/9/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class CBTaxe : NSObject, NSCoding{

	var tax : [CBTax]!
	var amount : String!
	var taxx : CBTax!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		tax = [CBTax]()
		if let taxArray = dictionary["Tax"] as? [[String:Any]]{
			for dic in taxArray{
				let value = CBTax(fromDictionary: dic)
				tax.append(value)
			}
		}
		amount = dictionary["_Amount"] as? String
		if let taxData = dictionary["Tax"] as? [String:Any]{
			taxx = CBTax(fromDictionary: taxData)
		}
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if tax != nil{
			var dictionaryElements = [[String:Any]]()
			for taxElement in tax {
				dictionaryElements.append(taxElement.toDictionary())
			}
			dictionary["Tax"] = dictionaryElements
		}
		if amount != nil{
			dictionary["_Amount"] = amount
		}
		if taxx != nil{
			dictionary["Tax"] = taxx.toDictionary()
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         tax = aDecoder.decodeObject(forKey :"Tax") as? [CBTax]
         amount = aDecoder.decodeObject(forKey: "_Amount") as? String
         taxx = aDecoder.decodeObject(forKey: "Tax") as? CBTax

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if tax != nil{
			aCoder.encode(tax, forKey: "Tax")
		}
		if amount != nil{
			aCoder.encode(amount, forKey: "_Amount")
		}
		if taxx != nil{
			aCoder.encode(tax, forKey: "Tax")
		}

	}

}
