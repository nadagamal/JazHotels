//
//	CBGuarantee.swift
//
//	Create by Nada Gamal on 18/9/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class CBGuarantee : NSObject, NSCoding{

	var guaranteesAccepted : CBGuaranteesAccepted!
	var guaranteeDescription : CBPenaltyDescription!
	var guaranteeCode : String!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		if let guaranteesAcceptedData = dictionary["GuaranteesAccepted"] as? [String:Any]{
			guaranteesAccepted = CBGuaranteesAccepted(fromDictionary: guaranteesAcceptedData)
		}
		if let guaranteeDescriptionData = dictionary["GuaranteeDescription"] as? [String:Any]{
			guaranteeDescription = CBPenaltyDescription(fromDictionary: guaranteeDescriptionData)
		}
		guaranteeCode = dictionary["_GuaranteeCode"] as? String
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if guaranteesAccepted != nil{
			dictionary["GuaranteesAccepted"] = guaranteesAccepted.toDictionary()
		}
		if guaranteeDescription != nil{
			dictionary["GuaranteeDescription"] = guaranteeDescription.toDictionary()
		}
		if guaranteeCode != nil{
			dictionary["_GuaranteeCode"] = guaranteeCode
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         guaranteesAccepted = aDecoder.decodeObject(forKey: "GuaranteesAccepted") as? CBGuaranteesAccepted
         guaranteeDescription = aDecoder.decodeObject(forKey: "GuaranteeDescription") as? CBPenaltyDescription
         guaranteeCode = aDecoder.decodeObject(forKey: "_GuaranteeCode") as? String

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if guaranteesAccepted != nil{
			aCoder.encode(guaranteesAccepted, forKey: "GuaranteesAccepted")
		}
		if guaranteeDescription != nil{
			aCoder.encode(guaranteeDescription, forKey: "GuaranteeDescription")
		}
		if guaranteeCode != nil{
			aCoder.encode(guaranteeCode, forKey: "_GuaranteeCode")
		}

	}

}