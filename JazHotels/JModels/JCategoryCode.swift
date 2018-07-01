//
//	JCategoryCode.swift
//
//	Create by Nada Gamal on 1/7/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

class JCategoryCode{

	var guestRoomInfo : [JGuestRoomInfo]!
	var hotelCategory : [JHotelCategory]!
	var locationCategory : [JHotelCategory]!
	var segmentCategory : [JHotelCategory]!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		guestRoomInfo = [JGuestRoomInfo]()
		if let guestRoomInfoArray = dictionary["GuestRoomInfo"] as? [[String:Any]]{
			for dic in guestRoomInfoArray{
				let value = JGuestRoomInfo(fromDictionary: dic)
				guestRoomInfo.append(value)
			}
		}
		hotelCategory = [JHotelCategory]()
		if let hotelCategoryArray = dictionary["HotelCategory"] as? [[String:Any]]{
			for dic in hotelCategoryArray{
				let value = JHotelCategory(fromDictionary: dic)
				hotelCategory.append(value)
			}
		}
		locationCategory = [JHotelCategory]()
		if let locationCategoryArray = dictionary["LocationCategory"] as? [[String:Any]]{
			for dic in locationCategoryArray{
				let value = JHotelCategory(fromDictionary: dic)
				locationCategory.append(value)
			}
		}
		segmentCategory = [JHotelCategory]()
		if let segmentCategoryArray = dictionary["SegmentCategory"] as? [[String:Any]]{
			for dic in segmentCategoryArray{
				let value = JHotelCategory(fromDictionary: dic)
				segmentCategory.append(value)
			}
		}
	}

}