//
//	JBHotelReservationID.swift
//
//	Create by Nada Gamal on 9/9/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

class JBHotelReservationID{

	var resIDDate : String!
	var resIDSource : String!
	var resIDSourceContext : String!
	var resIDType : String!
	var resIDValue : String!
	var hotelReservationID : [JBHotelReservationID]!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		resIDDate = dictionary["_ResID_Date"] as? String
		resIDSource = dictionary["_ResID_Source"] as? String
		resIDSourceContext = dictionary["_ResID_SourceContext"] as? String
		resIDType = dictionary["_ResID_Type"] as? String
		resIDValue = dictionary["_ResID_Value"] as? String
		hotelReservationID = [JBHotelReservationID]()
		if let hotelReservationIDArray = dictionary["HotelReservationID"] as? [[String:Any]]{
			for dic in hotelReservationIDArray{
				let value = JBHotelReservationID(fromDictionary: dic)
				hotelReservationID.append(value)
			}
		}
	}

}