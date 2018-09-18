//
//	CBRoomRate.swift
//
//	Create by Nada Gamal on 18/9/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class CBRoomRate : NSObject, NSCoding{

	var rates : CBRate!
	var effectiveDate : String!
	var expireDate : String!
	var numberOfUnits : String!
	var ratePlanCode : String!
	var roomTypeCode : String!
	var roomRate : CBRoomRate!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		if let ratesData = dictionary["Rates"] as? [String:Any]{
			rates = CBRate(fromDictionary: ratesData)
		}
		effectiveDate = dictionary["_EffectiveDate"] as? String
		expireDate = dictionary["_ExpireDate"] as? String
		numberOfUnits = dictionary["_NumberOfUnits"] as? String
		ratePlanCode = dictionary["_RatePlanCode"] as? String
		roomTypeCode = dictionary["_RoomTypeCode"] as? String
		if let roomRateData = dictionary["RoomRate"] as? [String:Any]{
			roomRate = CBRoomRate(fromDictionary: roomRateData)
		}
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if rates != nil{
			dictionary["Rates"] = rates.toDictionary()
		}
		if effectiveDate != nil{
			dictionary["_EffectiveDate"] = effectiveDate
		}
		if expireDate != nil{
			dictionary["_ExpireDate"] = expireDate
		}
		if numberOfUnits != nil{
			dictionary["_NumberOfUnits"] = numberOfUnits
		}
		if ratePlanCode != nil{
			dictionary["_RatePlanCode"] = ratePlanCode
		}
		if roomTypeCode != nil{
			dictionary["_RoomTypeCode"] = roomTypeCode
		}
		if roomRate != nil{
			dictionary["RoomRate"] = roomRate.toDictionary()
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         rates = aDecoder.decodeObject(forKey: "Rates") as? CBRate
         effectiveDate = aDecoder.decodeObject(forKey: "_EffectiveDate") as? String
         expireDate = aDecoder.decodeObject(forKey: "_ExpireDate") as? String
         numberOfUnits = aDecoder.decodeObject(forKey: "_NumberOfUnits") as? String
         ratePlanCode = aDecoder.decodeObject(forKey: "_RatePlanCode") as? String
         roomTypeCode = aDecoder.decodeObject(forKey: "_RoomTypeCode") as? String
         roomRate = aDecoder.decodeObject(forKey: "RoomRate") as? CBRoomRate

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if rates != nil{
			aCoder.encode(rates, forKey: "Rates")
		}
		if effectiveDate != nil{
			aCoder.encode(effectiveDate, forKey: "_EffectiveDate")
		}
		if expireDate != nil{
			aCoder.encode(expireDate, forKey: "_ExpireDate")
		}
		if numberOfUnits != nil{
			aCoder.encode(numberOfUnits, forKey: "_NumberOfUnits")
		}
		if ratePlanCode != nil{
			aCoder.encode(ratePlanCode, forKey: "_RatePlanCode")
		}
		if roomTypeCode != nil{
			aCoder.encode(roomTypeCode, forKey: "_RoomTypeCode")
		}
		if roomRate != nil{
			aCoder.encode(roomRate, forKey: "RoomRate")
		}

	}

}