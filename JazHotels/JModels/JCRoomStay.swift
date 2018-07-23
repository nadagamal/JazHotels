//
//	JCRoomStay.swift
//
//	Create by Nada Gamal on 1/7/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

class JCRoomStay{

	var basicPropertyInfo : JCBasicPropertyInfo!
	var ratePlans : JCRatePlan!
	var roomRates : JCRoomRate!
	var roomTypes : JCRoomType!
	var roomStay : JCRoomStay!
    var roomStays : [JCRoomStay]!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		if let basicPropertyInfoData = dictionary["BasicPropertyInfo"] as? [String:Any]{
			basicPropertyInfo = JCBasicPropertyInfo(fromDictionary: basicPropertyInfoData)
		}
		if let ratePlansData = dictionary["RatePlans"] as? [String:Any]{
			ratePlans = JCRatePlan(fromDictionary: ratePlansData)
		}
		if let roomRatesData = dictionary["RoomRates"] as? [String:Any]{
			roomRates = JCRoomRate(fromDictionary: roomRatesData)
		}
		if let roomTypesData = dictionary["RoomTypes"] as? [String:Any]{
			roomTypes = JCRoomType(fromDictionary: roomTypesData)
		}
		if let roomStayData = dictionary["RoomStay"] as? [String:Any]{
			roomStay = JCRoomStay(fromDictionary: roomStayData)
		}
        roomStays = [JCRoomStay]()
        if let roomStayData = dictionary["RoomStay"] as? [[String : Any]]{
            for room in roomStayData {
                if room != nil{
                roomStays.append(JCRoomStay(fromDictionary: room as! [String : Any]))
                }
            }
        }
	}

}
