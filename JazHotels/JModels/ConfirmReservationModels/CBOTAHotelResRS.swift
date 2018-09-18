//
//	CBOTAHotelResRS.swift
//
//	Create by Nada Gamal on 18/9/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class CBOTAHotelResRS : NSObject, NSCoding{

	var hotelReservations : CBHotelReservation!
	var success : AnyObject!
	var echoToken : String!
	var primaryLangID : String!
	var resResponseType : String!
	var timeStamp : String!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		if let hotelReservationsData = dictionary["HotelReservations"] as? [String:Any]{
			hotelReservations = CBHotelReservation(fromDictionary: hotelReservationsData)
		}
		success = dictionary["Success"] as? AnyObject
		echoToken = dictionary["_EchoToken"] as? String
		primaryLangID = dictionary["_PrimaryLangID"] as? String
		resResponseType = dictionary["_ResResponseType"] as? String
		timeStamp = dictionary["_TimeStamp"] as? String
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if hotelReservations != nil{
			dictionary["HotelReservations"] = hotelReservations.toDictionary()
		}
		if success != nil{
			dictionary["Success"] = success
		}
		if echoToken != nil{
			dictionary["_EchoToken"] = echoToken
		}
		if primaryLangID != nil{
			dictionary["_PrimaryLangID"] = primaryLangID
		}
		if resResponseType != nil{
			dictionary["_ResResponseType"] = resResponseType
		}
		if timeStamp != nil{
			dictionary["_TimeStamp"] = timeStamp
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         hotelReservations = aDecoder.decodeObject(forKey: "HotelReservations") as? CBHotelReservation
         success = aDecoder.decodeObject(forKey: "Success") as? AnyObject
         echoToken = aDecoder.decodeObject(forKey: "_EchoToken") as? String
         primaryLangID = aDecoder.decodeObject(forKey: "_PrimaryLangID") as? String
         resResponseType = aDecoder.decodeObject(forKey: "_ResResponseType") as? String
         timeStamp = aDecoder.decodeObject(forKey: "_TimeStamp") as? String

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if hotelReservations != nil{
			aCoder.encode(hotelReservations, forKey: "HotelReservations")
		}
		if success != nil{
			aCoder.encode(success, forKey: "Success")
		}
		if echoToken != nil{
			aCoder.encode(echoToken, forKey: "_EchoToken")
		}
		if primaryLangID != nil{
			aCoder.encode(primaryLangID, forKey: "_PrimaryLangID")
		}
		if resResponseType != nil{
			aCoder.encode(resResponseType, forKey: "_ResResponseType")
		}
		if timeStamp != nil{
			aCoder.encode(timeStamp, forKey: "_TimeStamp")
		}

	}

}