//
//	CBOccupancy.swift
//
//	Create by Nada Gamal on 18/9/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class CBOccupancy : NSObject, NSCoding{

	var maxOccupancy : String!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		maxOccupancy = dictionary["_MaxOccupancy"] as? String
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if maxOccupancy != nil{
			dictionary["_MaxOccupancy"] = maxOccupancy
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         maxOccupancy = aDecoder.decodeObject(forKey: "_MaxOccupancy") as? String

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if maxOccupancy != nil{
			aCoder.encode(maxOccupancy, forKey: "_MaxOccupancy")
		}

	}

}