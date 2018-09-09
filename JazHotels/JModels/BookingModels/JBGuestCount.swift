//
//	JBGuestCount.swift
//
//	Create by Nada Gamal on 9/9/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class JBGuestCount : NSObject, NSCoding{

	var ageQualifyingCode : String!
	var count : String!
	var guestCount : JBGuestCount!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		ageQualifyingCode = dictionary["AgeQualifyingCode"] as? String
		count = dictionary["Count"] as? String
		if let guestCountData = dictionary["GuestCount"] as? [String:Any]{
			guestCount = JBGuestCount(fromDictionary: guestCountData)
		}
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if ageQualifyingCode != nil{
			dictionary["AgeQualifyingCode"] = ageQualifyingCode
		}
		if count != nil{
			dictionary["Count"] = count
		}
		if guestCount != nil{
			dictionary["GuestCount"] = guestCount.toDictionary()
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         ageQualifyingCode = aDecoder.decodeObject(forKey: "AgeQualifyingCode") as? String
         count = aDecoder.decodeObject(forKey: "Count") as? String
         guestCount = aDecoder.decodeObject(forKey: "GuestCount") as? JBGuestCount

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if ageQualifyingCode != nil{
			aCoder.encode(ageQualifyingCode, forKey: "AgeQualifyingCode")
		}
		if count != nil{
			aCoder.encode(count, forKey: "Count")
		}
		if guestCount != nil{
			aCoder.encode(guestCount, forKey: "GuestCount")
		}

	}

}