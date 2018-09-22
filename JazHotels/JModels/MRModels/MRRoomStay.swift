//
//	MRRoomStay.swift
//
//	Create by Nada Gamal on 22/9/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class MRRoomStay : NSObject, NSCoding{

	var BasicPropertyInfo : MRBasicPropertyInfo!
	var CancelPenalties : MRCancelPenalty!
	var Guarantee : MRGuarantee!
	var GuestCounts : MRGuestCount!
	var RatePlans : MRRatePlan!
	var RoomRates : MRRoomRate!
	var RoomTypes : MRRoomType!
	var TimeSpan : MRTimeSpan!
	var Total : MRTotal!
	var SourceOfBusiness : String!
	var RoomStay : MRRoomStay!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		if let BasicPropertyInfoData = dictionary["BasicPropertyInfo"] as? [String:Any]{
			BasicPropertyInfo = MRBasicPropertyInfo(fromDictionary: BasicPropertyInfoData)
		}
		if let CancelPenaltiesData = dictionary["CancelPenalties"] as? [String:Any]{
			CancelPenalties = MRCancelPenalty(fromDictionary: CancelPenaltiesData)
		}
		if let GuaranteeData = dictionary["Guarantee"] as? [String:Any]{
			Guarantee = MRGuarantee(fromDictionary: GuaranteeData)
		}
		if let GuestCountsData = dictionary["GuestCounts"] as? [String:Any]{
			GuestCounts = MRGuestCount(fromDictionary: GuestCountsData)
		}
		if let RatePlansData = dictionary["RatePlans"] as? [String:Any]{
			RatePlans = MRRatePlan(fromDictionary: RatePlansData)
		}
		if let RoomRatesData = dictionary["RoomRates"] as? [String:Any]{
			RoomRates = MRRoomRate(fromDictionary: RoomRatesData)
		}
		if let RoomTypesData = dictionary["RoomTypes"] as? [String:Any]{
			RoomTypes = MRRoomType(fromDictionary: RoomTypesData)
		}
		if let TimeSpanData = dictionary["TimeSpan"] as? [String:Any]{
			TimeSpan = MRTimeSpan(fromDictionary: TimeSpanData)
		}
		if let TotalData = dictionary["Total"] as? [String:Any]{
			Total = MRTotal(fromDictionary: TotalData)
		}
		SourceOfBusiness = dictionary["_SourceOfBusiness"] as? String
		if let RoomStayData = dictionary["RoomStay"] as? [String:Any]{
			RoomStay = MRRoomStay(fromDictionary: RoomStayData)
		}
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if BasicPropertyInfo != nil{
			dictionary["BasicPropertyInfo"] = BasicPropertyInfo.toDictionary()
		}
		if CancelPenalties != nil{
			dictionary["CancelPenalties"] = CancelPenalties.toDictionary()
		}
		if Guarantee != nil{
			dictionary["Guarantee"] = Guarantee.toDictionary()
		}
		if GuestCounts != nil{
			dictionary["GuestCounts"] = GuestCounts.toDictionary()
		}
		if RatePlans != nil{
			dictionary["RatePlans"] = RatePlans.toDictionary()
		}
		if RoomRates != nil{
			dictionary["RoomRates"] = RoomRates.toDictionary()
		}
		if RoomTypes != nil{
			dictionary["RoomTypes"] = RoomTypes.toDictionary()
		}
		if TimeSpan != nil{
			dictionary["TimeSpan"] = TimeSpan.toDictionary()
		}
		if Total != nil{
			dictionary["Total"] = Total.toDictionary()
		}
		if SourceOfBusiness != nil{
			dictionary["_SourceOfBusiness"] = SourceOfBusiness
		}
		if RoomStay != nil{
			dictionary["RoomStay"] = RoomStay.toDictionary()
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         BasicPropertyInfo = aDecoder.decodeObject(forKey: "BasicPropertyInfo") as? MRBasicPropertyInfo
         CancelPenalties = aDecoder.decodeObject(forKey: "CancelPenalties") as? MRCancelPenalty
         Guarantee = aDecoder.decodeObject(forKey: "Guarantee") as? MRGuarantee
         GuestCounts = aDecoder.decodeObject(forKey: "GuestCounts") as? MRGuestCount
         RatePlans = aDecoder.decodeObject(forKey: "RatePlans") as? MRRatePlan
         RoomRates = aDecoder.decodeObject(forKey: "RoomRates") as? MRRoomRate
         RoomTypes = aDecoder.decodeObject(forKey: "RoomTypes") as? MRRoomType
         TimeSpan = aDecoder.decodeObject(forKey: "TimeSpan") as? MRTimeSpan
         Total = aDecoder.decodeObject(forKey: "Total") as? MRTotal
         SourceOfBusiness = aDecoder.decodeObject(forKey: "_SourceOfBusiness") as? String
         RoomStay = aDecoder.decodeObject(forKey: "RoomStay") as? MRRoomStay

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if BasicPropertyInfo != nil{
			aCoder.encode(BasicPropertyInfo, forKey: "BasicPropertyInfo")
		}
		if CancelPenalties != nil{
			aCoder.encode(CancelPenalties, forKey: "CancelPenalties")
		}
		if Guarantee != nil{
			aCoder.encode(Guarantee, forKey: "Guarantee")
		}
		if GuestCounts != nil{
			aCoder.encode(GuestCounts, forKey: "GuestCounts")
		}
		if RatePlans != nil{
			aCoder.encode(RatePlans, forKey: "RatePlans")
		}
		if RoomRates != nil{
			aCoder.encode(RoomRates, forKey: "RoomRates")
		}
		if RoomTypes != nil{
			aCoder.encode(RoomTypes, forKey: "RoomTypes")
		}
		if TimeSpan != nil{
			aCoder.encode(TimeSpan, forKey: "TimeSpan")
		}
		if Total != nil{
			aCoder.encode(Total, forKey: "Total")
		}
		if SourceOfBusiness != nil{
			aCoder.encode(SourceOfBusiness, forKey: "_SourceOfBusiness")
		}
		if RoomStay != nil{
			aCoder.encode(RoomStay, forKey: "RoomStay")
		}

	}

}