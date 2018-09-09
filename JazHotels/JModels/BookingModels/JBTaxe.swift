//
//	JBTaxe.swift
//
//	Create by Nada Gamal on 9/9/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class JBTaxe : NSObject, NSCoding{

	var amount : String!
	var tax : [JBTax]!
	var taxItem : JBTax!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		amount = dictionary["Amount"] as? String
		tax = [JBTax]()
		if let taxArray = dictionary["Tax"] as? [[String:Any]]{
			for dic in taxArray{
				let value = JBTax(fromDictionary: dic)
				tax.append(value)
			}
		}
		if let taxData = dictionary["Tax"] as? [String:Any]{
			taxItem = JBTax(fromDictionary: taxData)
		}
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
		if tax != nil{
			var dictionaryElements = [[String:Any]]()
			for taxElement in tax {
				dictionaryElements.append(taxElement.toDictionary())
			}
			dictionary["Tax"] = dictionaryElements
		}
		if tax != nil{
			dictionary["Tax"] = taxItem.toDictionary()
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
         tax = aDecoder.decodeObject(forKey :"Tax") as? [JBTax]
         taxItem = aDecoder.decodeObject(forKey: "Tax") as? JBTax

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
		if tax != nil{
			aCoder.encode(tax, forKey: "Tax")
		}
		if taxItem != nil{
			aCoder.encode(taxItem, forKey: "Tax")
		}

	}

}
