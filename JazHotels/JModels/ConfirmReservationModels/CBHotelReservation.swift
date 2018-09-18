//
//	CBHotelReservation.swift
//
//	Create by Nada Gamal on 18/9/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class CBHotelReservation : NSObject, NSCoding{

	var pOS : CBPOS!
	var resGlobalInfo : CBResGlobalInfo!
	var resGuests : CBResGuest!
	var roomStays : CBRoomStay!
	var tPAExtensions : JBTpaExtension!
	var uniqueID : CBUniqueID!
	var createDateTime : String!
	var creatorID : String!
	var lastModifierID : String!
	var lastModifyDateTime : String!
	var hotelReservation : CBHotelReservation!
    var errors : CBError!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		if let pOSData = dictionary["POS"] as? [String:Any]{
			pOS = CBPOS(fromDictionary: pOSData)
		}
		if let resGlobalInfoData = dictionary["ResGlobalInfo"] as? [String:Any]{
			resGlobalInfo = CBResGlobalInfo(fromDictionary: resGlobalInfoData)
		}
		if let resGuestsData = dictionary["ResGuests"] as? [String:Any]{
			resGuests = CBResGuest(fromDictionary: resGuestsData)
		}
		if let roomStaysData = dictionary["RoomStays"] as? [String:Any]{
			roomStays = CBRoomStay(fromDictionary: roomStaysData)
		}
		if let tPAExtensionsData = dictionary["TPA_Extensions"] as? [String:Any]{
			tPAExtensions = JBTpaExtension(fromDictionary: tPAExtensionsData)
		}
		if let uniqueIDData = dictionary["UniqueID"] as? [String:Any]{
			uniqueID = CBUniqueID(fromDictionary: uniqueIDData)
		}
		createDateTime = dictionary["_CreateDateTime"] as? String
		creatorID = dictionary["_CreatorID"] as? String
		lastModifierID = dictionary["_LastModifierID"] as? String
		lastModifyDateTime = dictionary["_LastModifyDateTime"] as? String
		if let hotelReservationData = dictionary["HotelReservation"] as? [String:Any]{
			hotelReservation = CBHotelReservation(fromDictionary: hotelReservationData)
		}
        if let errorsData = dictionary["Errors"] as? [String:Any]{
            errors = CBError(fromDictionary: errorsData)
        }
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
        if errors != nil{
            dictionary["Errors"] = errors.toDictionary()
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
	
		if uniqueID != nil{
			dictionary["UniqueID"] = uniqueID.toDictionary()
		}
		if createDateTime != nil{
			dictionary["_CreateDateTime"] = createDateTime
		}
		if creatorID != nil{
			dictionary["_CreatorID"] = creatorID
		}
		if lastModifierID != nil{
			dictionary["_LastModifierID"] = lastModifierID
		}
		if lastModifyDateTime != nil{
			dictionary["_LastModifyDateTime"] = lastModifyDateTime
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
         pOS = aDecoder.decodeObject(forKey: "POS") as? CBPOS
         resGlobalInfo = aDecoder.decodeObject(forKey: "ResGlobalInfo") as? CBResGlobalInfo
         resGuests = aDecoder.decodeObject(forKey: "ResGuests") as? CBResGuest
         roomStays = aDecoder.decodeObject(forKey: "RoomStays") as? CBRoomStay
         tPAExtensions = aDecoder.decodeObject(forKey: "TPA_Extensions") as? JBTpaExtension
         uniqueID = aDecoder.decodeObject(forKey: "UniqueID") as? CBUniqueID
         createDateTime = aDecoder.decodeObject(forKey: "_CreateDateTime") as? String
         creatorID = aDecoder.decodeObject(forKey: "_CreatorID") as? String
         lastModifierID = aDecoder.decodeObject(forKey: "_LastModifierID") as? String
         lastModifyDateTime = aDecoder.decodeObject(forKey: "_LastModifyDateTime") as? String
         hotelReservation = aDecoder.decodeObject(forKey: "HotelReservation") as? CBHotelReservation

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
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
		if createDateTime != nil{
			aCoder.encode(createDateTime, forKey: "_CreateDateTime")
		}
		if creatorID != nil{
			aCoder.encode(creatorID, forKey: "_CreatorID")
		}
		if lastModifierID != nil{
			aCoder.encode(lastModifierID, forKey: "_LastModifierID")
		}
		if lastModifyDateTime != nil{
			aCoder.encode(lastModifyDateTime, forKey: "_LastModifyDateTime")
		}
		if hotelReservation != nil{
			aCoder.encode(hotelReservation, forKey: "HotelReservation")
		}

	}

}
