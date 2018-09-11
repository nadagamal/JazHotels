//
//	JBRoomStay.swift
//
//	Create by Nada Gamal on 9/9/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

class JBRoomStay{

	var basicPropertyInfo : JBBasicPropertyInfo!
	var cancelPenalties : JBCancelPenalty!
	var guarantee : JBGuarantee!
	var guestCounts : JBGuestCount!
	var ratePlans : [JCRatePlan]!
	var roomRates : JBRoomRate!
	var roomTypes : JBRoomType!
	var timeSpan : JBTimeSpan!
	var total : JBTotal!
	var sourceOfBusiness : String!
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
//        if let ratePlansData = dictionary["RatePlans"] as? [String:Any]{
//            ratePlans = JBRatePlan(fromDictionary: ratePlansData)
//        }
        ratePlans = [JCRatePlan]()
        if let ratePlanArray = dictionary["RatePlans"] as? [[String:Any]]{
            for dic in ratePlanArray{
                let value = JCRatePlan(fromDictionary: dic)
                ratePlans.append(value)
            }
        }
		if let roomRatesData = dictionary["RoomRates"] as? [String:Any]{
			roomRates = JBRoomRate(fromDictionary: roomRatesData)
		}
		if let roomTypesData = dictionary["RoomTypes"] as? [String:Any]{
			roomTypes = JBRoomType(fromDictionary: roomTypesData)
		}
		if let timeSpanData = dictionary["TimeSpan"] as? [String:Any]{
			timeSpan = JBTimeSpan(fromDictionary: timeSpanData)
		}
		if let totalData = dictionary["Total"] as? [String:Any]{
			total = JBTotal(fromDictionary: totalData)
		}
		sourceOfBusiness = dictionary["_SourceOfBusiness"] as? String
		if let roomStayData = dictionary["RoomStay"] as? [String:Any]{
			roomStay = JBRoomStay(fromDictionary: roomStayData)
		}
	}

}
