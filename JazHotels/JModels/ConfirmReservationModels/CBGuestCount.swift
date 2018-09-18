//
//	CBGuestCount.swift
//
//	Create by Nada Gamal on 18/9/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class CBGuestCount : NSObject, NSCoding{

	var ageQualifyingCode : String!
	var count : String!
	var guestCount : [CBGuestCount]!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		ageQualifyingCode = dictionary["_AgeQualifyingCode"] as? String
		count = dictionary["_Count"] as? String
		guestCount = [CBGuestCount]()
		if let guestCountArray = dictionary["GuestCount"] as? [[String:Any]]{
			for dic in guestCountArray{
				let value = CBGuestCount(fromDictionary: dic)
				guestCount.append(value)
			}
		}
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if ageQualifyingCode != nil{
			dictionary["_AgeQualifyingCode"] = ageQualifyingCode
		}
		if count != nil{
			dictionary["_Count"] = count
		}
		if guestCount != nil{
			var dictionaryElements = [[String:Any]]()
			for guestCountElement in guestCount {
				dictionaryElements.append(guestCountElement.toDictionary())
			}
			dictionary["GuestCount"] = dictionaryElements
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         ageQualifyingCode = aDecoder.decodeObject(forKey: "_AgeQualifyingCode") as? String
         count = aDecoder.decodeObject(forKey: "_Count") as? String
         guestCount = aDecoder.decodeObject(forKey :"GuestCount") as? [CBGuestCount]

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if ageQualifyingCode != nil{
			aCoder.encode(ageQualifyingCode, forKey: "_AgeQualifyingCode")
		}
		if count != nil{
			aCoder.encode(count, forKey: "_Count")
		}
		if guestCount != nil{
			aCoder.encode(guestCount, forKey: "GuestCount")
		}

	}

}