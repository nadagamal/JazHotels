//
//	JBody.swift
//
//	Create by Nada Gamal on 1/7/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class JBody : NSObject, NSCoding{

	var oTAHotelDescriptiveInfoRS : JOTAHotelDescriptiveInfoRS!
	var prefix : String!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		if let oTAHotelDescriptiveInfoRSData = dictionary["OTA_HotelDescriptiveInfoRS"] as? [String:Any]{
			oTAHotelDescriptiveInfoRS = JOTAHotelDescriptiveInfoRS(fromDictionary: oTAHotelDescriptiveInfoRSData)
		}
		prefix = dictionary["__prefix"] as? String
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if oTAHotelDescriptiveInfoRS != nil{
			dictionary["OTA_HotelDescriptiveInfoRS"] = oTAHotelDescriptiveInfoRS.toDictionary()
		}
		if prefix != nil{
			dictionary["__prefix"] = prefix
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         oTAHotelDescriptiveInfoRS = aDecoder.decodeObject(forKey: "OTA_HotelDescriptiveInfoRS") as? JOTAHotelDescriptiveInfoRS
         prefix = aDecoder.decodeObject(forKey: "__prefix") as? String

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if oTAHotelDescriptiveInfoRS != nil{
			aCoder.encode(oTAHotelDescriptiveInfoRS, forKey: "OTA_HotelDescriptiveInfoRS")
		}
		if prefix != nil{
			aCoder.encode(prefix, forKey: "__prefix")
		}

	}

}