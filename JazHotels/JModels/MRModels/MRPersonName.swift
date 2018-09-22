//
//	MRPersonName.swift
//
//	Create by Nada Gamal on 22/9/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class MRPersonName : NSObject, NSCoding{

	var GivenName : String!
	var MiddleName : AnyObject!
	var NamePrefix : AnyObject!
	var NameSuffix : AnyObject!
	var Surname : String!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		GivenName = dictionary["GivenName"] as? String
		MiddleName = dictionary["MiddleName"] as? AnyObject
		NamePrefix = dictionary["NamePrefix"] as? AnyObject
		NameSuffix = dictionary["NameSuffix"] as? AnyObject
		Surname = dictionary["Surname"] as? String
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if GivenName != nil{
			dictionary["GivenName"] = GivenName
		}
		if MiddleName != nil{
			dictionary["MiddleName"] = MiddleName
		}
		if NamePrefix != nil{
			dictionary["NamePrefix"] = NamePrefix
		}
		if NameSuffix != nil{
			dictionary["NameSuffix"] = NameSuffix
		}
		if Surname != nil{
			dictionary["Surname"] = Surname
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         GivenName = aDecoder.decodeObject(forKey: "GivenName") as? String
         MiddleName = aDecoder.decodeObject(forKey: "MiddleName") as? AnyObject
         NamePrefix = aDecoder.decodeObject(forKey: "NamePrefix") as? AnyObject
         NameSuffix = aDecoder.decodeObject(forKey: "NameSuffix") as? AnyObject
         Surname = aDecoder.decodeObject(forKey: "Surname") as? String

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if GivenName != nil{
			aCoder.encode(GivenName, forKey: "GivenName")
		}
		if MiddleName != nil{
			aCoder.encode(MiddleName, forKey: "MiddleName")
		}
		if NamePrefix != nil{
			aCoder.encode(NamePrefix, forKey: "NamePrefix")
		}
		if NameSuffix != nil{
			aCoder.encode(NameSuffix, forKey: "NameSuffix")
		}
		if Surname != nil{
			aCoder.encode(Surname, forKey: "Surname")
		}

	}

}