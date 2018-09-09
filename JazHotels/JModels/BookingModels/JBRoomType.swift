//
//	JBRoomType.swift
//
//	Create by Nada Gamal on 9/9/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class JBRoomType : NSObject, NSCoding{

	var additionalDetails : JBAdditionalDetail!
	var numberOfUnits : String!
	var occupancy : JBOccupancy!
	var roomDescription : JBRoomDescription!
	var roomTypeCode : String!
	var roomType : JBRoomType!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		if let additionalDetailsData = dictionary["AdditionalDetails"] as? [String:Any]{
			additionalDetails = JBAdditionalDetail(fromDictionary: additionalDetailsData)
		}
		numberOfUnits = dictionary["NumberOfUnits"] as? String
		if let occupancyData = dictionary["Occupancy"] as? [String:Any]{
			occupancy = JBOccupancy(fromDictionary: occupancyData)
		}
		if let roomDescriptionData = dictionary["RoomDescription"] as? [String:Any]{
			roomDescription = JBRoomDescription(fromDictionary: roomDescriptionData)
		}
		roomTypeCode = dictionary["RoomTypeCode"] as? String
		if let roomTypeData = dictionary["RoomType"] as? [String:Any]{
			roomType = JBRoomType(fromDictionary: roomTypeData)
		}
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if additionalDetails != nil{
			dictionary["AdditionalDetails"] = additionalDetails.toDictionary()
		}
		if numberOfUnits != nil{
			dictionary["NumberOfUnits"] = numberOfUnits
		}
		if occupancy != nil{
			dictionary["Occupancy"] = occupancy.toDictionary()
		}
		if roomDescription != nil{
			dictionary["RoomDescription"] = roomDescription.toDictionary()
		}
		if roomTypeCode != nil{
			dictionary["RoomTypeCode"] = roomTypeCode
		}
		if roomType != nil{
			dictionary["RoomType"] = roomType.toDictionary()
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         additionalDetails = aDecoder.decodeObject(forKey: "AdditionalDetails") as? JBAdditionalDetail
         numberOfUnits = aDecoder.decodeObject(forKey: "NumberOfUnits") as? String
         occupancy = aDecoder.decodeObject(forKey: "Occupancy") as? JBOccupancy
         roomDescription = aDecoder.decodeObject(forKey: "RoomDescription") as? JBRoomDescription
         roomTypeCode = aDecoder.decodeObject(forKey: "RoomTypeCode") as? String
         roomType = aDecoder.decodeObject(forKey: "RoomType") as? JBRoomType

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if additionalDetails != nil{
			aCoder.encode(additionalDetails, forKey: "AdditionalDetails")
		}
		if numberOfUnits != nil{
			aCoder.encode(numberOfUnits, forKey: "NumberOfUnits")
		}
		if occupancy != nil{
			aCoder.encode(occupancy, forKey: "Occupancy")
		}
		if roomDescription != nil{
			aCoder.encode(roomDescription, forKey: "RoomDescription")
		}
		if roomTypeCode != nil{
			aCoder.encode(roomTypeCode, forKey: "RoomTypeCode")
		}
		if roomType != nil{
			aCoder.encode(roomType, forKey: "RoomType")
		}

	}

}