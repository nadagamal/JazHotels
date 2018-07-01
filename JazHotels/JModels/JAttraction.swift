//
//	JAttraction.swift
//
//	Create by Nada Gamal on 1/7/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

class JAttraction{

	var attractionCategoryCode : String!
	var codeDetail : String!
	var attractionName : String!
	var refPoints : JRefPoint!
	var attraction : [JAttraction]!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		attractionCategoryCode = dictionary["_AttractionCategoryCode"] as? String
		codeDetail = dictionary["_CodeDetail"] as? String
		attractionName = dictionary["AttractionName"] as? String
		if let refPointsData = dictionary["RefPoints"] as? [String:Any]{
			refPoints = JRefPoint(fromDictionary: refPointsData)
		}
		attraction = [JAttraction]()
		if let attractionArray = dictionary["Attraction"] as? [[String:Any]]{
			for dic in attractionArray{
				let value = JAttraction(fromDictionary: dic)
				attraction.append(value)
			}
		}
	}

}
