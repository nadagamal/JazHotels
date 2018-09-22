//
//	MRAdditionalDetail.swift
//
//	Create by Nada Gamal on 22/9/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class MRAdditionalDetail : NSObject, NSCoding{

	var DetailDescription : MRPenaltyDescription!
	var Code : String!
	var AdditionalDetail : [MRAdditionalDetail]!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		if let DetailDescriptionData = dictionary["DetailDescription"] as? [String:Any]{
			DetailDescription = MRPenaltyDescription(fromDictionary: DetailDescriptionData)
		}
		Code = dictionary["_Code"] as? String
		AdditionalDetail = [MRAdditionalDetail]()
		if let AdditionalDetailArray = dictionary["AdditionalDetail"] as? [[String:Any]]{
			for dic in AdditionalDetailArray{
				let value = MRAdditionalDetail(fromDictionary: dic)
				AdditionalDetail.append(value)
			}
		}
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if DetailDescription != nil{
			dictionary["DetailDescription"] = DetailDescription.toDictionary()
		}
		if Code != nil{
			dictionary["_Code"] = Code
		}
		if AdditionalDetail != nil{
			var dictionaryElements = [[String:Any]]()
			for AdditionalDetailElement in AdditionalDetail {
				dictionaryElements.append(AdditionalDetailElement.toDictionary())
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
         DetailDescription = aDecoder.decodeObject(forKey: "DetailDescription") as? MRPenaltyDescription
         Code = aDecoder.decodeObject(forKey: "_Code") as? String
         AdditionalDetail = aDecoder.decodeObject(forKey :"AdditionalDetail") as? [MRAdditionalDetail]

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if DetailDescription != nil{
			aCoder.encode(DetailDescription, forKey: "DetailDescription")
		}
		if Code != nil{
			aCoder.encode(Code, forKey: "_Code")
		}
		if AdditionalDetail != nil{
			aCoder.encode(AdditionalDetail, forKey: "AdditionalDetail")
		}

	}

}