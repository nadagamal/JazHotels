//
//	JCategoryCode.swift
//
//	Create by Nada Gamal on 1/7/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class JCategoryCode : NSObject, NSCoding{

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

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if guestRoomInfo != nil{
			var dictionaryElements = [[String:Any]]()
			for guestRoomInfoElement in guestRoomInfo {
				dictionaryElements.append(guestRoomInfoElement.toDictionary())
			}
			dictionary["GuestRoomInfo"] = dictionaryElements
		}
		if hotelCategory != nil{
			var dictionaryElements = [[String:Any]]()
			for hotelCategoryElement in hotelCategory {
				dictionaryElements.append(hotelCategoryElement.toDictionary())
			}
			dictionary["HotelCategory"] = dictionaryElements
		}
		if locationCategory != nil{
			var dictionaryElements = [[String:Any]]()
			for locationCategoryElement in locationCategory {
				dictionaryElements.append(locationCategoryElement.toDictionary())
			}
			dictionary["LocationCategory"] = dictionaryElements
		}
		if segmentCategory != nil{
			var dictionaryElements = [[String:Any]]()
			for segmentCategoryElement in segmentCategory {
				dictionaryElements.append(segmentCategoryElement.toDictionary())
			}
			dictionary["SegmentCategory"] = dictionaryElements
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         guestRoomInfo = aDecoder.decodeObject(forKey :"GuestRoomInfo") as? [JGuestRoomInfo]
         hotelCategory = aDecoder.decodeObject(forKey :"HotelCategory") as? [JHotelCategory]
         locationCategory = aDecoder.decodeObject(forKey :"LocationCategory") as? [JHotelCategory]
         segmentCategory = aDecoder.decodeObject(forKey :"SegmentCategory") as? [JHotelCategory]

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if guestRoomInfo != nil{
			aCoder.encode(guestRoomInfo, forKey: "GuestRoomInfo")
		}
		if hotelCategory != nil{
			aCoder.encode(hotelCategory, forKey: "HotelCategory")
		}
		if locationCategory != nil{
			aCoder.encode(locationCategory, forKey: "LocationCategory")
		}
		if segmentCategory != nil{
			aCoder.encode(segmentCategory, forKey: "SegmentCategory")
		}

	}

}