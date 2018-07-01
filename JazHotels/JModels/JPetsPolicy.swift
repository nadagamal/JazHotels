//
//	JPetsPolicy.swift
//
//	Create by Nada Gamal on 1/7/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class JPetsPolicy : NSObject, NSCoding{

	var petsPolicy : JCommissionPolicy!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		if let petsPolicyData = dictionary["PetsPolicy"] as? [String:Any]{
			petsPolicy = JCommissionPolicy(fromDictionary: petsPolicyData)
		}
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if petsPolicy != nil{
			dictionary["PetsPolicy"] = petsPolicy.toDictionary()
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         petsPolicy = aDecoder.decodeObject(forKey: "PetsPolicy") as? JCommissionPolicy

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if petsPolicy != nil{
			aCoder.encode(petsPolicy, forKey: "PetsPolicy")
		}

	}

}