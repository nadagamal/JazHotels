//
//	MRRoomRate.swift
//
//	Create by Nada Gamal on 22/9/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class MRRoomRate : NSObject, NSCoding{

	var Rates : MRRate!
	var EffectiveDate : String!
	var ExpireDate : String!
	var NumberOfUnits : String!
	var RatePlanCode : String!
	var RoomTypeCode : String!
	var RoomRate : MRRoomRate!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		if let RatesData = dictionary["Rates"] as? [String:Any]{
			Rates = MRRate(fromDictionary: RatesData)
		}
		EffectiveDate = dictionary["_EffectiveDate"] as? String
		ExpireDate = dictionary["_ExpireDate"] as? String
		NumberOfUnits = dictionary["_NumberOfUnits"] as? String
		RatePlanCode = dictionary["_RatePlanCode"] as? String
		RoomTypeCode = dictionary["_RoomTypeCode"] as? String
		if let RoomRateData = dictionary["RoomRate"] as? [String:Any]{
			RoomRate = MRRoomRate(fromDictionary: RoomRateData)
		}
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if Rates != nil{
			dictionary["Rates"] = Rates.toDictionary()
		}
		if EffectiveDate != nil{
			dictionary["_EffectiveDate"] = EffectiveDate
		}
		if ExpireDate != nil{
			dictionary["_ExpireDate"] = ExpireDate
		}
		if NumberOfUnits != nil{
			dictionary["_NumberOfUnits"] = NumberOfUnits
		}
		if RatePlanCode != nil{
			dictionary["_RatePlanCode"] = RatePlanCode
		}
		if RoomTypeCode != nil{
			dictionary["_RoomTypeCode"] = RoomTypeCode
		}
		if RoomRate != nil{
			dictionary["RoomRate"] = RoomRate.toDictionary()
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         Rates = aDecoder.decodeObject(forKey: "Rates") as? MRRate
         EffectiveDate = aDecoder.decodeObject(forKey: "_EffectiveDate") as? String
         ExpireDate = aDecoder.decodeObject(forKey: "_ExpireDate") as? String
         NumberOfUnits = aDecoder.decodeObject(forKey: "_NumberOfUnits") as? String
         RatePlanCode = aDecoder.decodeObject(forKey: "_RatePlanCode") as? String
         RoomTypeCode = aDecoder.decodeObject(forKey: "_RoomTypeCode") as? String
         RoomRate = aDecoder.decodeObject(forKey: "RoomRate") as? MRRoomRate

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if Rates != nil{
			aCoder.encode(Rates, forKey: "Rates")
		}
		if EffectiveDate != nil{
			aCoder.encode(EffectiveDate, forKey: "_EffectiveDate")
		}
		if ExpireDate != nil{
			aCoder.encode(ExpireDate, forKey: "_ExpireDate")
		}
		if NumberOfUnits != nil{
			aCoder.encode(NumberOfUnits, forKey: "_NumberOfUnits")
		}
		if RatePlanCode != nil{
			aCoder.encode(RatePlanCode, forKey: "_RatePlanCode")
		}
		if RoomTypeCode != nil{
			aCoder.encode(RoomTypeCode, forKey: "_RoomTypeCode")
		}
		if RoomRate != nil{
			aCoder.encode(RoomRate, forKey: "RoomRate")
		}

	}

}