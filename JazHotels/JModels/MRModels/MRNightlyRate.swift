//
//	MRNightlyRate.swift
//
//	Create by Nada Gamal on 22/9/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class MRNightlyRate : NSObject, NSCoding{

	var Date : String!
	var Fee : String!
	var Price : String!
	var PriceWithTaxAndFee : String!
	var Tax : String!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		Date = dictionary["_Date"] as? String
		Fee = dictionary["_Fee"] as? String
		Price = dictionary["_Price"] as? String
		PriceWithTaxAndFee = dictionary["_PriceWithTaxAndFee"] as? String
		Tax = dictionary["_Tax"] as? String
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if Date != nil{
			dictionary["_Date"] = Date
		}
		if Fee != nil{
			dictionary["_Fee"] = Fee
		}
		if Price != nil{
			dictionary["_Price"] = Price
		}
		if PriceWithTaxAndFee != nil{
			dictionary["_PriceWithTaxAndFee"] = PriceWithTaxAndFee
		}
		if Tax != nil{
			dictionary["_Tax"] = Tax
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         Date = aDecoder.decodeObject(forKey: "_Date") as? String
         Fee = aDecoder.decodeObject(forKey: "_Fee") as? String
         Price = aDecoder.decodeObject(forKey: "_Price") as? String
         PriceWithTaxAndFee = aDecoder.decodeObject(forKey: "_PriceWithTaxAndFee") as? String
         Tax = aDecoder.decodeObject(forKey: "_Tax") as? String

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if Date != nil{
			aCoder.encode(Date, forKey: "_Date")
		}
		if Fee != nil{
			aCoder.encode(Fee, forKey: "_Fee")
		}
		if Price != nil{
			aCoder.encode(Price, forKey: "_Price")
		}
		if PriceWithTaxAndFee != nil{
			aCoder.encode(PriceWithTaxAndFee, forKey: "_PriceWithTaxAndFee")
		}
		if Tax != nil{
			aCoder.encode(Tax, forKey: "_Tax")
		}

	}

}