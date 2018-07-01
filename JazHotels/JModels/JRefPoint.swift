//
//	JRefPoint.swift
//
//	Create by Nada Gamal on 1/7/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

class JRefPoint{

	var code : String!
	var direction : String!
	var primaryIndicator : Bool!
	var altitude : String!
	var distance : String!
	var distanceUnitName : String!
	var latitude : String!
	var longitude : String!
	var refPoint : JRefPoint!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		code = dictionary["_Code"] as? String
		direction = dictionary["_Direction"] as? String
		primaryIndicator = dictionary["_PrimaryIndicator"] as? Bool
		altitude = dictionary["Altitude"] as? String
		distance = dictionary["Distance"] as? String
		distanceUnitName = dictionary["DistanceUnitName"] as? String
		latitude = dictionary["Latitude"] as? String
		longitude = dictionary["Longitude"] as? String
		if let refPointData = dictionary["RefPoint"] as? [String:Any]{
			refPoint = JRefPoint(fromDictionary: refPointData)
		}
	}

}
