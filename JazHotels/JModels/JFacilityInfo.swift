//
//	JFacilityInfo.swift
//
//	Create by Nada Gamal on 1/7/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class JFacilityInfo : NSObject, NSCoding{

	var guestRooms : JGuestRoom!
	var meetingRooms : String!
	var restaurants : JRestaurant!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		if let guestRoomsData = dictionary["GuestRooms"] as? [String:Any]{
			guestRooms = JGuestRoom(fromDictionary: guestRoomsData)
		}
		meetingRooms = dictionary["MeetingRooms"] as? String
		if let restaurantsData = dictionary["Restaurants"] as? [String:Any]{
			restaurants = JRestaurant(fromDictionary: restaurantsData)
		}
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if guestRooms != nil{
			dictionary["GuestRooms"] = guestRooms.toDictionary()
		}
		if meetingRooms != nil{
			dictionary["MeetingRooms"] = meetingRooms
		}
		if restaurants != nil{
			dictionary["Restaurants"] = restaurants.toDictionary()
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         guestRooms = aDecoder.decodeObject(forKey: "GuestRooms") as? JGuestRoom
         meetingRooms = aDecoder.decodeObject(forKey: "MeetingRooms") as? String
         restaurants = aDecoder.decodeObject(forKey: "Restaurants") as? JRestaurant

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if guestRooms != nil{
			aCoder.encode(guestRooms, forKey: "GuestRooms")
		}
		if meetingRooms != nil{
			aCoder.encode(meetingRooms, forKey: "MeetingRooms")
		}
		if restaurants != nil{
			aCoder.encode(restaurants, forKey: "Restaurants")
		}

	}

}