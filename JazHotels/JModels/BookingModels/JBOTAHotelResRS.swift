//
//	JBOTAHotelResRS.swift
//
//	Create by Nada Gamal on 9/9/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

class JBOTAHotelResRS{

	var hotelReservations : JBHotelReservation!
	var echoToken : String!
	var primaryLangID : String!
	var timeStamp : String!
    var errors : CBError!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		if let hotelReservationsData = dictionary["HotelReservations"] as? [String:Any]{
			hotelReservations = JBHotelReservation(fromDictionary: hotelReservationsData)
		}
		echoToken = dictionary["_EchoToken"] as? String
		primaryLangID = dictionary["_PrimaryLangID"] as? String
		timeStamp = dictionary["_TimeStamp"] as? String
        if let errorsData = dictionary["Errors"] as? [String:Any]{
            errors = CBError(fromDictionary: errorsData)
        }
	}

}
