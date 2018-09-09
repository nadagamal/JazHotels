//
//	JBHotelReservation.swift
//
//	Create by Nada Gamal on 9/9/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

class JBHotelReservation{

	var pOS : JBPOS!
	var resGlobalInfo : JBResGlobalInfo!
	var resGuests : JBResGuest!
	var roomStays : JBRoomStay!
	var tPAExtensions : JBTpaExtension!
	var uniqueID : JBUniqueID!
	var createDateTime : String!
	var creatorID : String!
	var lastModifierID : String!
	var lastModifyDateTime : String!
	var hotelReservation : [JBHotelReservation]!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		if let pOSData = dictionary["POS"] as? [String:Any]{
			pOS = JBPOS(fromDictionary: pOSData)
		}
		if let resGlobalInfoData = dictionary["ResGlobalInfo"] as? [String:Any]{
			resGlobalInfo = JBResGlobalInfo(fromDictionary: resGlobalInfoData)
		}
		if let resGuestsData = dictionary["ResGuests"] as? [String:Any]{
			resGuests = JBResGuest(fromDictionary: resGuestsData)
		}
		if let roomStaysData = dictionary["RoomStays"] as? [String:Any]{
			roomStays = JBRoomStay(fromDictionary: roomStaysData)
		}
		if let tPAExtensionsData = dictionary["TPA_Extensions"] as? [String:Any]{
			tPAExtensions = JBTpaExtension(fromDictionary: tPAExtensionsData)
		}
		if let uniqueIDData = dictionary["UniqueID"] as? [String:Any]{
			uniqueID = JBUniqueID(fromDictionary: uniqueIDData)
		}
		createDateTime = dictionary["_CreateDateTime"] as? String
		creatorID = dictionary["_CreatorID"] as? String
		lastModifierID = dictionary["_LastModifierID"] as? String
		lastModifyDateTime = dictionary["_LastModifyDateTime"] as? String
		hotelReservation = [JBHotelReservation]()
		if let hotelReservationArray = dictionary["HotelReservation"] as? [[String:Any]]{
			for dic in hotelReservationArray{
				let value = JBHotelReservation(fromDictionary: dic)
				hotelReservation.append(value)
			}
		}
	}

}
