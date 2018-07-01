//
//	JCancelPolicy.swift
//
//	Create by Nada Gamal on 1/7/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class JCancelPolicy : NSObject, NSCoding{

	var cancelPenalty : JCancelPenalty!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		if let cancelPenaltyData = dictionary["CancelPenalty"] as? [String:Any]{
			cancelPenalty = JCancelPenalty(fromDictionary: cancelPenaltyData)
		}
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if cancelPenalty != nil{
			dictionary["CancelPenalty"] = cancelPenalty.toDictionary()
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         cancelPenalty = aDecoder.decodeObject(forKey: "CancelPenalty") as? JCancelPenalty

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if cancelPenalty != nil{
			aCoder.encode(cancelPenalty, forKey: "CancelPenalty")
		}

	}

}