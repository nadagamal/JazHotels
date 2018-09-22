//
//	MRRoomType.swift
//
//	Create by Nada Gamal on 22/9/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class MRRoomType : NSObject, NSCoding{

	var AdditionalDetails : MRAdditionalDetail!
	var Occupancy : MROccupancy!
	var RoomDescription : MRRoomDescription!
	var NumberOfUnits : String!
	var RoomTypeCode : String!
	var RoomType : MRRoomType!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		if let AdditionalDetailsData = dictionary["AdditionalDetails"] as? [String:Any]{
			AdditionalDetails = MRAdditionalDetail(fromDictionary: AdditionalDetailsData)
		}
		if let OccupancyData = dictionary["Occupancy"] as? [String:Any]{
			Occupancy = MROccupancy(fromDictionary: OccupancyData)
		}
		if let RoomDescriptionData = dictionary["RoomDescription"] as? [String:Any]{
			RoomDescription = MRRoomDescription(fromDictionary: RoomDescriptionData)
		}
		NumberOfUnits = dictionary["_NumberOfUnits"] as? String
		RoomTypeCode = dictionary["_RoomTypeCode"] as? String
		if let RoomTypeData = dictionary["RoomType"] as? [String:Any]{
			RoomType = MRRoomType(fromDictionary: RoomTypeData)
		}
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if AdditionalDetails != nil{
			dictionary["AdditionalDetails"] = AdditionalDetails.toDictionary()
		}
		if Occupancy != nil{
			dictionary["Occupancy"] = Occupancy.toDictionary()
		}
		if RoomDescription != nil{
			dictionary["RoomDescription"] = RoomDescription.toDictionary()
		}
		if NumberOfUnits != nil{
			dictionary["_NumberOfUnits"] = NumberOfUnits
		}
		if RoomTypeCode != nil{
			dictionary["_RoomTypeCode"] = RoomTypeCode
		}
		if RoomType != nil{
			dictionary["RoomType"] = RoomType.toDictionary()
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         AdditionalDetails = aDecoder.decodeObject(forKey: "AdditionalDetails") as? MRAdditionalDetail
         Occupancy = aDecoder.decodeObject(forKey: "Occupancy") as? MROccupancy
         RoomDescription = aDecoder.decodeObject(forKey: "RoomDescription") as? MRRoomDescription
         NumberOfUnits = aDecoder.decodeObject(forKey: "_NumberOfUnits") as? String
         RoomTypeCode = aDecoder.decodeObject(forKey: "_RoomTypeCode") as? String
         RoomType = aDecoder.decodeObject(forKey: "RoomType") as? MRRoomType

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if AdditionalDetails != nil{
			aCoder.encode(AdditionalDetails, forKey: "AdditionalDetails")
		}
		if Occupancy != nil{
			aCoder.encode(Occupancy, forKey: "Occupancy")
		}
		if RoomDescription != nil{
			aCoder.encode(RoomDescription, forKey: "RoomDescription")
		}
		if NumberOfUnits != nil{
			aCoder.encode(NumberOfUnits, forKey: "_NumberOfUnits")
		}
		if RoomTypeCode != nil{
			aCoder.encode(RoomTypeCode, forKey: "_RoomTypeCode")
		}
		if RoomType != nil{
			aCoder.encode(RoomType, forKey: "RoomType")
		}

	}

}