//
//	JBGuarantee.swift
//
//	Create by Nada Gamal on 9/9/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class JBGuarantee : NSObject, NSCoding{

	var guaranteesAccepted : JBGuaranteesAccepted!
	var guaranteeCode : String!
	var guaranteeDescription : JBPenaltyDescription!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		if let guaranteesAcceptedData = dictionary["GuaranteesAccepted"] as? [String:Any]{
			guaranteesAccepted = JBGuaranteesAccepted(fromDictionary: guaranteesAcceptedData)
		}
		guaranteeCode = dictionary["GuaranteeCode"] as? String
		if let guaranteeDescriptionData = dictionary["GuaranteeDescription"] as? [String:Any]{
			guaranteeDescription = JBPenaltyDescription(fromDictionary: guaranteeDescriptionData)
		}
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
		if guaranteeCode != nil{
			dictionary["GuaranteeCode"] = guaranteeCode
		}
		if guaranteeDescription != nil{
			dictionary["GuaranteeDescription"] = guaranteeDescription.toDictionary()
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         guaranteesAccepted = aDecoder.decodeObject(forKey: "GuaranteesAccepted") as? JBGuaranteesAccepted
         guaranteeCode = aDecoder.decodeObject(forKey: "GuaranteeCode") as? String
         guaranteeDescription = aDecoder.decodeObject(forKey: "GuaranteeDescription") as? JBPenaltyDescription

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
		if guaranteeCode != nil{
			aCoder.encode(guaranteeCode, forKey: "GuaranteeCode")
		}
		if guaranteeDescription != nil{
			aCoder.encode(guaranteeDescription, forKey: "GuaranteeDescription")
		}

	}

}