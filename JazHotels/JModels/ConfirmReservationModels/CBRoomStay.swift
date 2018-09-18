//
//	CBRoomStay.swift
//
//	Create by Nada Gamal on 18/9/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class CBRoomStay : NSObject, NSCoding{

	var basicPropertyInfo : CBBasicPropertyInfo!
	var cancelPenalties : CBCancelPenalty!
	var guarantee : CBGuarantee!
	var guestCounts : CBGuestCount!
	var ratePlans : CBRatePlan!
	var roomRates : CBRoomRate!
	var roomTypes : CBRoomType!
	var timeSpan : CBTimeSpan!
	var total : CBTotal!
	var sourceOfBusiness : String!
	var roomStay : CBRoomStay!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		if let basicPropertyInfoData = dictionary["BasicPropertyInfo"] as? [String:Any]{
			basicPropertyInfo = CBBasicPropertyInfo(fromDictionary: basicPropertyInfoData)
		}
		if let cancelPenaltiesData = dictionary["CancelPenalties"] as? [String:Any]{
			cancelPenalties = CBCancelPenalty(fromDictionary: cancelPenaltiesData)
		}
		if let guaranteeData = dictionary["Guarantee"] as? [String:Any]{
			guarantee = CBGuarantee(fromDictionary: guaranteeData)
		}
		if let guestCountsData = dictionary["GuestCounts"] as? [String:Any]{
			guestCounts = CBGuestCount(fromDictionary: guestCountsData)
		}
		if let ratePlansData = dictionary["RatePlans"] as? [String:Any]{
			ratePlans = CBRatePlan(fromDictionary: ratePlansData)
		}
		if let roomRatesData = dictionary["RoomRates"] as? [String:Any]{
			roomRates = CBRoomRate(fromDictionary: roomRatesData)
		}
		if let roomTypesData = dictionary["RoomTypes"] as? [String:Any]{
			roomTypes = CBRoomType(fromDictionary: roomTypesData)
		}
		if let timeSpanData = dictionary["TimeSpan"] as? [String:Any]{
			timeSpan = CBTimeSpan(fromDictionary: timeSpanData)
		}
		if let totalData = dictionary["Total"] as? [String:Any]{
			total = CBTotal(fromDictionary: totalData)
		}
		sourceOfBusiness = dictionary["_SourceOfBusiness"] as? String
		if let roomStayData = dictionary["RoomStay"] as? [String:Any]{
			roomStay = CBRoomStay(fromDictionary: roomStayData)
		}
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if basicPropertyInfo != nil{
			dictionary["BasicPropertyInfo"] = basicPropertyInfo.toDictionary()
		}
		if cancelPenalties != nil{
			dictionary["CancelPenalties"] = cancelPenalties.toDictionary()
		}
		if guarantee != nil{
			dictionary["Guarantee"] = guarantee.toDictionary()
		}
		if guestCounts != nil{
			dictionary["GuestCounts"] = guestCounts.toDictionary()
		}
		if ratePlans != nil{
			dictionary["RatePlans"] = ratePlans.toDictionary()
		}
		if roomRates != nil{
			dictionary["RoomRates"] = roomRates.toDictionary()
		}
		if roomTypes != nil{
			dictionary["RoomTypes"] = roomTypes.toDictionary()
		}
		if timeSpan != nil{
			dictionary["TimeSpan"] = timeSpan.toDictionary()
		}
		if total != nil{
			dictionary["Total"] = total.toDictionary()
		}
		if sourceOfBusiness != nil{
			dictionary["_SourceOfBusiness"] = sourceOfBusiness
		}
		if roomStay != nil{
			dictionary["RoomStay"] = roomStay.toDictionary()
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         basicPropertyInfo = aDecoder.decodeObject(forKey: "BasicPropertyInfo") as? CBBasicPropertyInfo
         cancelPenalties = aDecoder.decodeObject(forKey: "CancelPenalties") as? CBCancelPenalty
         guarantee = aDecoder.decodeObject(forKey: "Guarantee") as? CBGuarantee
         guestCounts = aDecoder.decodeObject(forKey: "GuestCounts") as? CBGuestCount
         ratePlans = aDecoder.decodeObject(forKey: "RatePlans") as? CBRatePlan
         roomRates = aDecoder.decodeObject(forKey: "RoomRates") as? CBRoomRate
         roomTypes = aDecoder.decodeObject(forKey: "RoomTypes") as? CBRoomType
         timeSpan = aDecoder.decodeObject(forKey: "TimeSpan") as? CBTimeSpan
         total = aDecoder.decodeObject(forKey: "Total") as? CBTotal
         sourceOfBusiness = aDecoder.decodeObject(forKey: "_SourceOfBusiness") as? String
         roomStay = aDecoder.decodeObject(forKey: "RoomStay") as? CBRoomStay

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if basicPropertyInfo != nil{
			aCoder.encode(basicPropertyInfo, forKey: "BasicPropertyInfo")
		}
		if cancelPenalties != nil{
			aCoder.encode(cancelPenalties, forKey: "CancelPenalties")
		}
		if guarantee != nil{
			aCoder.encode(guarantee, forKey: "Guarantee")
		}
		if guestCounts != nil{
			aCoder.encode(guestCounts, forKey: "GuestCounts")
		}
		if ratePlans != nil{
			aCoder.encode(ratePlans, forKey: "RatePlans")
		}
		if roomRates != nil{
			aCoder.encode(roomRates, forKey: "RoomRates")
		}
		if roomTypes != nil{
			aCoder.encode(roomTypes, forKey: "RoomTypes")
		}
		if timeSpan != nil{
			aCoder.encode(timeSpan, forKey: "TimeSpan")
		}
		if total != nil{
			aCoder.encode(total, forKey: "Total")
		}
		if sourceOfBusiness != nil{
			aCoder.encode(sourceOfBusiness, forKey: "_SourceOfBusiness")
		}
		if roomStay != nil{
			aCoder.encode(roomStay, forKey: "RoomStay")
		}

	}

}