//
//	JFacilityInfo.swift
//
//	Create by Nada Gamal on 1/7/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

class JFacilityInfo{

	var guestRooms : JGuestRoom!
	var meetingRooms : JMeetingRoom!
	var restaurants : JRestaurant!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		if let guestRoomsData = dictionary["GuestRooms"] as? [String:Any]{
			guestRooms = JGuestRoom(fromDictionary: guestRoomsData)
		}
		if let meetingRoomsData = dictionary["MeetingRooms"] as? [String:Any]{
			meetingRooms = JMeetingRoom(fromDictionary: meetingRoomsData)
		}
		if let restaurantsData = dictionary["Restaurants"] as? [String:Any]{
			restaurants = JRestaurant(fromDictionary: restaurantsData)
		}
	}

}