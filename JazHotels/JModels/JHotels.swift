//
//	JHotels.swift
//
//	Create by Nada Gamal on 1/7/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class JHotels : NSObject, NSCoding{

	var envelope : JEnvelope!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		if let envelopeData = dictionary["Envelope"] as? [String:Any]{
			envelope = JEnvelope(fromDictionary: envelopeData)
		}
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if envelope != nil{
			dictionary["Envelope"] = envelope.toDictionary()
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         envelope = aDecoder.decodeObject(forKey: "Envelope") as? JEnvelope

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if envelope != nil{
			aCoder.encode(envelope, forKey: "Envelope")
		}

	}

}