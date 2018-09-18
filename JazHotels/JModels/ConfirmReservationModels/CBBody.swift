//
//	CBBody.swift
//
//	Create by Nada Gamal on 18/9/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class CBBody : NSObject, NSCoding{

	var oTAHotelResRS : CBOTAHotelResRS!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		if let oTAHotelResRSData = dictionary["OTA_HotelResRS"] as? [String:Any]{
			oTAHotelResRS = CBOTAHotelResRS(fromDictionary: oTAHotelResRSData)
		}
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if oTAHotelResRS != nil{
			dictionary["OTA_HotelResRS"] = oTAHotelResRS.toDictionary()
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         oTAHotelResRS = aDecoder.decodeObject(forKey: "OTA_HotelResRS") as? CBOTAHotelResRS

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if oTAHotelResRS != nil{
			aCoder.encode(oTAHotelResRS, forKey: "OTA_HotelResRS")
		}

	}

}