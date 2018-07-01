//
//	JTransportation.swift
//
//	Create by Nada Gamal on 1/7/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class JTransportation : NSObject, NSCoding{

	var amount : String!
	var chargeUnit : String!
	var codeDetail : String!
	var transportationCode : String!
	var transportation : JTransportation!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		amount = dictionary["_Amount"] as? String
		chargeUnit = dictionary["_ChargeUnit"] as? String
		codeDetail = dictionary["_CodeDetail"] as? String
		transportationCode = dictionary["_TransportationCode"] as? String
		if let transportationData = dictionary["Transportation"] as? [String:Any]{
			transportation = JTransportation(fromDictionary: transportationData)
		}
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if amount != nil{
			dictionary["_Amount"] = amount
		}
		if chargeUnit != nil{
			dictionary["_ChargeUnit"] = chargeUnit
		}
		if codeDetail != nil{
			dictionary["_CodeDetail"] = codeDetail
		}
		if transportationCode != nil{
			dictionary["_TransportationCode"] = transportationCode
		}
		if transportation != nil{
			dictionary["Transportation"] = transportation.toDictionary()
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         amount = aDecoder.decodeObject(forKey: "_Amount") as? String
         chargeUnit = aDecoder.decodeObject(forKey: "_ChargeUnit") as? String
         codeDetail = aDecoder.decodeObject(forKey: "_CodeDetail") as? String
         transportationCode = aDecoder.decodeObject(forKey: "_TransportationCode") as? String
         transportation = aDecoder.decodeObject(forKey: "Transportation") as? JTransportation

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if amount != nil{
			aCoder.encode(amount, forKey: "_Amount")
		}
		if chargeUnit != nil{
			aCoder.encode(chargeUnit, forKey: "_ChargeUnit")
		}
		if codeDetail != nil{
			aCoder.encode(codeDetail, forKey: "_CodeDetail")
		}
		if transportationCode != nil{
			aCoder.encode(transportationCode, forKey: "_TransportationCode")
		}
		if transportation != nil{
			aCoder.encode(transportation, forKey: "Transportation")
		}

	}

}