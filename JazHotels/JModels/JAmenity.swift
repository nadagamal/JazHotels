//
//	JAmenity.swift
//
//	Create by Nada Gamal on 1/7/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

class JAmenity{

	var codeDetail : String!
	var roomAmenityCode : String!
	var multimediaDescriptions : JMultimediaDescription!
	var amenity : [JAmenity]!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		codeDetail = dictionary["_CodeDetail"] as? String
		roomAmenityCode = dictionary["_RoomAmenityCode"] as? String
		if let multimediaDescriptionsData = dictionary["MultimediaDescriptions"] as? [String:Any]{
			multimediaDescriptions = JMultimediaDescription(fromDictionary: multimediaDescriptionsData)
		}
		amenity = [JAmenity]()
		if let amenityArray = dictionary["Amenity"] as? [[String:Any]]{
			for dic in amenityArray{
				let value = JAmenity(fromDictionary: dic)
				amenity.append(value)
			}
		}
	}

}
