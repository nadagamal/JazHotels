//
//	JBRoomStay.swift
//
//	Create by Nada Gamal on 9/9/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class JBRoomStay : NSObject, NSCoding{

	var basicPropertyInfo : JBBasicPropertyInfo!
	var cancelPenalties : JBCancelPenalty!
	var guarantee : JBGuarantee!
	var guestCounts : JBGuestCount!
	var ratePlans : JBRatePlan!
	var roomRates : JBRoomRate!
	var roomTypes : JBRoomType!
	var sourceOfBusiness : String!
	var timeSpan : JBTimeSpan!
	var total : JBTotal!
	var roomStay : JBRoomStay!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		if let basicPropertyInfoData = dictionary["BasicPropertyInfo"] as? [String:Any]{
			basicPropertyInfo = JBBasicPropertyInfo(fromDictionary: basicPropertyInfoData)
		}
		if let cancelPenaltiesData = dictionary["CancelPenalties"] as? [String:Any]{
			cancelPenalties = JBCancelPenalty(fromDictionary: cancelPenaltiesData)
		}
		if let guaranteeData = dictionary["Guarantee"] as? [String:Any]{
			guarantee = JBGuarantee(fromDictionary: guaranteeData)
		}
		if let guestCountsData = dictionary["GuestCounts"] as? [String:Any]{
			guestCounts = JBGuestCount(fromDictionary: guestCountsData)
		}
		if let ratePlansData = dictionary["RatePlans"] as? [String:Any]{
			ratePlans = JBRatePlan(fromDictionary: ratePlansData)
		}
		if let roomRatesData = dictionary["RoomRates"] as? [String:Any]{
			roomRates = JBRoomRate(fromDictionary: roomRatesData)
		}
		if let roomTypesData = dictionary["RoomTypes"] as? [String:Any]{
			roomTypes = JBRoomType(fromDictionary: roomTypesData)
		}
		sourceOfBusiness = dictionary["SourceOfBusiness"] as? String
		if let timeSpanData = dictionary["TimeSpan"] as? [String:Any]{
			timeSpan = JBTimeSpan(fromDictionary: timeSpanData)
		}
		if let totalData = dictionary["Total"] as? [String:Any]{
			total = JBTotal(fromDictionary: totalData)
		}
		if let roomStayData = dictionary["RoomStay"] as? [String:Any]{
			roomStay = JBRoomStay(fromDictionary: roomStayData)
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
		if sourceOfBusiness != nil{
			dictionary["SourceOfBusiness"] = sourceOfBusiness
		}
		if timeSpan != nil{
			dictionary["TimeSpan"] = timeSpan.toDictionary()
		}
		if total != nil{
			dictionary["Total"] = total.toDictionary()
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
         basicPropertyInfo = aDecoder.decodeObject(forKey: "BasicPropertyInfo") as? JBBasicPropertyInfo
         cancelPenalties = aDecoder.decodeObject(forKey: "CancelPenalties") as? JBCancelPenalty
         guarantee = aDecoder.decodeObject(forKey: "Guarantee") as? JBGuarantee
         guestCounts = aDecoder.decodeObject(forKey: "GuestCounts") as? JBGuestCount
         ratePlans = aDecoder.decodeObject(forKey: "RatePlans") as? JBRatePlan
         roomRates = aDecoder.decodeObject(forKey: "RoomRates") as? JBRoomRate
         roomTypes = aDecoder.decodeObject(forKey: "RoomTypes") as? JBRoomType
         sourceOfBusiness = aDecoder.decodeObject(forKey: "SourceOfBusiness") as? String
         timeSpan = aDecoder.decodeObject(forKey: "TimeSpan") as? JBTimeSpan
         total = aDecoder.decodeObject(forKey: "Total") as? JBTotal
         roomStay = aDecoder.decodeObject(forKey: "RoomStay") as? JBRoomStay

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
		if sourceOfBusiness != nil{
			aCoder.encode(sourceOfBusiness, forKey: "SourceOfBusiness")
		}
		if timeSpan != nil{
			aCoder.encode(timeSpan, forKey: "TimeSpan")
		}
		if total != nil{
			aCoder.encode(total, forKey: "Total")
		}
		if roomStay != nil{
			aCoder.encode(roomStay, forKey: "RoomStay")
		}

	}

}