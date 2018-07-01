//
//	JMeetingRoom.swift
//
//	Create by Nada Gamal on 1/7/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

class JMeetingRoom{

	var roomName : String!
	var availableCapacities : JAvailableCapacity!
	var descriptionField : JDescription!
	var dimension : JDimension!
	var meetingRoomCount : String!
	var unitOfMeasure : String!
	var unitOfMeasureCode : String!
	var meetingRoom : JMeetingRoom!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		roomName = dictionary["_RoomName"] as? String
		if let availableCapacitiesData = dictionary["AvailableCapacities"] as? [String:Any]{
			availableCapacities = JAvailableCapacity(fromDictionary: availableCapacitiesData)
		}
		if let descriptionFieldData = dictionary["Description"] as? [String:Any]{
			descriptionField = JDescription(fromDictionary: descriptionFieldData)
		}
		if let dimensionData = dictionary["Dimension"] as? [String:Any]{
			dimension = JDimension(fromDictionary: dimensionData)
		}
		meetingRoomCount = dictionary["_MeetingRoomCount"] as? String
		unitOfMeasure = dictionary["_UnitOfMeasure"] as? String
		unitOfMeasureCode = dictionary["_UnitOfMeasureCode"] as? String
		if let meetingRoomData = dictionary["MeetingRoom"] as? [String:Any]{
			meetingRoom = JMeetingRoom(fromDictionary: meetingRoomData)
		}
	}

}
