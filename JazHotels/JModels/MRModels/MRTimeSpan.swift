//
//	MRTimeSpan.swift
//
//	Create by Nada Gamal on 22/9/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class MRTimeSpan : NSObject, NSCoding{

	var Duration : String!
	var End : String!
	var Start : String!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		Duration = dictionary["_Duration"] as? String
		End = dictionary["_End"] as? String
		Start = dictionary["_Start"] as? String
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if Duration != nil{
			dictionary["_Duration"] = Duration
		}
		if End != nil{
			dictionary["_End"] = End
		}
		if Start != nil{
			dictionary["_Start"] = Start
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         Duration = aDecoder.decodeObject(forKey: "_Duration") as? String
         End = aDecoder.decodeObject(forKey: "_End") as? String
         Start = aDecoder.decodeObject(forKey: "_Start") as? String

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if Duration != nil{
			aCoder.encode(Duration, forKey: "_Duration")
		}
		if End != nil{
			aCoder.encode(End, forKey: "_End")
		}
		if Start != nil{
			aCoder.encode(Start, forKey: "_Start")
		}

	}

}