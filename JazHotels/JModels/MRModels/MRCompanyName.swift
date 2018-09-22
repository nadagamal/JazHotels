//
//	MRCompanyName.swift
//
//	Create by Nada Gamal on 22/9/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class MRCompanyName : NSObject, NSCoding{

	var text : String!
	var Code : String!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		text = dictionary["#text"] as? String
		Code = dictionary["_Code"] as? String
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if text != nil{
			dictionary["#text"] = text
		}
		if Code != nil{
			dictionary["_Code"] = Code
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         text = aDecoder.decodeObject(forKey: "#text") as? String
         Code = aDecoder.decodeObject(forKey: "_Code") as? String

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if text != nil{
			aCoder.encode(text, forKey: "#text")
		}
		if Code != nil{
			aCoder.encode(Code, forKey: "_Code")
		}

	}

}