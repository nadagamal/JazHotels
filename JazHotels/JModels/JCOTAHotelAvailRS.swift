//
//	JCOTAHotelAvailRS.swift
//
//	Create by Nada Gamal on 1/7/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

class JCOTAHotelAvailRS{

	var criteria : JCCriteria!
	var roomStays : JCRoomStay!
	var success : String!
	var warnings : JCWarning!
	var echoToken : String!
	var primaryLangID : String!
	var timeStamp : String!
	var xmlns : String!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		if let criteriaData = dictionary["Criteria"] as? [String:Any]{
			criteria = JCCriteria(fromDictionary: criteriaData)
		}
		if let roomStaysData = dictionary["RoomStays"] as? [String:Any]{
			roomStays = JCRoomStay(fromDictionary: roomStaysData)
		}
		success = dictionary["Success"] as? String
		if let warningsData = dictionary["Warnings"] as? [String:Any]{
			warnings = JCWarning(fromDictionary: warningsData)
		}
		echoToken = dictionary["_EchoToken"] as? String
		primaryLangID = dictionary["_PrimaryLangID"] as? String
		timeStamp = dictionary["_TimeStamp"] as? String
		xmlns = dictionary["_xmlns"] as? String
	}

}