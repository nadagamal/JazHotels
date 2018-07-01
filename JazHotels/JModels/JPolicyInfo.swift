//
//	JPolicyInfo.swift
//
//	Create by Nada Gamal on 1/7/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class JPolicyInfo : NSObject, NSCoding{

	var checkInTime : String!
	var checkOutTime : String!
	var kidsStayFree : Bool!
	var maxChildAge : String!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		checkInTime = dictionary["_CheckInTime"] as? String
		checkOutTime = dictionary["_CheckOutTime"] as? String
		kidsStayFree = dictionary["_KidsStayFree"] as? Bool
		maxChildAge = dictionary["_MaxChildAge"] as? String
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if checkInTime != nil{
			dictionary["_CheckInTime"] = checkInTime
		}
		if checkOutTime != nil{
			dictionary["_CheckOutTime"] = checkOutTime
		}
		if kidsStayFree != nil{
			dictionary["_KidsStayFree"] = kidsStayFree
		}
		if maxChildAge != nil{
			dictionary["_MaxChildAge"] = maxChildAge
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         checkInTime = aDecoder.decodeObject(forKey: "_CheckInTime") as? String
         checkOutTime = aDecoder.decodeObject(forKey: "_CheckOutTime") as? String
         kidsStayFree = aDecoder.decodeObject(forKey: "_KidsStayFree") as? Bool
         maxChildAge = aDecoder.decodeObject(forKey: "_MaxChildAge") as? String

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if checkInTime != nil{
			aCoder.encode(checkInTime, forKey: "_CheckInTime")
		}
		if checkOutTime != nil{
			aCoder.encode(checkOutTime, forKey: "_CheckOutTime")
		}
		if kidsStayFree != nil{
			aCoder.encode(kidsStayFree, forKey: "_KidsStayFree")
		}
		if maxChildAge != nil{
			aCoder.encode(maxChildAge, forKey: "_MaxChildAge")
		}

	}

}