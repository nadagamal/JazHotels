//
//	JBOTAHotelResRS.swift
//
//	Create by Nada Gamal on 9/9/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class JBOTAHotelResRS : NSObject, NSCoding{

	var echoToken : String!
	var hotelReservations : JBHotelReservation!
	var primaryLangID : String!
	var timeStamp : String!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		echoToken = dictionary["EchoToken"] as? String
		if let hotelReservationsData = dictionary["HotelReservations"] as? [String:Any]{
			hotelReservations = JBHotelReservation(fromDictionary: hotelReservationsData)
		}
		primaryLangID = dictionary["PrimaryLangID"] as? String
		timeStamp = dictionary["TimeStamp"] as? String
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if echoToken != nil{
			dictionary["EchoToken"] = echoToken
		}
		if hotelReservations != nil{
			dictionary["HotelReservations"] = hotelReservations.toDictionary()
		}
		if primaryLangID != nil{
			dictionary["PrimaryLangID"] = primaryLangID
		}
		if timeStamp != nil{
			dictionary["TimeStamp"] = timeStamp
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         echoToken = aDecoder.decodeObject(forKey: "EchoToken") as? String
         hotelReservations = aDecoder.decodeObject(forKey: "HotelReservations") as? JBHotelReservation
         primaryLangID = aDecoder.decodeObject(forKey: "PrimaryLangID") as? String
         timeStamp = aDecoder.decodeObject(forKey: "TimeStamp") as? String

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if echoToken != nil{
			aCoder.encode(echoToken, forKey: "EchoToken")
		}
		if hotelReservations != nil{
			aCoder.encode(hotelReservations, forKey: "HotelReservations")
		}
		if primaryLangID != nil{
			aCoder.encode(primaryLangID, forKey: "PrimaryLangID")
		}
		if timeStamp != nil{
			aCoder.encode(timeStamp, forKey: "TimeStamp")
		}

	}

}