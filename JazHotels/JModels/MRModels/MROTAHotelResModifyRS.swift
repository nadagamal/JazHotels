//
//	MROTAHotelResModifyRS.swift
//
//	Create by Nada Gamal on 22/9/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class MROTAHotelResModifyRS : NSObject, NSCoding{

	var HotelResModifies : MRHotelResModify!
	var Success : AnyObject!
	var EchoToken : String!
	var PrimaryLangID : String!
	var ResResponseType : String!
	var TimeStamp : String!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		if let HotelResModifiesData = dictionary["HotelResModifies"] as? [String:Any]{
			HotelResModifies = MRHotelResModify(fromDictionary: HotelResModifiesData)
		}
		Success = dictionary["Success"] as? AnyObject
		EchoToken = dictionary["_EchoToken"] as? String
		PrimaryLangID = dictionary["_PrimaryLangID"] as? String
		ResResponseType = dictionary["_ResResponseType"] as? String
		TimeStamp = dictionary["_TimeStamp"] as? String
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if HotelResModifies != nil{
			dictionary["HotelResModifies"] = HotelResModifies.toDictionary()
		}
		if Success != nil{
			dictionary["Success"] = Success
		}
		if EchoToken != nil{
			dictionary["_EchoToken"] = EchoToken
		}
		if PrimaryLangID != nil{
			dictionary["_PrimaryLangID"] = PrimaryLangID
		}
		if ResResponseType != nil{
			dictionary["_ResResponseType"] = ResResponseType
		}
		if TimeStamp != nil{
			dictionary["_TimeStamp"] = TimeStamp
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         HotelResModifies = aDecoder.decodeObject(forKey: "HotelResModifies") as? MRHotelResModify
         Success = aDecoder.decodeObject(forKey: "Success") as? AnyObject
         EchoToken = aDecoder.decodeObject(forKey: "_EchoToken") as? String
         PrimaryLangID = aDecoder.decodeObject(forKey: "_PrimaryLangID") as? String
         ResResponseType = aDecoder.decodeObject(forKey: "_ResResponseType") as? String
         TimeStamp = aDecoder.decodeObject(forKey: "_TimeStamp") as? String

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if HotelResModifies != nil{
			aCoder.encode(HotelResModifies, forKey: "HotelResModifies")
		}
		if Success != nil{
			aCoder.encode(Success, forKey: "Success")
		}
		if EchoToken != nil{
			aCoder.encode(EchoToken, forKey: "_EchoToken")
		}
		if PrimaryLangID != nil{
			aCoder.encode(PrimaryLangID, forKey: "_PrimaryLangID")
		}
		if ResResponseType != nil{
			aCoder.encode(ResResponseType, forKey: "_ResResponseType")
		}
		if TimeStamp != nil{
			aCoder.encode(TimeStamp, forKey: "_TimeStamp")
		}

	}

}