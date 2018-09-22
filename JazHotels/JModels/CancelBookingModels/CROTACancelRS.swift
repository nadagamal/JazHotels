//
//	CROTACancelRS.swift
//
//	Create by Nada Gamal on 22/9/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class CROTACancelRS : NSObject, NSCoding{

	var CancelInfoRS : CRCancelInfoRS!
	var Success : AnyObject!
	var UniqueID : CRUniqueID!
	var EchoToken : String!
	var ResResponseType : String!
	var TimeStamp : String!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		if let CancelInfoRSData = dictionary["CancelInfoRS"] as? [String:Any]{
			CancelInfoRS = CRCancelInfoRS(fromDictionary: CancelInfoRSData)
		}
		Success = dictionary["Success"] as? AnyObject
		if let UniqueIDData = dictionary["UniqueID"] as? [String:Any]{
			UniqueID = CRUniqueID(fromDictionary: UniqueIDData)
		}
		EchoToken = dictionary["_EchoToken"] as? String
		ResResponseType = dictionary["_ResResponseType"] as? String
		TimeStamp = dictionary["_TimeStamp"] as? String
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if CancelInfoRS != nil{
			dictionary["CancelInfoRS"] = CancelInfoRS.toDictionary()
		}
		if Success != nil{
			dictionary["Success"] = Success
		}
		if UniqueID != nil{
			dictionary["UniqueID"] = UniqueID.toDictionary()
		}
		if EchoToken != nil{
			dictionary["_EchoToken"] = EchoToken
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
         CancelInfoRS = aDecoder.decodeObject(forKey: "CancelInfoRS") as? CRCancelInfoRS
         Success = aDecoder.decodeObject(forKey: "Success") as? AnyObject
         UniqueID = aDecoder.decodeObject(forKey: "UniqueID") as? CRUniqueID
         EchoToken = aDecoder.decodeObject(forKey: "_EchoToken") as? String
         ResResponseType = aDecoder.decodeObject(forKey: "_ResResponseType") as? String
         TimeStamp = aDecoder.decodeObject(forKey: "_TimeStamp") as? String

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if CancelInfoRS != nil{
			aCoder.encode(CancelInfoRS, forKey: "CancelInfoRS")
		}
		if Success != nil{
			aCoder.encode(Success, forKey: "Success")
		}
		if UniqueID != nil{
			aCoder.encode(UniqueID, forKey: "UniqueID")
		}
		if EchoToken != nil{
			aCoder.encode(EchoToken, forKey: "_EchoToken")
		}
		if ResResponseType != nil{
			aCoder.encode(ResResponseType, forKey: "_ResResponseType")
		}
		if TimeStamp != nil{
			aCoder.encode(TimeStamp, forKey: "_TimeStamp")
		}

	}

}