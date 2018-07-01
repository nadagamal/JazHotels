//
//	JGuestRoom.swift
//
//	Create by Nada Gamal on 1/7/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

class JGuestRoom{

	var code : String!
	var maxOccupancy : String!
	var quantity : String!
	var roomTypeName : String!
	var amenities : JAmenity!
	var multimediaDescriptions : JMultimediaDescription!
	var typeRoom : JTypeRoom!
	var guestRoom : [JGuestRoom]!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		code = dictionary["_Code"] as? String
		maxOccupancy = dictionary["_MaxOccupancy"] as? String
		quantity = dictionary["_Quantity"] as? String
		roomTypeName = dictionary["_RoomTypeName"] as? String
		if let amenitiesData = dictionary["Amenities"] as? [String:Any]{
			amenities = JAmenity(fromDictionary: amenitiesData)
		}
		if let multimediaDescriptionsData = dictionary["MultimediaDescriptions"] as? [String:Any]{
			multimediaDescriptions = JMultimediaDescription(fromDictionary: multimediaDescriptionsData)
		}
		if let typeRoomData = dictionary["TypeRoom"] as? [String:Any]{
			typeRoom = JTypeRoom(fromDictionary: typeRoomData)
		}
		guestRoom = [JGuestRoom]()
		if let guestRoomArray = dictionary["GuestRoom"] as? [[String:Any]]{
			for dic in guestRoomArray{
				let value = JGuestRoom(fromDictionary: dic)
				guestRoom.append(value)
			}
		}
	}

}
