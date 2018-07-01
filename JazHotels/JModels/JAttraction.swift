//
//	JAttraction.swift
//
//	Create by Nada Gamal on 1/7/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class JAttraction : NSObject, NSCoding{

	var attractionName : String!
	var refPoints : JRefPoint!
	var attractionCategoryCode : String!
	var codeDetail : String!
	var attraction : JAttraction!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		attractionName = dictionary["AttractionName"] as? String
		if let refPointsData = dictionary["RefPoints"] as? [String:Any]{
			refPoints = JRefPoint(fromDictionary: refPointsData)
		}
		attractionCategoryCode = dictionary["_AttractionCategoryCode"] as? String
		codeDetail = dictionary["_CodeDetail"] as? String
		if let attractionData = dictionary["Attraction"] as? [String:Any]{
			attraction = JAttraction(fromDictionary: attractionData)
		}
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if attractionName != nil{
			dictionary["AttractionName"] = attractionName
		}
		if refPoints != nil{
			dictionary["RefPoints"] = refPoints.toDictionary()
		}
		if attractionCategoryCode != nil{
			dictionary["_AttractionCategoryCode"] = attractionCategoryCode
		}
		if codeDetail != nil{
			dictionary["_CodeDetail"] = codeDetail
		}
		if attraction != nil{
			dictionary["Attraction"] = attraction.toDictionary()
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         attractionName = aDecoder.decodeObject(forKey: "AttractionName") as? String
         refPoints = aDecoder.decodeObject(forKey: "RefPoints") as? JRefPoint
         attractionCategoryCode = aDecoder.decodeObject(forKey: "_AttractionCategoryCode") as? String
         codeDetail = aDecoder.decodeObject(forKey: "_CodeDetail") as? String
         attraction = aDecoder.decodeObject(forKey: "Attraction") as? JAttraction

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if attractionName != nil{
			aCoder.encode(attractionName, forKey: "AttractionName")
		}
		if refPoints != nil{
			aCoder.encode(refPoints, forKey: "RefPoints")
		}
		if attractionCategoryCode != nil{
			aCoder.encode(attractionCategoryCode, forKey: "_AttractionCategoryCode")
		}
		if codeDetail != nil{
			aCoder.encode(codeDetail, forKey: "_CodeDetail")
		}
		if attraction != nil{
			aCoder.encode(attraction, forKey: "Attraction")
		}

	}

}