//
//	CBNightlyRate.swift
//
//	Create by Nada Gamal on 18/9/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class CBNightlyRate : NSObject, NSCoding{

	var date : String!
	var fee : String!
	var price : String!
	var priceWithTaxAndFee : String!
	var tax : String!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		date = dictionary["_Date"] as? String
		fee = dictionary["_Fee"] as? String
		price = dictionary["_Price"] as? String
		priceWithTaxAndFee = dictionary["_PriceWithTaxAndFee"] as? String
		tax = dictionary["_Tax"] as? String
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if date != nil{
			dictionary["_Date"] = date
		}
		if fee != nil{
			dictionary["_Fee"] = fee
		}
		if price != nil{
			dictionary["_Price"] = price
		}
		if priceWithTaxAndFee != nil{
			dictionary["_PriceWithTaxAndFee"] = priceWithTaxAndFee
		}
		if tax != nil{
			dictionary["_Tax"] = tax
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         date = aDecoder.decodeObject(forKey: "_Date") as? String
         fee = aDecoder.decodeObject(forKey: "_Fee") as? String
         price = aDecoder.decodeObject(forKey: "_Price") as? String
         priceWithTaxAndFee = aDecoder.decodeObject(forKey: "_PriceWithTaxAndFee") as? String
         tax = aDecoder.decodeObject(forKey: "_Tax") as? String

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if date != nil{
			aCoder.encode(date, forKey: "_Date")
		}
		if fee != nil{
			aCoder.encode(fee, forKey: "_Fee")
		}
		if price != nil{
			aCoder.encode(price, forKey: "_Price")
		}
		if priceWithTaxAndFee != nil{
			aCoder.encode(priceWithTaxAndFee, forKey: "_PriceWithTaxAndFee")
		}
		if tax != nil{
			aCoder.encode(tax, forKey: "_Tax")
		}

	}

}