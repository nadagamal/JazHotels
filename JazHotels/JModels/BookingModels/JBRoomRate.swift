//
//	JBRoomRate.swift
//
//	Create by Nada Gamal on 9/9/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class JBRoomRate : NSObject, NSCoding{

	var effectiveDate : String!
	var expireDate : String!
	var numberOfUnits : String!
	var ratePlanCode : String!
	var rates : JBRate!
	var roomTypeCode : String!
	var roomRate : JBRoomRate!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		effectiveDate = dictionary["EffectiveDate"] as? String
		expireDate = dictionary["ExpireDate"] as? String
		numberOfUnits = dictionary["NumberOfUnits"] as? String
		ratePlanCode = dictionary["RatePlanCode"] as? String
		if let ratesData = dictionary["Rates"] as? [String:Any]{
			rates = JBRate(fromDictionary: ratesData)
		}
		roomTypeCode = dictionary["RoomTypeCode"] as? String
		if let roomRateData = dictionary["RoomRate"] as? [String:Any]{
			roomRate = JBRoomRate(fromDictionary: roomRateData)
		}
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if effectiveDate != nil{
			dictionary["EffectiveDate"] = effectiveDate
		}
		if expireDate != nil{
			dictionary["ExpireDate"] = expireDate
		}
		if numberOfUnits != nil{
			dictionary["NumberOfUnits"] = numberOfUnits
		}
		if ratePlanCode != nil{
			dictionary["RatePlanCode"] = ratePlanCode
		}
		if rates != nil{
			dictionary["Rates"] = rates.toDictionary()
		}
		if roomTypeCode != nil{
			dictionary["RoomTypeCode"] = roomTypeCode
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
         effectiveDate = aDecoder.decodeObject(forKey: "EffectiveDate") as? String
         expireDate = aDecoder.decodeObject(forKey: "ExpireDate") as? String
         numberOfUnits = aDecoder.decodeObject(forKey: "NumberOfUnits") as? String
         ratePlanCode = aDecoder.decodeObject(forKey: "RatePlanCode") as? String
         rates = aDecoder.decodeObject(forKey: "Rates") as? JBRate
         roomTypeCode = aDecoder.decodeObject(forKey: "RoomTypeCode") as? String
         roomRate = aDecoder.decodeObject(forKey: "RoomRate") as? JBRoomRate

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if effectiveDate != nil{
			aCoder.encode(effectiveDate, forKey: "EffectiveDate")
		}
		if expireDate != nil{
			aCoder.encode(expireDate, forKey: "ExpireDate")
		}
		if numberOfUnits != nil{
			aCoder.encode(numberOfUnits, forKey: "NumberOfUnits")
		}
		if ratePlanCode != nil{
			aCoder.encode(ratePlanCode, forKey: "RatePlanCode")
		}
		if rates != nil{
			aCoder.encode(rates, forKey: "Rates")
		}
		if roomTypeCode != nil{
			aCoder.encode(roomTypeCode, forKey: "RoomTypeCode")
		}
		if roomRate != nil{
			aCoder.encode(roomRate, forKey: "RoomRate")
		}

	}

}