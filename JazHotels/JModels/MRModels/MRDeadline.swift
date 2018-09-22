//
//	MRDeadline.swift
//
//	Create by Nada Gamal on 22/9/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class MRDeadline : NSObject, NSCoding{

	var OffsetDropTime : String!
	var OffsetTimeUnit : String!
	var OffsetUnitMultiplier : String!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		OffsetDropTime = dictionary["_OffsetDropTime"] as? String
		OffsetTimeUnit = dictionary["_OffsetTimeUnit"] as? String
		OffsetUnitMultiplier = dictionary["_OffsetUnitMultiplier"] as? String
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if OffsetDropTime != nil{
			dictionary["_OffsetDropTime"] = OffsetDropTime
		}
		if OffsetTimeUnit != nil{
			dictionary["_OffsetTimeUnit"] = OffsetTimeUnit
		}
		if OffsetUnitMultiplier != nil{
			dictionary["_OffsetUnitMultiplier"] = OffsetUnitMultiplier
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         OffsetDropTime = aDecoder.decodeObject(forKey: "_OffsetDropTime") as? String
         OffsetTimeUnit = aDecoder.decodeObject(forKey: "_OffsetTimeUnit") as? String
         OffsetUnitMultiplier = aDecoder.decodeObject(forKey: "_OffsetUnitMultiplier") as? String

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if OffsetDropTime != nil{
			aCoder.encode(OffsetDropTime, forKey: "_OffsetDropTime")
		}
		if OffsetTimeUnit != nil{
			aCoder.encode(OffsetTimeUnit, forKey: "_OffsetTimeUnit")
		}
		if OffsetUnitMultiplier != nil{
			aCoder.encode(OffsetUnitMultiplier, forKey: "_OffsetUnitMultiplier")
		}

	}

}