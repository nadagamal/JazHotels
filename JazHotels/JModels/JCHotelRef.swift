//
//	JCHotelRef.swift
//
//	Create by Nada Gamal on 1/7/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

class JCHotelRef{

	var hotelCode : String!
	var hotelName : String!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		hotelCode = dictionary["_HotelCode"] as? String
		hotelName = dictionary["_HotelName"] as? String
	}

}