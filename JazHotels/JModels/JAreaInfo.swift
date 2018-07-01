//
//	JAreaInfo.swift
//
//	Create by Nada Gamal on 1/7/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class JAreaInfo : NSObject, NSCoding{

	var attractions : JAttraction!
	var recreations : JRecreation!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		if let attractionsData = dictionary["Attractions"] as? [String:Any]{
			attractions = JAttraction(fromDictionary: attractionsData)
		}
		if let recreationsData = dictionary["Recreations"] as? [String:Any]{
			recreations = JRecreation(fromDictionary: recreationsData)
		}
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if attractions != nil{
			dictionary["Attractions"] = attractions.toDictionary()
		}
		if recreations != nil{
			dictionary["Recreations"] = recreations.toDictionary()
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         attractions = aDecoder.decodeObject(forKey: "Attractions") as? JAttraction
         recreations = aDecoder.decodeObject(forKey: "Recreations") as? JRecreation

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if attractions != nil{
			aCoder.encode(attractions, forKey: "Attractions")
		}
		if recreations != nil{
			aCoder.encode(recreations, forKey: "Recreations")
		}

	}

}