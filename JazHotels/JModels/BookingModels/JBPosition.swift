//
//	JBPosition.swift
//
//	Create by Nada Gamal on 9/9/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class JBPosition : NSObject, NSCoding{

	var latitude : String!
	var longitude : String!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		latitude = dictionary["Latitude"] as? String
		longitude = dictionary["Longitude"] as? String
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if latitude != nil{
			dictionary["Latitude"] = latitude
		}
		if longitude != nil{
			dictionary["Longitude"] = longitude
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         latitude = aDecoder.decodeObject(forKey: "Latitude") as? String
         longitude = aDecoder.decodeObject(forKey: "Longitude") as? String

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if latitude != nil{
			aCoder.encode(latitude, forKey: "Latitude")
		}
		if longitude != nil{
			aCoder.encode(longitude, forKey: "Longitude")
		}

	}

}