//
//	JAward.swift
//
//	Create by Nada Gamal on 1/7/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class JAward : NSObject, NSCoding{

	var provider : String!
	var rating : String!
	var award : [JAward]!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		provider = dictionary["_Provider"] as? String
		rating = dictionary["_Rating"] as? String
		award = [JAward]()
		if let awardArray = dictionary["Award"] as? [[String:Any]]{
			for dic in awardArray{
				let value = JAward(fromDictionary: dic)
				award.append(value)
			}
		}
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if provider != nil{
			dictionary["_Provider"] = provider
		}
		if rating != nil{
			dictionary["_Rating"] = rating
		}
		if award != nil{
			var dictionaryElements = [[String:Any]]()
			for awardElement in award {
				dictionaryElements.append(awardElement.toDictionary())
			}
			dictionary["Award"] = dictionaryElements
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         provider = aDecoder.decodeObject(forKey: "_Provider") as? String
         rating = aDecoder.decodeObject(forKey: "_Rating") as? String
         award = aDecoder.decodeObject(forKey :"Award") as? [JAward]

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if provider != nil{
			aCoder.encode(provider, forKey: "_Provider")
		}
		if rating != nil{
			aCoder.encode(rating, forKey: "_Rating")
		}
		if award != nil{
			aCoder.encode(award, forKey: "Award")
		}

	}

}