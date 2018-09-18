//
//	CBAdditionalDetail.swift
//
//	Create by Nada Gamal on 18/9/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class CBAdditionalDetail : NSObject, NSCoding{

	var detailDescription : CBPenaltyDescription!
	var code : String!
	var additionalDetail : [CBAdditionalDetail]!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		if let detailDescriptionData = dictionary["DetailDescription"] as? [String:Any]{
			detailDescription = CBPenaltyDescription(fromDictionary: detailDescriptionData)
		}
		code = dictionary["_Code"] as? String
		additionalDetail = [CBAdditionalDetail]()
		if let additionalDetailArray = dictionary["AdditionalDetail"] as? [[String:Any]]{
			for dic in additionalDetailArray{
				let value = CBAdditionalDetail(fromDictionary: dic)
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
		if detailDescription != nil{
			dictionary["DetailDescription"] = detailDescription.toDictionary()
		}
		if code != nil{
			dictionary["_Code"] = code
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
         detailDescription = aDecoder.decodeObject(forKey: "DetailDescription") as? CBPenaltyDescription
         code = aDecoder.decodeObject(forKey: "_Code") as? String
         additionalDetail = aDecoder.decodeObject(forKey :"AdditionalDetail") as? [CBAdditionalDetail]

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if detailDescription != nil{
			aCoder.encode(detailDescription, forKey: "DetailDescription")
		}
		if code != nil{
			aCoder.encode(code, forKey: "_Code")
		}
		if additionalDetail != nil{
			aCoder.encode(additionalDetail, forKey: "AdditionalDetail")
		}

	}

}