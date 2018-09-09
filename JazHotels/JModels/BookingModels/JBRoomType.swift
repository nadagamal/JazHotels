//
//	JBRoomType.swift
//
//	Create by Nada Gamal on 9/9/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

class JBRoomType{

	var additionalDetails : JBAdditionalDetail!
	var occupancy : JBOccupancy!
	var roomDescription : JBRoomDescription!
	var numberOfUnits : String!
	var roomTypeCode : String!
	var roomType : JBRoomType!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		if let additionalDetailsData = dictionary["AdditionalDetails"] as? [String:Any]{
			additionalDetails = JBAdditionalDetail(fromDictionary: additionalDetailsData)
		}
		if let occupancyData = dictionary["Occupancy"] as? [String:Any]{
			occupancy = JBOccupancy(fromDictionary: occupancyData)
		}
		if let roomDescriptionData = dictionary["RoomDescription"] as? [String:Any]{
			roomDescription = JBRoomDescription(fromDictionary: roomDescriptionData)
		}
		numberOfUnits = dictionary["_NumberOfUnits"] as? String
		roomTypeCode = dictionary["_RoomTypeCode"] as? String
		if let roomTypeData = dictionary["RoomType"] as? [String:Any]{
			roomType = JBRoomType(fromDictionary: roomTypeData)
		}
	}

}