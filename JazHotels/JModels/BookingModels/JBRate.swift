//
//	JBRate.swift
//
//	Create by Nada Gamal on 9/9/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class JBRate : NSObject, NSCoding{

	var base : JBBase!
	var fees : JBFee!
	var taxes : JBTaxe!
	var total : JBTotal!
	var tpaExtensions : JBTpaExtension!
	var rate : JBRate!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		if let baseData = dictionary["Base"] as? [String:Any]{
			base = JBBase(fromDictionary: baseData)
		}
		if let feesData = dictionary["Fees"] as? [String:Any]{
			fees = JBFee(fromDictionary: feesData)
		}
		if let taxesData = dictionary["Taxes"] as? [String:Any]{
			taxes = JBTaxe(fromDictionary: taxesData)
		}
		if let totalData = dictionary["Total"] as? [String:Any]{
			total = JBTotal(fromDictionary: totalData)
		}
		if let tpaExtensionsData = dictionary["Tpa_Extensions"] as? [String:Any]{
			tpaExtensions = JBTpaExtension(fromDictionary: tpaExtensionsData)
		}
		if let rateData = dictionary["Rate"] as? [String:Any]{
			rate = JBRate(fromDictionary: rateData)
		}
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if base != nil{
			dictionary["Base"] = base.toDictionary()
		}
		if fees != nil{
			dictionary["Fees"] = fees.toDictionary()
		}
		if taxes != nil{
			dictionary["Taxes"] = taxes.toDictionary()
		}
		if total != nil{
			dictionary["Total"] = total.toDictionary()
		}
		if tpaExtensions != nil{
			dictionary["Tpa_Extensions"] = tpaExtensions.toDictionary()
		}
		if rate != nil{
			dictionary["Rate"] = rate.toDictionary()
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         base = aDecoder.decodeObject(forKey: "Base") as? JBBase
         fees = aDecoder.decodeObject(forKey: "Fees") as? JBFee
         taxes = aDecoder.decodeObject(forKey: "Taxes") as? JBTaxe
         total = aDecoder.decodeObject(forKey: "Total") as? JBTotal
         tpaExtensions = aDecoder.decodeObject(forKey: "Tpa_Extensions") as? JBTpaExtension
         rate = aDecoder.decodeObject(forKey: "Rate") as? JBRate

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if base != nil{
			aCoder.encode(base, forKey: "Base")
		}
		if fees != nil{
			aCoder.encode(fees, forKey: "Fees")
		}
		if taxes != nil{
			aCoder.encode(taxes, forKey: "Taxes")
		}
		if total != nil{
			aCoder.encode(total, forKey: "Total")
		}
		if tpaExtensions != nil{
			aCoder.encode(tpaExtensions, forKey: "Tpa_Extensions")
		}
		if rate != nil{
			aCoder.encode(rate, forKey: "Rate")
		}

	}

}