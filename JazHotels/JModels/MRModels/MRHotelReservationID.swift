//
//	MRHotelReservationID.swift
//
//	Create by Nada Gamal on 22/9/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class MRHotelReservationID : NSObject, NSCoding{

	var ResIDDate : String!
	var ResIDSource : String!
	var ResIDSourceContext : String!
	var ResIDType : String!
	var ResIDValue : String!
	var HotelReservationID : [MRHotelReservationID]!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		ResIDDate = dictionary["_ResID_Date"] as? String
		ResIDSource = dictionary["_ResID_Source"] as? String
		ResIDSourceContext = dictionary["_ResID_SourceContext"] as? String
		ResIDType = dictionary["_ResID_Type"] as? String
		ResIDValue = dictionary["_ResID_Value"] as? String
		HotelReservationID = [MRHotelReservationID]()
		if let HotelReservationIDArray = dictionary["HotelReservationID"] as? [[String:Any]]{
			for dic in HotelReservationIDArray{
				let value = MRHotelReservationID(fromDictionary: dic)
				HotelReservationID.append(value)
			}
		}
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if ResIDDate != nil{
			dictionary["_ResID_Date"] = ResIDDate
		}
		if ResIDSource != nil{
			dictionary["_ResID_Source"] = ResIDSource
		}
		if ResIDSourceContext != nil{
			dictionary["_ResID_SourceContext"] = ResIDSourceContext
		}
		if ResIDType != nil{
			dictionary["_ResID_Type"] = ResIDType
		}
		if ResIDValue != nil{
			dictionary["_ResID_Value"] = ResIDValue
		}
		if HotelReservationID != nil{
			var dictionaryElements = [[String:Any]]()
			for HotelReservationIDElement in HotelReservationID {
				dictionaryElements.append(HotelReservationIDElement.toDictionary())
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
         ResIDDate = aDecoder.decodeObject(forKey: "_ResID_Date") as? String
         ResIDSource = aDecoder.decodeObject(forKey: "_ResID_Source") as? String
         ResIDSourceContext = aDecoder.decodeObject(forKey: "_ResID_SourceContext") as? String
         ResIDType = aDecoder.decodeObject(forKey: "_ResID_Type") as? String
         ResIDValue = aDecoder.decodeObject(forKey: "_ResID_Value") as? String
         HotelReservationID = aDecoder.decodeObject(forKey :"HotelReservationID") as? [MRHotelReservationID]

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if ResIDDate != nil{
			aCoder.encode(ResIDDate, forKey: "_ResID_Date")
		}
		if ResIDSource != nil{
			aCoder.encode(ResIDSource, forKey: "_ResID_Source")
		}
		if ResIDSourceContext != nil{
			aCoder.encode(ResIDSourceContext, forKey: "_ResID_SourceContext")
		}
		if ResIDType != nil{
			aCoder.encode(ResIDType, forKey: "_ResID_Type")
		}
		if ResIDValue != nil{
			aCoder.encode(ResIDValue, forKey: "_ResID_Value")
		}
		if HotelReservationID != nil{
			aCoder.encode(HotelReservationID, forKey: "HotelReservationID")
		}

	}

}