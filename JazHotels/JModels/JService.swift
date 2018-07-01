//
//	JService.swift
//
//	Create by Nada Gamal on 1/7/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class JService : NSObject, NSCoding{

	var features : JFeature!
	var businessServiceCode : String!
	var code : String!
	var codeDetail : String!
	var included : Bool!
	var mealPlanCode : String!
	var proximityCode : String!
	var quantity : String!
	var service : [JService]!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		if let featuresData = dictionary["Features"] as? [String:Any]{
			features = JFeature(fromDictionary: featuresData)
		}
		businessServiceCode = dictionary["_BusinessServiceCode"] as? String
		code = dictionary["_Code"] as? String
		codeDetail = dictionary["_CodeDetail"] as? String
		included = dictionary["_Included"] as? Bool
		mealPlanCode = dictionary["_MealPlanCode"] as? String
		proximityCode = dictionary["_ProximityCode"] as? String
		quantity = dictionary["_Quantity"] as? String
		service = [JService]()
		if let serviceArray = dictionary["Service"] as? [[String:Any]]{
			for dic in serviceArray{
				let value = JService(fromDictionary: dic)
				service.append(value)
			}
		}
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if features != nil{
			dictionary["Features"] = features.toDictionary()
		}
		if businessServiceCode != nil{
			dictionary["_BusinessServiceCode"] = businessServiceCode
		}
		if code != nil{
			dictionary["_Code"] = code
		}
		if codeDetail != nil{
			dictionary["_CodeDetail"] = codeDetail
		}
		if included != nil{
			dictionary["_Included"] = included
		}
		if mealPlanCode != nil{
			dictionary["_MealPlanCode"] = mealPlanCode
		}
		if proximityCode != nil{
			dictionary["_ProximityCode"] = proximityCode
		}
		if quantity != nil{
			dictionary["_Quantity"] = quantity
		}
		if service != nil{
			var dictionaryElements = [[String:Any]]()
			for serviceElement in service {
				dictionaryElements.append(serviceElement.toDictionary())
			}
			dictionary["Service"] = dictionaryElements
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         features = aDecoder.decodeObject(forKey: "Features") as? JFeature
         businessServiceCode = aDecoder.decodeObject(forKey: "_BusinessServiceCode") as? String
         code = aDecoder.decodeObject(forKey: "_Code") as? String
         codeDetail = aDecoder.decodeObject(forKey: "_CodeDetail") as? String
         included = aDecoder.decodeObject(forKey: "_Included") as? Bool
         mealPlanCode = aDecoder.decodeObject(forKey: "_MealPlanCode") as? String
         proximityCode = aDecoder.decodeObject(forKey: "_ProximityCode") as? String
         quantity = aDecoder.decodeObject(forKey: "_Quantity") as? String
         service = aDecoder.decodeObject(forKey :"Service") as? [JService]

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if features != nil{
			aCoder.encode(features, forKey: "Features")
		}
		if businessServiceCode != nil{
			aCoder.encode(businessServiceCode, forKey: "_BusinessServiceCode")
		}
		if code != nil{
			aCoder.encode(code, forKey: "_Code")
		}
		if codeDetail != nil{
			aCoder.encode(codeDetail, forKey: "_CodeDetail")
		}
		if included != nil{
			aCoder.encode(included, forKey: "_Included")
		}
		if mealPlanCode != nil{
			aCoder.encode(mealPlanCode, forKey: "_MealPlanCode")
		}
		if proximityCode != nil{
			aCoder.encode(proximityCode, forKey: "_ProximityCode")
		}
		if quantity != nil{
			aCoder.encode(quantity, forKey: "_Quantity")
		}
		if service != nil{
			aCoder.encode(service, forKey: "Service")
		}

	}

}