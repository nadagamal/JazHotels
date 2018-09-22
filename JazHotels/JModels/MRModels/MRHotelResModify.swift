//
//	MRHotelResModify.swift
//
//	Create by Nada Gamal on 22/9/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class MRHotelResModify : NSObject, NSCoding{

	var POS : MRPOS!
	var ResGlobalInfo : MRResGlobalInfo!
	var ResGuests : MRResGuest!
	var RoomStays : MRRoomStay!
	var TPAExtensions : MRTPAExtension!
	var UniqueID : MRUniqueID!
	var HotelResModify : MRHotelResModify!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		if let POSData = dictionary["POS"] as? [String:Any]{
			POS = MRPOS(fromDictionary: POSData)
		}
		if let ResGlobalInfoData = dictionary["ResGlobalInfo"] as? [String:Any]{
			ResGlobalInfo = MRResGlobalInfo(fromDictionary: ResGlobalInfoData)
		}
		if let ResGuestsData = dictionary["ResGuests"] as? [String:Any]{
			ResGuests = MRResGuest(fromDictionary: ResGuestsData)
		}
		if let RoomStaysData = dictionary["RoomStays"] as? [String:Any]{
			RoomStays = MRRoomStay(fromDictionary: RoomStaysData)
		}
		if let TPAExtensionsData = dictionary["TPA_Extensions"] as? [String:Any]{
			TPAExtensions = MRTPAExtension(fromDictionary: TPAExtensionsData)
		}
		if let UniqueIDData = dictionary["UniqueID"] as? [String:Any]{
			UniqueID = MRUniqueID(fromDictionary: UniqueIDData)
		}
		if let HotelResModifyData = dictionary["HotelResModify"] as? [String:Any]{
			HotelResModify = MRHotelResModify(fromDictionary: HotelResModifyData)
		}
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if POS != nil{
			dictionary["POS"] = POS.toDictionary()
		}
		if ResGlobalInfo != nil{
			dictionary["ResGlobalInfo"] = ResGlobalInfo.toDictionary()
		}
		if ResGuests != nil{
			dictionary["ResGuests"] = ResGuests.toDictionary()
		}
		if RoomStays != nil{
			dictionary["RoomStays"] = RoomStays.toDictionary()
		}
		if TPAExtensions != nil{
			dictionary["TPA_Extensions"] = TPAExtensions.toDictionary()
		}
		if UniqueID != nil{
			dictionary["UniqueID"] = UniqueID.toDictionary()
		}
		if HotelResModify != nil{
			dictionary["HotelResModify"] = HotelResModify.toDictionary()
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         POS = aDecoder.decodeObject(forKey: "POS") as? MRPOS
         ResGlobalInfo = aDecoder.decodeObject(forKey: "ResGlobalInfo") as? MRResGlobalInfo
         ResGuests = aDecoder.decodeObject(forKey: "ResGuests") as? MRResGuest
         RoomStays = aDecoder.decodeObject(forKey: "RoomStays") as? MRRoomStay
         TPAExtensions = aDecoder.decodeObject(forKey: "TPA_Extensions") as? MRTPAExtension
         UniqueID = aDecoder.decodeObject(forKey: "UniqueID") as? MRUniqueID
         HotelResModify = aDecoder.decodeObject(forKey: "HotelResModify") as? MRHotelResModify

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if POS != nil{
			aCoder.encode(POS, forKey: "POS")
		}
		if ResGlobalInfo != nil{
			aCoder.encode(ResGlobalInfo, forKey: "ResGlobalInfo")
		}
		if ResGuests != nil{
			aCoder.encode(ResGuests, forKey: "ResGuests")
		}
		if RoomStays != nil{
			aCoder.encode(RoomStays, forKey: "RoomStays")
		}
		if TPAExtensions != nil{
			aCoder.encode(TPAExtensions, forKey: "TPA_Extensions")
		}
		if UniqueID != nil{
			aCoder.encode(UniqueID, forKey: "UniqueID")
		}
		if HotelResModify != nil{
			aCoder.encode(HotelResModify, forKey: "HotelResModify")
		}

	}

}