//
//	MRSource.swift
//
//	Create by Nada Gamal on 22/9/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class MRSource : NSObject, NSCoding{

	var BookingChannel : MRBookingChannel!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		if let BookingChannelData = dictionary["BookingChannel"] as? [String:Any]{
			BookingChannel = MRBookingChannel(fromDictionary: BookingChannelData)
		}
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if BookingChannel != nil{
			dictionary["BookingChannel"] = BookingChannel.toDictionary()
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         BookingChannel = aDecoder.decodeObject(forKey: "BookingChannel") as? MRBookingChannel

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if BookingChannel != nil{
			aCoder.encode(BookingChannel, forKey: "BookingChannel")
		}

	}

}