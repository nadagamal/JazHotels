//
//	RootClass.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class User : NSObject, NSCoding{

	var emailAddress : String!
	var fullName : String!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		emailAddress = dictionary["emailAddress"] as? String
		fullName = dictionary["fullName"] as? String
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if emailAddress != nil{
			dictionary["emailAddress"] = emailAddress
		}
		if fullName != nil{
			dictionary["fullName"] = fullName
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         emailAddress = aDecoder.decodeObject(forKey: "emailAddress") as? String
         fullName = aDecoder.decodeObject(forKey: "fullName") as? String

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if emailAddress != nil{
			aCoder.encode(emailAddress, forKey: "emailAddress")
		}
		if fullName != nil{
			aCoder.encode(fullName, forKey: "fullName")
		}

	}

}
