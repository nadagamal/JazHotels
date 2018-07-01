//
//	JFeature.swift
//
//	Create by Nada Gamal on 1/7/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class JFeature : NSObject, NSCoding{

	var accessibleCode : String!
	var codeDetail : String!
	var feature : [JFeature]!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		accessibleCode = dictionary["_AccessibleCode"] as? String
		codeDetail = dictionary["_CodeDetail"] as? String
		feature = [JFeature]()
		if let featureArray = dictionary["Feature"] as? [[String:Any]]{
			for dic in featureArray{
				let value = JFeature(fromDictionary: dic)
				feature.append(value)
			}
		}
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if accessibleCode != nil{
			dictionary["_AccessibleCode"] = accessibleCode
		}
		if codeDetail != nil{
			dictionary["_CodeDetail"] = codeDetail
		}
		if feature != nil{
			var dictionaryElements = [[String:Any]]()
			for featureElement in feature {
				dictionaryElements.append(featureElement.toDictionary())
			}
			dictionary["Feature"] = dictionaryElements
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         accessibleCode = aDecoder.decodeObject(forKey: "_AccessibleCode") as? String
         codeDetail = aDecoder.decodeObject(forKey: "_CodeDetail") as? String
         feature = aDecoder.decodeObject(forKey :"Feature") as? [JFeature]

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if accessibleCode != nil{
			aCoder.encode(accessibleCode, forKey: "_AccessibleCode")
		}
		if codeDetail != nil{
			aCoder.encode(codeDetail, forKey: "_CodeDetail")
		}
		if feature != nil{
			aCoder.encode(feature, forKey: "Feature")
		}

	}

}