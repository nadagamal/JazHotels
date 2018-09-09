//
//	JBHotelReservation.swift
//
//	Create by Nada Gamal on 9/9/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class JBHotelReservation : NSObject, NSCoding{

	var createDateTime : String!
	var creatorID : String!
	var lastModifierID : String!
	var lastModifyDateTime : String!
	var pOS : JBPOS!
	var resGlobalInfo : JBResGlobalInfo!
	var resGuests : JBResGuest!
	var roomStays : JBRoomStay!
	var tPAExtensions : JBTpaExtension!
	var uniqueID : JBUniqueID!
	var hotelReservation : JBHotelReservation!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		createDateTime = dictionary["CreateDateTime"] as? String
		creatorID = dictionary["CreatorID"] as? String
		lastModifierID = dictionary["LastModifierID"] as? String
		lastModifyDateTime = dictionary["LastModifyDateTime"] as? String
		if let pOSData = dictionary["POS"] as? [String:Any]{
			pOS = JBPOS(fromDictionary: pOSData)
		}
		if let resGlobalInfoData = dictionary["ResGlobalInfo"] as? [String:Any]{
			resGlobalInfo = JBResGlobalInfo(fromDictionary: resGlobalInfoData)
		}
		if let resGuestsData = dictionary["ResGuests"] as? [String:Any]{
			resGuests = JBResGuest(fromDictionary: resGuestsData)
		}
		if let roomStaysData = dictionary["RoomStays"] as? [String:Any]{
			roomStays = JBRoomStay(fromDictionary: roomStaysData)
		}
		if let tPAExtensionsData = dictionary["TPA_Extensions"] as? [String:Any]{
			tPAExtensions = JBTpaExtension(fromDictionary: tPAExtensionsData)
		}
		if let uniqueIDData = dictionary["UniqueID"] as? [String:Any]{
			uniqueID = JBUniqueID(fromDictionary: uniqueIDData)
		}
		if let hotelReservationData = dictionary["HotelReservation"] as? [String:Any]{
			hotelReservation = JBHotelReservation(fromDictionary: hotelReservationData)
		}
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if createDateTime != nil{
			dictionary["CreateDateTime"] = createDateTime
		}
		if creatorID != nil{
			dictionary["CreatorID"] = creatorID
		}
		if lastModifierID != nil{
			dictionary["LastModifierID"] = lastModifierID
		}
		if lastModifyDateTime != nil{
			dictionary["LastModifyDateTime"] = lastModifyDateTime
		}
		if pOS != nil{
			dictionary["POS"] = pOS.toDictionary()
		}
		if resGlobalInfo != nil{
			dictionary["ResGlobalInfo"] = resGlobalInfo.toDictionary()
		}
		if resGuests != nil{
			dictionary["ResGuests"] = resGuests.toDictionary()
		}
		if roomStays != nil{
			dictionary["RoomStays"] = roomStays.toDictionary()
		}
		if tPAExtensions != nil{
			dictionary["TPA_Extensions"] = tPAExtensions.toDictionary()
		}
		if uniqueID != nil{
			dictionary["UniqueID"] = uniqueID.toDictionary()
		}
		if hotelReservation != nil{
			dictionary["HotelReservation"] = hotelReservation.toDictionary()
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         createDateTime = aDecoder.decodeObject(forKey: "CreateDateTime") as? String
         creatorID = aDecoder.decodeObject(forKey: "CreatorID") as? String
         lastModifierID = aDecoder.decodeObject(forKey: "LastModifierID") as? String
         lastModifyDateTime = aDecoder.decodeObject(forKey: "LastModifyDateTime") as? String
         pOS = aDecoder.decodeObject(forKey: "POS") as? JBPOS
         resGlobalInfo = aDecoder.decodeObject(forKey: "ResGlobalInfo") as? JBResGlobalInfo
         resGuests = aDecoder.decodeObject(forKey: "ResGuests") as? JBResGuest
         roomStays = aDecoder.decodeObject(forKey: "RoomStays") as? JBRoomStay
         tPAExtensions = aDecoder.decodeObject(forKey: "TPA_Extensions") as? JBTpaExtension
         uniqueID = aDecoder.decodeObject(forKey: "UniqueID") as? JBUniqueID
         hotelReservation = aDecoder.decodeObject(forKey: "HotelReservation") as? JBHotelReservation

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if createDateTime != nil{
			aCoder.encode(createDateTime, forKey: "CreateDateTime")
		}
		if creatorID != nil{
			aCoder.encode(creatorID, forKey: "CreatorID")
		}
		if lastModifierID != nil{
			aCoder.encode(lastModifierID, forKey: "LastModifierID")
		}
		if lastModifyDateTime != nil{
			aCoder.encode(lastModifyDateTime, forKey: "LastModifyDateTime")
		}
		if pOS != nil{
			aCoder.encode(pOS, forKey: "POS")
		}
		if resGlobalInfo != nil{
			aCoder.encode(resGlobalInfo, forKey: "ResGlobalInfo")
		}
		if resGuests != nil{
			aCoder.encode(resGuests, forKey: "ResGuests")
		}
		if roomStays != nil{
			aCoder.encode(roomStays, forKey: "RoomStays")
		}
		if tPAExtensions != nil{
			aCoder.encode(tPAExtensions, forKey: "TPA_Extensions")
		}
		if uniqueID != nil{
			aCoder.encode(uniqueID, forKey: "UniqueID")
		}
		if hotelReservation != nil{
			aCoder.encode(hotelReservation, forKey: "HotelReservation")
		}

	}

}
