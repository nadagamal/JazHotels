//
//	JEnvelope.swift
//
//	Create by Nada Gamal on 1/7/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class JEnvelope : NSObject, NSCoding{

	var body : JBody!
	var prefix : String!
	var xmlnssoap : String!
	var xmlnsxsd : String!
	var xmlnsxsi : String!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		if let bodyData = dictionary["soap:Body"] as? [String:Any]{
			body = JBody(fromDictionary: bodyData)
		}
		prefix = dictionary["__prefix"] as? String
		xmlnssoap = dictionary["_xmlns:soap"] as? String
		xmlnsxsd = dictionary["_xmlns:xsd"] as? String
		xmlnsxsi = dictionary["_xmlns:xsi"] as? String
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if body != nil{
			dictionary["Body"] = body.toDictionary()
		}
		if prefix != nil{
			dictionary["__prefix"] = prefix
		}
		if xmlnssoap != nil{
			dictionary["_xmlns:soap"] = xmlnssoap
		}
		if xmlnsxsd != nil{
			dictionary["_xmlns:xsd"] = xmlnsxsd
		}
		if xmlnsxsi != nil{
			dictionary["_xmlns:xsi"] = xmlnsxsi
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         body = aDecoder.decodeObject(forKey: "Body") as? JBody
         prefix = aDecoder.decodeObject(forKey: "__prefix") as? String
         xmlnssoap = aDecoder.decodeObject(forKey: "_xmlns:soap") as? String
         xmlnsxsd = aDecoder.decodeObject(forKey: "_xmlns:xsd") as? String
         xmlnsxsi = aDecoder.decodeObject(forKey: "_xmlns:xsi") as? String

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if body != nil{
			aCoder.encode(body, forKey: "Body")
		}
		if prefix != nil{
			aCoder.encode(prefix, forKey: "__prefix")
		}
		if xmlnssoap != nil{
			aCoder.encode(xmlnssoap, forKey: "_xmlns:soap")
		}
		if xmlnsxsd != nil{
			aCoder.encode(xmlnsxsd, forKey: "_xmlns:xsd")
		}
		if xmlnsxsi != nil{
			aCoder.encode(xmlnsxsi, forKey: "_xmlns:xsi")
		}

	}

}
