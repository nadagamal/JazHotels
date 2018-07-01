//
//	JCBasicPropertyInfo.swift
//
//	Create by Nada Gamal on 1/7/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

class JCBasicPropertyInfo{

	var address : JCAddres!
	var contactNumbers : JCContactNumber!
	var hotelCode : String!
	var hotelName : String!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		if let addressData = dictionary["Address"] as? [String:Any]{
			address = JCAddres(fromDictionary: addressData)
		}
		if let contactNumbersData = dictionary["ContactNumbers"] as? [String:Any]{
			contactNumbers = JCContactNumber(fromDictionary: contactNumbersData)
		}
		hotelCode = dictionary["_HotelCode"] as? String
		hotelName = dictionary["_HotelName"] as? String
	}

}