//
//	MRGuestCount.swift
//
//	Create by Nada Gamal on 22/9/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class MRGuestCount : NSObject, NSCoding{

	var AgeQualifyingCode : String!
	var Count : String!
	var GuestCount : MRGuestCount!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		AgeQualifyingCode = dictionary["_AgeQualifyingCode"] as? String
		Count = dictionary["_Count"] as? String
		if let GuestCountData = dictionary["GuestCount"] as? [String:Any]{
			GuestCount = MRGuestCount(fromDictionary: GuestCountData)
		}
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if AgeQualifyingCode != nil{
			dictionary["_AgeQualifyingCode"] = AgeQualifyingCode
		}
		if Count != nil{
			dictionary["_Count"] = Count
		}
		if GuestCount != nil{
			dictionary["GuestCount"] = GuestCount.toDictionary()
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         AgeQualifyingCode = aDecoder.decodeObject(forKey: "_AgeQualifyingCode") as? String
         Count = aDecoder.decodeObject(forKey: "_Count") as? String
         GuestCount = aDecoder.decodeObject(forKey: "GuestCount") as? MRGuestCount

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if AgeQualifyingCode != nil{
			aCoder.encode(AgeQualifyingCode, forKey: "_AgeQualifyingCode")
		}
		if Count != nil{
			aCoder.encode(Count, forKey: "_Count")
		}
		if GuestCount != nil{
			aCoder.encode(GuestCount, forKey: "GuestCount")
		}

	}

}