//
//	CBResGlobalInfo.swift
//
//	Create by Nada Gamal on 18/9/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class CBResGlobalInfo : NSObject, NSCoding{

	var guarantee : CBGuarantee!
	var hotelReservationIDs : CBHotelReservationID!
	var total : CBTotal!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		if let guaranteeData = dictionary["Guarantee"] as? [String:Any]{
			guarantee = CBGuarantee(fromDictionary: guaranteeData)
		}
		if let hotelReservationIDsData = dictionary["HotelReservationIDs"] as? [String:Any]{
			hotelReservationIDs = CBHotelReservationID(fromDictionary: hotelReservationIDsData)
		}
		if let totalData = dictionary["Total"] as? [String:Any]{
			total = CBTotal(fromDictionary: totalData)
		}
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if guarantee != nil{
			dictionary["Guarantee"] = guarantee.toDictionary()
		}
		if hotelReservationIDs != nil{
			dictionary["HotelReservationIDs"] = hotelReservationIDs.toDictionary()
		}
		if total != nil{
			dictionary["Total"] = total.toDictionary()
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         guarantee = aDecoder.decodeObject(forKey: "Guarantee") as? CBGuarantee
         hotelReservationIDs = aDecoder.decodeObject(forKey: "HotelReservationIDs") as? CBHotelReservationID
         total = aDecoder.decodeObject(forKey: "Total") as? CBTotal

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if guarantee != nil{
			aCoder.encode(guarantee, forKey: "Guarantee")
		}
		if hotelReservationIDs != nil{
			aCoder.encode(hotelReservationIDs, forKey: "HotelReservationIDs")
		}
		if total != nil{
			aCoder.encode(total, forKey: "Total")
		}

	}

}