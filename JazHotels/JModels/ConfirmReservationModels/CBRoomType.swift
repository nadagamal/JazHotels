//
//	CBRoomType.swift
//
//	Create by Nada Gamal on 18/9/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class CBRoomType : NSObject, NSCoding{

	var additionalDetails : CBAdditionalDetail!
	var occupancy : CBOccupancy!
	var roomDescription : CBRoomDescription!
	var numberOfUnits : String!
	var roomTypeCode : String!
	var roomType : CBRoomType!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		if let additionalDetailsData = dictionary["AdditionalDetails"] as? [String:Any]{
			additionalDetails = CBAdditionalDetail(fromDictionary: additionalDetailsData)
		}
		if let occupancyData = dictionary["Occupancy"] as? [String:Any]{
			occupancy = CBOccupancy(fromDictionary: occupancyData)
		}
		if let roomDescriptionData = dictionary["RoomDescription"] as? [String:Any]{
			roomDescription = CBRoomDescription(fromDictionary: roomDescriptionData)
		}
		numberOfUnits = dictionary["_NumberOfUnits"] as? String
		roomTypeCode = dictionary["_RoomTypeCode"] as? String
		if let roomTypeData = dictionary["RoomType"] as? [String:Any]{
			roomType = CBRoomType(fromDictionary: roomTypeData)
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
		if occupancy != nil{
			dictionary["Occupancy"] = occupancy.toDictionary()
		}
		if roomDescription != nil{
			dictionary["RoomDescription"] = roomDescription.toDictionary()
		}
		if numberOfUnits != nil{
			dictionary["_NumberOfUnits"] = numberOfUnits
		}
		if roomTypeCode != nil{
			dictionary["_RoomTypeCode"] = roomTypeCode
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
         additionalDetails = aDecoder.decodeObject(forKey: "AdditionalDetails") as? CBAdditionalDetail
         occupancy = aDecoder.decodeObject(forKey: "Occupancy") as? CBOccupancy
         roomDescription = aDecoder.decodeObject(forKey: "RoomDescription") as? CBRoomDescription
         numberOfUnits = aDecoder.decodeObject(forKey: "_NumberOfUnits") as? String
         roomTypeCode = aDecoder.decodeObject(forKey: "_RoomTypeCode") as? String
         roomType = aDecoder.decodeObject(forKey: "RoomType") as? CBRoomType

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
		if occupancy != nil{
			aCoder.encode(occupancy, forKey: "Occupancy")
		}
		if roomDescription != nil{
			aCoder.encode(roomDescription, forKey: "RoomDescription")
		}
		if numberOfUnits != nil{
			aCoder.encode(numberOfUnits, forKey: "_NumberOfUnits")
		}
		if roomTypeCode != nil{
			aCoder.encode(roomTypeCode, forKey: "_RoomTypeCode")
		}
		if roomType != nil{
			aCoder.encode(roomType, forKey: "RoomType")
		}

	}

}