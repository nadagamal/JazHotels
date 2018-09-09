//
//	JBBasicPropertyInfo.swift
//
//	Create by Nada Gamal on 9/9/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

class JBBasicPropertyInfo{

	var address : JBAddres!
	var contactNumbers : JBContactNumber!
	var position : JBPosition!
	var chainCode : String!
	var chainName : String!
	var hotelCode : String!
	var hotelName : String!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		if let addressData = dictionary["Address"] as? [String:Any]{
			address = JBAddres(fromDictionary: addressData)
		}
		if let contactNumbersData = dictionary["ContactNumbers"] as? [String:Any]{
			contactNumbers = JBContactNumber(fromDictionary: contactNumbersData)
		}
		if let positionData = dictionary["Position"] as? [String:Any]{
			position = JBPosition(fromDictionary: positionData)
		}
		chainCode = dictionary["_ChainCode"] as? String
		chainName = dictionary["_ChainName"] as? String
		hotelCode = dictionary["_HotelCode"] as? String
		hotelName = dictionary["_HotelName"] as? String
	}

}