//
//	CRSoap:Body.swift
//
//	Create by Nada Gamal on 22/9/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class CRSoapBody : NSObject, NSCoding{

	var OTACancelRS : CROTACancelRS!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		if let OTACancelRSData = dictionary["OTA_CancelRS"] as? [String:Any]{
			OTACancelRS = CROTACancelRS(fromDictionary: OTACancelRSData)
		}
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if OTACancelRS != nil{
			dictionary["OTA_CancelRS"] = OTACancelRS.toDictionary()
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         OTACancelRS = aDecoder.decodeObject(forKey: "OTA_CancelRS") as? CROTACancelRS

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if OTACancelRS != nil{
			aCoder.encode(OTACancelRS, forKey: "OTA_CancelRS")
		}

	}

}
