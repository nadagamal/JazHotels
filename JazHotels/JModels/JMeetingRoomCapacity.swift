//
//	JMeetingRoomCapacity.swift
//
//	Create by Nada Gamal on 1/7/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

class JMeetingRoomCapacity{

	var meetingRoomFormatCode : String!
	var occupancy : JOccupancy!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		meetingRoomFormatCode = dictionary["_MeetingRoomFormatCode"] as? String
		if let occupancyData = dictionary["Occupancy"] as? [String:Any]{
			occupancy = JOccupancy(fromDictionary: occupancyData)
		}
	}

}
