//
//	JBRoomRate.swift
//
//	Create by Nada Gamal on 9/9/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

class JBRoomRate{

	var rates : JBRate!
	var effectiveDate : String!
	var expireDate : String!
	var numberOfUnits : String!
	var ratePlanCode : String!
	var roomTypeCode : String!
	var roomRate : JBRoomRate!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		if let ratesData = dictionary["Rates"] as? [String:Any]{
			rates = JBRate(fromDictionary: ratesData)
		}
		effectiveDate = dictionary["_EffectiveDate"] as? String
		expireDate = dictionary["_ExpireDate"] as? String
		numberOfUnits = dictionary["_NumberOfUnits"] as? String
		ratePlanCode = dictionary["_RatePlanCode"] as? String
		roomTypeCode = dictionary["_RoomTypeCode"] as? String
		if let roomRateData = dictionary["RoomRate"] as? [String:Any]{
			roomRate = JBRoomRate(fromDictionary: roomRateData)
		}
	}

}