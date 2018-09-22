//
//	MRUserID.swift
//
//	Create by Nada Gamal on 22/9/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class MRUserID : NSObject, NSCoding{

	var ID : String!
	var PinNumber : String!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		ID = dictionary["_ID"] as? String
		PinNumber = dictionary["_PinNumber"] as? String
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if ID != nil{
			dictionary["_ID"] = ID
		}
		if PinNumber != nil{
			dictionary["_PinNumber"] = PinNumber
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         ID = aDecoder.decodeObject(forKey: "_ID") as? String
         PinNumber = aDecoder.decodeObject(forKey: "_PinNumber") as? String

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if ID != nil{
			aCoder.encode(ID, forKey: "_ID")
		}
		if PinNumber != nil{
			aCoder.encode(PinNumber, forKey: "_PinNumber")
		}

	}

}