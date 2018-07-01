//
//	JAmenity.swift
//
//	Create by Nada Gamal on 1/7/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class JAmenity : NSObject, NSCoding{

	var multimediaDescriptions : JMultimediaDescription!
	var codeDetail : String!
	var roomAmenityCode : String!
	var amenity : [JAmenity]!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		if let multimediaDescriptionsData = dictionary["MultimediaDescriptions"] as? [String:Any]{
			multimediaDescriptions = JMultimediaDescription(fromDictionary: multimediaDescriptionsData)
		}
		codeDetail = dictionary["_CodeDetail"] as? String
		roomAmenityCode = dictionary["_RoomAmenityCode"] as? String
		amenity = [JAmenity]()
		if let amenityArray = dictionary["Amenity"] as? [[String:Any]]{
			for dic in amenityArray{
				let value = JAmenity(fromDictionary: dic)
				amenity.append(value)
			}
		}
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if multimediaDescriptions != nil{
			dictionary["MultimediaDescriptions"] = multimediaDescriptions.toDictionary()
		}
		if codeDetail != nil{
			dictionary["_CodeDetail"] = codeDetail
		}
		if roomAmenityCode != nil{
			dictionary["_RoomAmenityCode"] = roomAmenityCode
		}
		if amenity != nil{
			var dictionaryElements = [[String:Any]]()
			for amenityElement in amenity {
				dictionaryElements.append(amenityElement.toDictionary())
			}
			dictionary["Amenity"] = dictionaryElements
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         multimediaDescriptions = aDecoder.decodeObject(forKey: "MultimediaDescriptions") as? JMultimediaDescription
         codeDetail = aDecoder.decodeObject(forKey: "_CodeDetail") as? String
         roomAmenityCode = aDecoder.decodeObject(forKey: "_RoomAmenityCode") as? String
         amenity = aDecoder.decodeObject(forKey :"Amenity") as? [JAmenity]

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if multimediaDescriptions != nil{
			aCoder.encode(multimediaDescriptions, forKey: "MultimediaDescriptions")
		}
		if codeDetail != nil{
			aCoder.encode(codeDetail, forKey: "_CodeDetail")
		}
		if roomAmenityCode != nil{
			aCoder.encode(roomAmenityCode, forKey: "_RoomAmenityCode")
		}
		if amenity != nil{
			aCoder.encode(amenity, forKey: "Amenity")
		}

	}

}