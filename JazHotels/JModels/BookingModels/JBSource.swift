//
//	JBSource.swift
//
//	Create by Nada Gamal on 9/9/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

class JBSource{

	var bookingChannel : JBBookingChannel!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		if let bookingChannelData = dictionary["BookingChannel"] as? [String:Any]{
			bookingChannel = JBBookingChannel(fromDictionary: bookingChannelData)
		}
	}

}