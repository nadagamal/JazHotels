//
//	JService.swift
//
//	Create by Nada Gamal on 1/7/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

class JService{

	var businessServiceCode : String!
	var code : String!
	var codeDetail : String!
	var included : Bool!
	var mealPlanCode : String!
	var meetingRoomCode : String!
	var proximityCode : String!
	var quantity : String!
	var descriptiveText : String!
	var features : JFeature!
	var service : [JService]!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		businessServiceCode = dictionary["_BusinessServiceCode"] as? String
		code = dictionary["_Code"] as? String
		codeDetail = dictionary["_CodeDetail"] as? String
		included = dictionary["_Included"] as? Bool
		mealPlanCode = dictionary["_MealPlanCode"] as? String
		meetingRoomCode = dictionary["_MeetingRoomCode"] as? String
		proximityCode = dictionary["_ProximityCode"] as? String
		quantity = dictionary["_Quantity"] as? String
		descriptiveText = dictionary["DescriptiveText"] as? String
		if let featuresData = dictionary["Features"] as? [String:Any]{
			features = JFeature(fromDictionary: featuresData)
		}
		service = [JService]()
		if let serviceArray = dictionary["Service"] as? [[String:Any]]{
			for dic in serviceArray{
				let value = JService(fromDictionary: dic)
				service.append(value)
			}
		}
	}

}
