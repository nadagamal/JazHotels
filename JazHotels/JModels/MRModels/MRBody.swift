//
//	MRBody.swift
//
//	Create by Nada Gamal on 22/9/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class MRBody : NSObject, NSCoding{

	var OTAHotelResModifyRS : MROTAHotelResModifyRS!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		if let OTAHotelResModifyRSData = dictionary["OTA_HotelResModifyRS"] as? [String:Any]{
			OTAHotelResModifyRS = MROTAHotelResModifyRS(fromDictionary: OTAHotelResModifyRSData)
		}
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if OTAHotelResModifyRS != nil{
			dictionary["OTA_HotelResModifyRS"] = OTAHotelResModifyRS.toDictionary()
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         OTAHotelResModifyRS = aDecoder.decodeObject(forKey: "OTA_HotelResModifyRS") as? MROTAHotelResModifyRS

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if OTAHotelResModifyRS != nil{
			aCoder.encode(OTAHotelResModifyRS, forKey: "OTA_HotelResModifyRS")
		}

	}

}