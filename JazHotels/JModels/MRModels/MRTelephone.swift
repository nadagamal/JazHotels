//
//	MRTelephone.swift
//
//	Create by Nada Gamal on 22/9/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class MRTelephone : NSObject, NSCoding{

	var DefaultInd : Bool!
	var PhoneNumber : String!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		DefaultInd = dictionary["_DefaultInd"] as? Bool
		PhoneNumber = dictionary["_PhoneNumber"] as? String
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if DefaultInd != nil{
			dictionary["_DefaultInd"] = DefaultInd
		}
		if PhoneNumber != nil{
			dictionary["_PhoneNumber"] = PhoneNumber
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         DefaultInd = aDecoder.decodeObject(forKey: "_DefaultInd") as? Bool
         PhoneNumber = aDecoder.decodeObject(forKey: "_PhoneNumber") as? String

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if DefaultInd != nil{
			aCoder.encode(DefaultInd, forKey: "_DefaultInd")
		}
		if PhoneNumber != nil{
			aCoder.encode(PhoneNumber, forKey: "_PhoneNumber")
		}

	}

}