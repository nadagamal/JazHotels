//
//	CBTelephone.swift
//
//	Create by Nada Gamal on 18/9/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class CBTelephone : NSObject, NSCoding{

	var defaultInd : Bool!
	var phoneNumber : String!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		defaultInd = dictionary["_DefaultInd"] as? Bool
		phoneNumber = dictionary["_PhoneNumber"] as? String
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if defaultInd != nil{
			dictionary["_DefaultInd"] = defaultInd
		}
		if phoneNumber != nil{
			dictionary["_PhoneNumber"] = phoneNumber
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         defaultInd = aDecoder.decodeObject(forKey: "_DefaultInd") as? Bool
         phoneNumber = aDecoder.decodeObject(forKey: "_PhoneNumber") as? String

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if defaultInd != nil{
			aCoder.encode(defaultInd, forKey: "_DefaultInd")
		}
		if phoneNumber != nil{
			aCoder.encode(phoneNumber, forKey: "_PhoneNumber")
		}

	}

}