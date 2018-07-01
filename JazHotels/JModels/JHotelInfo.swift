//
//	JHotelInfo.swift
//
//	Create by Nada Gamal on 1/7/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

class JHotelInfo{

	var whenBuilt : String!
	var categoryCodes : JCategoryCode!
	var descriptions : JDescription!
	var hotelName : JHotelName!
	var position : JPosition!
	var relativePosition : JRelativePosition!
	var services : JService!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		whenBuilt = dictionary["_WhenBuilt"] as? String
		if let categoryCodesData = dictionary["CategoryCodes"] as? [String:Any]{
			categoryCodes = JCategoryCode(fromDictionary: categoryCodesData)
		}
		if let descriptionsData = dictionary["Descriptions"] as? [String:Any]{
			descriptions = JDescription(fromDictionary: descriptionsData)
		}
		if let hotelNameData = dictionary["HotelName"] as? [String:Any]{
			hotelName = JHotelName(fromDictionary: hotelNameData)
		}
		if let positionData = dictionary["Position"] as? [String:Any]{
			position = JPosition(fromDictionary: positionData)
		}
		if let relativePositionData = dictionary["RelativePosition"] as? [String:Any]{
			relativePosition = JRelativePosition(fromDictionary: relativePositionData)
		}
		if let servicesData = dictionary["Services"] as? [String:Any]{
			services = JService(fromDictionary: servicesData)
		}
	}

}
