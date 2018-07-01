//
//	JOTAHotelDescriptiveInfoRS.swift
//
//	Create by Nada Gamal on 1/7/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class JOTAHotelDescriptiveInfoRS : NSObject, NSCoding{

	var hotelDescriptiveContents : JHotelDescriptiveContent!
	var success : String!
	var echoToken : String!
	var primaryLangID : String!
	var timeStamp : String!
	var xmlns : String!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		if let hotelDescriptiveContentsData = dictionary["HotelDescriptiveContents"] as? [String:Any]{
			hotelDescriptiveContents = JHotelDescriptiveContent(fromDictionary: hotelDescriptiveContentsData)
		}
		success = dictionary["Success"] as? String
		echoToken = dictionary["_EchoToken"] as? String
		primaryLangID = dictionary["_PrimaryLangID"] as? String
		timeStamp = dictionary["_TimeStamp"] as? String
		xmlns = dictionary["_xmlns"] as? String
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if hotelDescriptiveContents != nil{
			dictionary["HotelDescriptiveContents"] = hotelDescriptiveContents.toDictionary()
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
		if timeStamp != nil{
			dictionary["_TimeStamp"] = timeStamp
		}
		if xmlns != nil{
			dictionary["_xmlns"] = xmlns
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         hotelDescriptiveContents = aDecoder.decodeObject(forKey: "HotelDescriptiveContents") as? JHotelDescriptiveContent
         success = aDecoder.decodeObject(forKey: "Success") as? String
         echoToken = aDecoder.decodeObject(forKey: "_EchoToken") as? String
         primaryLangID = aDecoder.decodeObject(forKey: "_PrimaryLangID") as? String
         timeStamp = aDecoder.decodeObject(forKey: "_TimeStamp") as? String
         xmlns = aDecoder.decodeObject(forKey: "_xmlns") as? String

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if hotelDescriptiveContents != nil{
			aCoder.encode(hotelDescriptiveContents, forKey: "HotelDescriptiveContents")
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
		if timeStamp != nil{
			aCoder.encode(timeStamp, forKey: "_TimeStamp")
		}
		if xmlns != nil{
			aCoder.encode(xmlns, forKey: "_xmlns")
		}

	}

}