//
//	JBPersonName.swift
//
//	Create by Nada Gamal on 9/9/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class JBPersonName : NSObject, NSCoding{

	var givenName : String!
	var middleName : String!
	var namePrefix : String!
	var nameSuffix : AnyObject!
	var surname : String!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		givenName = dictionary["GivenName"] as? String
		middleName = dictionary["MiddleName"] as? String
		namePrefix = dictionary["NamePrefix"] as? String
		nameSuffix = dictionary["NameSuffix"] as? AnyObject
		surname = dictionary["Surname"] as? String
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if givenName != nil{
			dictionary["GivenName"] = givenName
		}
		if middleName != nil{
			dictionary["MiddleName"] = middleName
		}
		if namePrefix != nil{
			dictionary["NamePrefix"] = namePrefix
		}
		if nameSuffix != nil{
			dictionary["NameSuffix"] = nameSuffix
		}
		if surname != nil{
			dictionary["Surname"] = surname
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         givenName = aDecoder.decodeObject(forKey: "GivenName") as? String
         middleName = aDecoder.decodeObject(forKey: "MiddleName") as? String
         namePrefix = aDecoder.decodeObject(forKey: "NamePrefix") as? String
         nameSuffix = aDecoder.decodeObject(forKey: "NameSuffix") as? AnyObject
         surname = aDecoder.decodeObject(forKey: "Surname") as? String

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if givenName != nil{
			aCoder.encode(givenName, forKey: "GivenName")
		}
		if middleName != nil{
			aCoder.encode(middleName, forKey: "MiddleName")
		}
		if namePrefix != nil{
			aCoder.encode(namePrefix, forKey: "NamePrefix")
		}
		if nameSuffix != nil{
			aCoder.encode(nameSuffix, forKey: "NameSuffix")
		}
		if surname != nil{
			aCoder.encode(surname, forKey: "Surname")
		}

	}

}