//
//	JRecreation.swift
//
//	Create by Nada Gamal on 1/7/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class JRecreation : NSObject, NSCoding{

	var code : String!
	var codeDetail : String!
	var proximityCode : String!
	var recreation : [JRecreation]!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		code = dictionary["_Code"] as? String
		codeDetail = dictionary["_CodeDetail"] as? String
		proximityCode = dictionary["_ProximityCode"] as? String
		recreation = [JRecreation]()
		if let recreationArray = dictionary["Recreation"] as? [[String:Any]]{
			for dic in recreationArray{
				let value = JRecreation(fromDictionary: dic)
				recreation.append(value)
			}
		}
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if code != nil{
			dictionary["_Code"] = code
		}
		if codeDetail != nil{
			dictionary["_CodeDetail"] = codeDetail
		}
		if proximityCode != nil{
			dictionary["_ProximityCode"] = proximityCode
		}
		if recreation != nil{
			var dictionaryElements = [[String:Any]]()
			for recreationElement in recreation {
				dictionaryElements.append(recreationElement.toDictionary())
			}
			dictionary["Recreation"] = dictionaryElements
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         code = aDecoder.decodeObject(forKey: "_Code") as? String
         codeDetail = aDecoder.decodeObject(forKey: "_CodeDetail") as? String
         proximityCode = aDecoder.decodeObject(forKey: "_ProximityCode") as? String
         recreation = aDecoder.decodeObject(forKey :"Recreation") as? [JRecreation]

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if code != nil{
			aCoder.encode(code, forKey: "_Code")
		}
		if codeDetail != nil{
			aCoder.encode(codeDetail, forKey: "_CodeDetail")
		}
		if proximityCode != nil{
			aCoder.encode(proximityCode, forKey: "_ProximityCode")
		}
		if recreation != nil{
			aCoder.encode(recreation, forKey: "Recreation")
		}

	}

}