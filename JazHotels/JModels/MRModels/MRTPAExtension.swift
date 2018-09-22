//
//	MRTpaExtension.swift
//
//	Create by Nada Gamal on 22/9/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class MRTpaExtension : NSObject, NSCoding{

	var NightlyRate : [MRNightlyRate]!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		NightlyRate = [MRNightlyRate]()
		if let NightlyRateArray = dictionary["NightlyRate"] as? [[String:Any]]{
			for dic in NightlyRateArray{
				let value = MRNightlyRate(fromDictionary: dic)
				NightlyRate.append(value)
			}
		}
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if NightlyRate != nil{
			var dictionaryElements = [[String:Any]]()
			for NightlyRateElement in NightlyRate {
				dictionaryElements.append(NightlyRateElement.toDictionary())
			}
			dictionary["NightlyRate"] = dictionaryElements
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         NightlyRate = aDecoder.decodeObject(forKey :"NightlyRate") as? [MRNightlyRate]

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if NightlyRate != nil{
			aCoder.encode(NightlyRate, forKey: "NightlyRate")
		}

	}

}