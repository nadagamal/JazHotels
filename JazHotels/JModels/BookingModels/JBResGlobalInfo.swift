//
//	JBResGlobalInfo.swift
//
//	Create by Nada Gamal on 9/9/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

class JBResGlobalInfo{

	var hotelReservationIDs : JBHotelReservationID!
	var total : JBTotal!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		if let hotelReservationIDsData = dictionary["HotelReservationIDs"] as? [String:Any]{
			hotelReservationIDs = JBHotelReservationID(fromDictionary: hotelReservationIDsData)
		}
		if let totalData = dictionary["Total"] as? [String:Any]{
			total = JBTotal(fromDictionary: totalData)
		}
	}

}