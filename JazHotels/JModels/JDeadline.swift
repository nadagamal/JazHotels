//
//	JDeadline.swift
//
//	Create by Nada Gamal on 1/7/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class JDeadline : NSObject, NSCoding{

	var offsetDropTime : String!
	var offsetTimeUnit : String!
	var offsetUnitMultiplier : String!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		offsetDropTime = dictionary["_OffsetDropTime"] as? String
		offsetTimeUnit = dictionary["_OffsetTimeUnit"] as? String
		offsetUnitMultiplier = dictionary["_OffsetUnitMultiplier"] as? String
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if offsetDropTime != nil{
			dictionary["_OffsetDropTime"] = offsetDropTime
		}
		if offsetTimeUnit != nil{
			dictionary["_OffsetTimeUnit"] = offsetTimeUnit
		}
		if offsetUnitMultiplier != nil{
			dictionary["_OffsetUnitMultiplier"] = offsetUnitMultiplier
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         offsetDropTime = aDecoder.decodeObject(forKey: "_OffsetDropTime") as? String
         offsetTimeUnit = aDecoder.decodeObject(forKey: "_OffsetTimeUnit") as? String
         offsetUnitMultiplier = aDecoder.decodeObject(forKey: "_OffsetUnitMultiplier") as? String

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if offsetDropTime != nil{
			aCoder.encode(offsetDropTime, forKey: "_OffsetDropTime")
		}
		if offsetTimeUnit != nil{
			aCoder.encode(offsetTimeUnit, forKey: "_OffsetTimeUnit")
		}
		if offsetUnitMultiplier != nil{
			aCoder.encode(offsetUnitMultiplier, forKey: "_OffsetUnitMultiplier")
		}

	}

}