//
//	JBHotelReservationID.swift
//
//	Create by Nada Gamal on 9/9/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class JBHotelReservationID : NSObject, NSCoding{

	var resIDDate : String!
	var resIDSource : String!
	var resIDSourceContext : String!
	var resIDType : String!
	var resIDValue : String!
	var hotelReservationID : [JBHotelReservationID]!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		resIDDate = dictionary["ResID_Date"] as? String
		resIDSource = dictionary["ResID_Source"] as? String
		resIDSourceContext = dictionary["ResID_SourceContext"] as? String
		resIDType = dictionary["ResID_Type"] as? String
		resIDValue = dictionary["ResID_Value"] as? String
		hotelReservationID = [JBHotelReservationID]()
		if let hotelReservationIDArray = dictionary["HotelReservationID"] as? [[String:Any]]{
			for dic in hotelReservationIDArray{
				let value = JBHotelReservationID(fromDictionary: dic)
				hotelReservationID.append(value)
			}
		}
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if resIDDate != nil{
			dictionary["ResID_Date"] = resIDDate
		}
		if resIDSource != nil{
			dictionary["ResID_Source"] = resIDSource
		}
		if resIDSourceContext != nil{
			dictionary["ResID_SourceContext"] = resIDSourceContext
		}
		if resIDType != nil{
			dictionary["ResID_Type"] = resIDType
		}
		if resIDValue != nil{
			dictionary["ResID_Value"] = resIDValue
		}
		if hotelReservationID != nil{
			var dictionaryElements = [[String:Any]]()
			for hotelReservationIDElement in hotelReservationID {
				dictionaryElements.append(hotelReservationIDElement.toDictionary())
			}
			dictionary["HotelReservationID"] = dictionaryElements
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         resIDDate = aDecoder.decodeObject(forKey: "ResID_Date") as? String
         resIDSource = aDecoder.decodeObject(forKey: "ResID_Source") as? String
         resIDSourceContext = aDecoder.decodeObject(forKey: "ResID_SourceContext") as? String
         resIDType = aDecoder.decodeObject(forKey: "ResID_Type") as? String
         resIDValue = aDecoder.decodeObject(forKey: "ResID_Value") as? String
         hotelReservationID = aDecoder.decodeObject(forKey :"HotelReservationID") as? [JBHotelReservationID]

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if resIDDate != nil{
			aCoder.encode(resIDDate, forKey: "ResID_Date")
		}
		if resIDSource != nil{
			aCoder.encode(resIDSource, forKey: "ResID_Source")
		}
		if resIDSourceContext != nil{
			aCoder.encode(resIDSourceContext, forKey: "ResID_SourceContext")
		}
		if resIDType != nil{
			aCoder.encode(resIDType, forKey: "ResID_Type")
		}
		if resIDValue != nil{
			aCoder.encode(resIDValue, forKey: "ResID_Value")
		}
		if hotelReservationID != nil{
			aCoder.encode(hotelReservationID, forKey: "HotelReservationID")
		}

	}

}