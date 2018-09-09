//
//	JBStateProv.swift
//
//	Create by Nada Gamal on 9/9/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class JBStateProv : NSObject, NSCoding{

	var stateCode : String!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		stateCode = dictionary["StateCode"] as? String
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if stateCode != nil{
			dictionary["StateCode"] = stateCode
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         stateCode = aDecoder.decodeObject(forKey: "StateCode") as? String

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if stateCode != nil{
			aCoder.encode(stateCode, forKey: "StateCode")
		}

	}

}