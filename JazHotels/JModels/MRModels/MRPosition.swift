//
//	MRPosition.swift
//
//	Create by Nada Gamal on 22/9/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class MRPosition : NSObject, NSCoding{

	var Latitude : String!
	var Longitude : String!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		Latitude = dictionary["_Latitude"] as? String
		Longitude = dictionary["_Longitude"] as? String
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if Latitude != nil{
			dictionary["_Latitude"] = Latitude
		}
		if Longitude != nil{
			dictionary["_Longitude"] = Longitude
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         Latitude = aDecoder.decodeObject(forKey: "_Latitude") as? String
         Longitude = aDecoder.decodeObject(forKey: "_Longitude") as? String

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if Latitude != nil{
			aCoder.encode(Latitude, forKey: "_Latitude")
		}
		if Longitude != nil{
			aCoder.encode(Longitude, forKey: "_Longitude")
		}

	}

}