//
//	JCRoomRate.swift
//
//	Create by Nada Gamal on 1/7/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

class JCRoomRate{

	var availability : JCAvailability!
	var rates : JCRate!
	var numberOfUnits : String!
	var ratePlanCode : String!
	var roomTypeCode : String!
	var roomRate : [JCRoomRate]!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		if let availabilityData = dictionary["Availability"] as? [String:Any]{
			availability = JCAvailability(fromDictionary: availabilityData)
		}
		if let ratesData = dictionary["Rates"] as? [String:Any]{
			rates = JCRate(fromDictionary: ratesData)
		}
		numberOfUnits = dictionary["_NumberOfUnits"] as? String
		ratePlanCode = dictionary["_RatePlanCode"] as? String
		roomTypeCode = dictionary["_RoomTypeCode"] as? String
		roomRate = [JCRoomRate]()
		if let roomRateArray = dictionary["RoomRate"] as? [[String:Any]]{
			for dic in roomRateArray{
				let value = JCRoomRate(fromDictionary: dic)
				roomRate.append(value)
			}
		}
	}

}