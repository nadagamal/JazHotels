//
//	JAvailableCapacity.swift
//
//	Create by Nada Gamal on 1/7/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

class JAvailableCapacity{

	var meetingRoomCapacity : [JMeetingRoomCapacity]!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		meetingRoomCapacity = [JMeetingRoomCapacity]()
		if let meetingRoomCapacityArray = dictionary["MeetingRoomCapacity"] as? [[String:Any]]{
			for dic in meetingRoomCapacityArray{
				let value = JMeetingRoomCapacity(fromDictionary: dic)
				meetingRoomCapacity.append(value)
			}
		}
	}

}
