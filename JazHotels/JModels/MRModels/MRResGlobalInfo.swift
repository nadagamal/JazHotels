//
//	MRResGlobalInfo.swift
//
//	Create by Nada Gamal on 22/9/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class MRResGlobalInfo : NSObject, NSCoding{

	var HotelReservationIDs : MRHotelReservationID!
	var Total : MRTotal!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		if let HotelReservationIDsData = dictionary["HotelReservationIDs"] as? [String:Any]{
			HotelReservationIDs = MRHotelReservationID(fromDictionary: HotelReservationIDsData)
		}
		if let TotalData = dictionary["Total"] as? [String:Any]{
			Total = MRTotal(fromDictionary: TotalData)
		}
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if HotelReservationIDs != nil{
			dictionary["HotelReservationIDs"] = HotelReservationIDs.toDictionary()
		}
		if Total != nil{
			dictionary["Total"] = Total.toDictionary()
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         HotelReservationIDs = aDecoder.decodeObject(forKey: "HotelReservationIDs") as? MRHotelReservationID
         Total = aDecoder.decodeObject(forKey: "Total") as? MRTotal

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if HotelReservationIDs != nil{
			aCoder.encode(HotelReservationIDs, forKey: "HotelReservationIDs")
		}
		if Total != nil{
			aCoder.encode(Total, forKey: "Total")
		}

	}

}