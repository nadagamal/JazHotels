//
//	JBAdditionalDetail.swift
//
//	Create by Nada Gamal on 9/9/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class JBAdditionalDetail : NSObject, NSCoding{

	var code : String!
	var detailDescription : JBPenaltyDescription!
	var additionalDetail : [JBAdditionalDetail]!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		code = dictionary["Code"] as? String
		if let detailDescriptionData = dictionary["DetailDescription"] as? [String:Any]{
			detailDescription = JBPenaltyDescription(fromDictionary: detailDescriptionData)
		}
		additionalDetail = [JBAdditionalDetail]()
		if let additionalDetailArray = dictionary["AdditionalDetail"] as? [[String:Any]]{
			for dic in additionalDetailArray{
				let value = JBAdditionalDetail(fromDictionary: dic)
				additionalDetail.append(value)
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
			dictionary["Code"] = code
		}
		if detailDescription != nil{
			dictionary["DetailDescription"] = detailDescription.toDictionary()
		}
		if additionalDetail != nil{
			var dictionaryElements = [[String:Any]]()
			for additionalDetailElement in additionalDetail {
				dictionaryElements.append(additionalDetailElement.toDictionary())
			}
			dictionary["AdditionalDetail"] = dictionaryElements
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         code = aDecoder.decodeObject(forKey: "Code") as? String
         detailDescription = aDecoder.decodeObject(forKey: "DetailDescription") as? JBPenaltyDescription
         additionalDetail = aDecoder.decodeObject(forKey :"AdditionalDetail") as? [JBAdditionalDetail]

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if code != nil{
			aCoder.encode(code, forKey: "Code")
		}
		if detailDescription != nil{
			aCoder.encode(detailDescription, forKey: "DetailDescription")
		}
		if additionalDetail != nil{
			aCoder.encode(additionalDetail, forKey: "AdditionalDetail")
		}

	}

}