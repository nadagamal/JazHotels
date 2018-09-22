//
//	MRTaxDescription.swift
//
//	Create by Nada Gamal on 22/9/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class MRTaxDescription : NSObject, NSCoding{

	var Text : String!
	var Name : String!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		Text = dictionary["Text"] as? String
		Name = dictionary["_Name"] as? String
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if Text != nil{
			dictionary["Text"] = Text
		}
		if Name != nil{
			dictionary["_Name"] = Name
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         Text = aDecoder.decodeObject(forKey: "Text") as? String
         Name = aDecoder.decodeObject(forKey: "_Name") as? String

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if Text != nil{
			aCoder.encode(Text, forKey: "Text")
		}
		if Name != nil{
			aCoder.encode(Name, forKey: "_Name")
		}

	}

}