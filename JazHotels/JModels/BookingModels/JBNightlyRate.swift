//
//	JBNightlyRate.swift
//
//	Create by Nada Gamal on 9/9/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class JBNightlyRate : NSObject, NSCoding{

	var date : String!
	var fee : String!
	var price : String!
	var priceWithTaxAndFee : String!
	var tax : String!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		date = dictionary["Date"] as? String
		fee = dictionary["Fee"] as? String
		price = dictionary["Price"] as? String
		priceWithTaxAndFee = dictionary["PriceWithTaxAndFee"] as? String
		tax = dictionary["Tax"] as? String
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if date != nil{
			dictionary["Date"] = date
		}
		if fee != nil{
			dictionary["Fee"] = fee
		}
		if price != nil{
			dictionary["Price"] = price
		}
		if priceWithTaxAndFee != nil{
			dictionary["PriceWithTaxAndFee"] = priceWithTaxAndFee
		}
		if tax != nil{
			dictionary["Tax"] = tax
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         date = aDecoder.decodeObject(forKey: "Date") as? String
         fee = aDecoder.decodeObject(forKey: "Fee") as? String
         price = aDecoder.decodeObject(forKey: "Price") as? String
         priceWithTaxAndFee = aDecoder.decodeObject(forKey: "PriceWithTaxAndFee") as? String
         tax = aDecoder.decodeObject(forKey: "Tax") as? String

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if date != nil{
			aCoder.encode(date, forKey: "Date")
		}
		if fee != nil{
			aCoder.encode(fee, forKey: "Fee")
		}
		if price != nil{
			aCoder.encode(price, forKey: "Price")
		}
		if priceWithTaxAndFee != nil{
			aCoder.encode(priceWithTaxAndFee, forKey: "PriceWithTaxAndFee")
		}
		if tax != nil{
			aCoder.encode(tax, forKey: "Tax")
		}

	}

}