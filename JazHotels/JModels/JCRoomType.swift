//
//	JCRoomType.swift
//
//	Create by Nada Gamal on 1/7/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

class JCRoomType{

	var additionalDetails : JCAdditionalDetail!
	var occupancy : JCOccupancy!
	var roomDescription : JCRoomDescription!
	var tPAExtensions : JCTpaExtension!
	var numberOfUnits : String!
	var roomTypeCode : String!
	var roomType : [JCRoomType]!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		if let additionalDetailsData = dictionary["AdditionalDetails"] as? [String:Any]{
			additionalDetails = JCAdditionalDetail(fromDictionary: additionalDetailsData)
		}
		if let occupancyData = dictionary["Occupancy"] as? [String:Any]{
			occupancy = JCOccupancy(fromDictionary: occupancyData)
		}
		if let roomDescriptionData = dictionary["RoomDescription"] as? [String:Any]{
			roomDescription = JCRoomDescription(fromDictionary: roomDescriptionData)
		}
		if let tPAExtensionsData = dictionary["TPA_Extensions"] as? [String:Any]{
			tPAExtensions = JCTpaExtension(fromDictionary: tPAExtensionsData)
		}
		numberOfUnits = dictionary["_NumberOfUnits"] as? String
		roomTypeCode = dictionary["_RoomTypeCode"] as? String
		roomType = [JCRoomType]()
		if let roomTypeArray = dictionary["RoomType"] as? [[String:Any]]{
			for dic in roomTypeArray{
				let value = JCRoomType(fromDictionary: dic)
				roomType.append(value)
			}
		}
	}

}
