//
//	JHotelInfo.swift
//
//	Create by Nada Gamal on 1/7/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class JHotelInfo : NSObject, NSCoding{

	var categoryCodes : JCategoryCode!
	var descriptions : JDescription!
	var hotelName : JHotelName!
	var position : JPosition!
	var services : JService!
	var whenBuilt : String!
    var descriptionn : JDescription!

	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
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
		if let servicesData = dictionary["Services"] as? [String:Any]{
			services = JService(fromDictionary: servicesData)
		}
		whenBuilt = dictionary["_WhenBuilt"] as? String
        
        if let descriptionFieldData = dictionary["Description"] as? [String:Any]{
            descriptionn = JDescription(fromDictionary: descriptionFieldData)
        }
	}
    
    

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if categoryCodes != nil{
			dictionary["CategoryCodes"] = categoryCodes.toDictionary()
		}
		if descriptions != nil{
			dictionary["Descriptions"] = descriptions.toDictionary()
		}
		if hotelName != nil{
			dictionary["HotelName"] = hotelName.toDictionary()
		}
		if position != nil{
			dictionary["Position"] = position.toDictionary()
		}
		if services != nil{
			dictionary["Services"] = services.toDictionary()
		}
		if whenBuilt != nil{
			dictionary["_WhenBuilt"] = whenBuilt
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         categoryCodes = aDecoder.decodeObject(forKey: "CategoryCodes") as? JCategoryCode
         descriptions = aDecoder.decodeObject(forKey: "Descriptions") as? JDescription
         hotelName = aDecoder.decodeObject(forKey: "HotelName") as? JHotelName
         position = aDecoder.decodeObject(forKey: "Position") as? JPosition
         services = aDecoder.decodeObject(forKey: "Services") as? JService
         whenBuilt = aDecoder.decodeObject(forKey: "_WhenBuilt") as? String

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if categoryCodes != nil{
			aCoder.encode(categoryCodes, forKey: "CategoryCodes")
		}
		if descriptions != nil{
			aCoder.encode(descriptions, forKey: "Descriptions")
		}
		if hotelName != nil{
			aCoder.encode(hotelName, forKey: "HotelName")
		}
		if position != nil{
			aCoder.encode(position, forKey: "Position")
		}
		if services != nil{
			aCoder.encode(services, forKey: "Services")
		}
		if whenBuilt != nil{
			aCoder.encode(whenBuilt, forKey: "_WhenBuilt")
		}

	}

}
