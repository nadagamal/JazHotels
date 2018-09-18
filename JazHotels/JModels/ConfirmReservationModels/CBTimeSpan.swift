//
//	CBTimeSpan.swift
//
//	Create by Nada Gamal on 18/9/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class CBTimeSpan : NSObject, NSCoding{

	var duration : String!
	var end : String!
	var start : String!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		duration = dictionary["_Duration"] as? String
		end = dictionary["_End"] as? String
		start = dictionary["_Start"] as? String
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if duration != nil{
			dictionary["_Duration"] = duration
		}
		if end != nil{
			dictionary["_End"] = end
		}
		if start != nil{
			dictionary["_Start"] = start
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         duration = aDecoder.decodeObject(forKey: "_Duration") as? String
         end = aDecoder.decodeObject(forKey: "_End") as? String
         start = aDecoder.decodeObject(forKey: "_Start") as? String

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if duration != nil{
			aCoder.encode(duration, forKey: "_Duration")
		}
		if end != nil{
			aCoder.encode(end, forKey: "_End")
		}
		if start != nil{
			aCoder.encode(start, forKey: "_Start")
		}

	}

}