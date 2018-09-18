//
//	CBUserID.swift
//
//	Create by Nada Gamal on 18/9/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class CBUserID : NSObject, NSCoding{

	var iD : String!
	var pinNumber : String!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		iD = dictionary["_ID"] as? String
		pinNumber = dictionary["_PinNumber"] as? String
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if iD != nil{
			dictionary["_ID"] = iD
		}
		if pinNumber != nil{
			dictionary["_PinNumber"] = pinNumber
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         iD = aDecoder.decodeObject(forKey: "_ID") as? String
         pinNumber = aDecoder.decodeObject(forKey: "_PinNumber") as? String

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if iD != nil{
			aCoder.encode(iD, forKey: "_ID")
		}
		if pinNumber != nil{
			aCoder.encode(pinNumber, forKey: "_PinNumber")
		}

	}

}