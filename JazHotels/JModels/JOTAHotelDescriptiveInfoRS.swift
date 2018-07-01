//
//	JOTAHotelDescriptiveInfoRS.swift
//
//	Create by Nada Gamal on 1/7/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

class JOTAHotelDescriptiveInfoRS{

	var echoToken : String!
	var primaryLangID : String!
	var timeStamp : String!
	var xmlns : String!
	var hotelDescriptiveContents : JHotelDescriptiveContent!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		echoToken = dictionary["_EchoToken"] as? String
		primaryLangID = dictionary["_PrimaryLangID"] as? String
		timeStamp = dictionary["_TimeStamp"] as? String
		xmlns = dictionary["_xmlns"] as? String
		if let hotelDescriptiveContentsData = dictionary["HotelDescriptiveContents"] as? [String:Any]{
			hotelDescriptiveContents = JHotelDescriptiveContent(fromDictionary: hotelDescriptiveContentsData)
		}
	}

}
