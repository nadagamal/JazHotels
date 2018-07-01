//
//	JCBody.swift
//
//	Create by Nada Gamal on 1/7/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

class JCBody{

	var oTAHotelAvailRS : JCOTAHotelAvailRS!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		if let oTAHotelAvailRSData = dictionary["OTA_HotelAvailRS"] as? [String:Any]{
			oTAHotelAvailRS = JCOTAHotelAvailRS(fromDictionary: oTAHotelAvailRSData)
		}
	}

}