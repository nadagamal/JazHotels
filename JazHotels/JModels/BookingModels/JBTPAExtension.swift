//
//	JBTpaExtension.swift
//
//	Create by Nada Gamal on 9/9/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class JBTpaExtension : NSObject, NSCoding{

	var nightlyRate : JBNightlyRate!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		if let nightlyRateData = dictionary["NightlyRate"] as? [String:Any]{
			nightlyRate = JBNightlyRate(fromDictionary: nightlyRateData)
		}
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if nightlyRate != nil{
			dictionary["NightlyRate"] = nightlyRate.toDictionary()
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         nightlyRate = aDecoder.decodeObject(forKey: "NightlyRate") as? JBNightlyRate

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if nightlyRate != nil{
			aCoder.encode(nightlyRate, forKey: "NightlyRate")
		}

	}

}