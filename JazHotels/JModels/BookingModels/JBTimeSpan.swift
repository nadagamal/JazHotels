//
//	JBTimeSpan.swift
//
//	Create by Nada Gamal on 9/9/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class JBTimeSpan : NSObject, NSCoding{

	var duration : String!
	var end : String!
	var start : String!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		duration = dictionary["Duration"] as? String
		end = dictionary["End"] as? String
		start = dictionary["Start"] as? String
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if duration != nil{
			dictionary["Duration"] = duration
		}
		if end != nil{
			dictionary["End"] = end
		}
		if start != nil{
			dictionary["Start"] = start
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         duration = aDecoder.decodeObject(forKey: "Duration") as? String
         end = aDecoder.decodeObject(forKey: "End") as? String
         start = aDecoder.decodeObject(forKey: "Start") as? String

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if duration != nil{
			aCoder.encode(duration, forKey: "Duration")
		}
		if end != nil{
			aCoder.encode(end, forKey: "End")
		}
		if start != nil{
			aCoder.encode(start, forKey: "Start")
		}

	}

}