//
//	MRRate.swift
//
//	Create by Nada Gamal on 22/9/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class MRRate : NSObject, NSCoding{

	var Base : MRTotal!
	var Fees : MRFee!
	var Taxes : MRTaxe!
	var Total : MRTotal!
	var TpaExtensions : MRTPAExtension!
	var Rate : MRRate!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		if let BaseData = dictionary["Base"] as? [String:Any]{
			Base = MRTotal(fromDictionary: BaseData)
		}
		if let FeesData = dictionary["Fees"] as? [String:Any]{
			Fees = MRFee(fromDictionary: FeesData)
		}
		if let TaxesData = dictionary["Taxes"] as? [String:Any]{
			Taxes = MRTaxe(fromDictionary: TaxesData)
		}
		if let TotalData = dictionary["Total"] as? [String:Any]{
			Total = MRTotal(fromDictionary: TotalData)
		}
		if let TpaExtensionsData = dictionary["Tpa_Extensions"] as? [String:Any]{
			TpaExtensions = MRTPAExtension(fromDictionary: TpaExtensionsData)
		}
		if let RateData = dictionary["Rate"] as? [String:Any]{
			Rate = MRRate(fromDictionary: RateData)
		}
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if Base != nil{
			dictionary["Base"] = Base.toDictionary()
		}
		if Fees != nil{
			dictionary["Fees"] = Fees.toDictionary()
		}
		if Taxes != nil{
			dictionary["Taxes"] = Taxes.toDictionary()
		}
		if Total != nil{
			dictionary["Total"] = Total.toDictionary()
		}
		if TpaExtensions != nil{
			dictionary["Tpa_Extensions"] = TpaExtensions.toDictionary()
		}
		if Rate != nil{
			dictionary["Rate"] = Rate.toDictionary()
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         Base = aDecoder.decodeObject(forKey: "Base") as? MRTotal
         Fees = aDecoder.decodeObject(forKey: "Fees") as? MRFee
         Taxes = aDecoder.decodeObject(forKey: "Taxes") as? MRTaxe
         Total = aDecoder.decodeObject(forKey: "Total") as? MRTotal
         TpaExtensions = aDecoder.decodeObject(forKey: "Tpa_Extensions") as? MRTPAExtension
         Rate = aDecoder.decodeObject(forKey: "Rate") as? MRRate

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if Base != nil{
			aCoder.encode(Base, forKey: "Base")
		}
		if Fees != nil{
			aCoder.encode(Fees, forKey: "Fees")
		}
		if Taxes != nil{
			aCoder.encode(Taxes, forKey: "Taxes")
		}
		if Total != nil{
			aCoder.encode(Total, forKey: "Total")
		}
		if TpaExtensions != nil{
			aCoder.encode(TpaExtensions, forKey: "Tpa_Extensions")
		}
		if Rate != nil{
			aCoder.encode(Rate, forKey: "Rate")
		}

	}

}
