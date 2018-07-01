//
//	JPolicyInfo.swift
//
//	Create by Nada Gamal on 1/7/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

class JPolicyInfo{

	var checkInTime : String!
	var checkOutTime : String!
	var kidsStayFree : Bool!
	var maxChildAge : String!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		checkInTime = dictionary["_CheckInTime"] as? String
		checkOutTime = dictionary["_CheckOutTime"] as? String
		kidsStayFree = dictionary["_KidsStayFree"] as? Bool
		maxChildAge = dictionary["_MaxChildAge"] as? String
	}

}
