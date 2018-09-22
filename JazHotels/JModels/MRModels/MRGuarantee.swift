//
//	MRGuarantee.swift
//
//	Create by Nada Gamal on 22/9/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class MRGuarantee : NSObject, NSCoding{

	var GuaranteeDescription : MRPenaltyDescription!
	var GuaranteeCode : String!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		if let GuaranteeDescriptionData = dictionary["GuaranteeDescription"] as? [String:Any]{
			GuaranteeDescription = MRPenaltyDescription(fromDictionary: GuaranteeDescriptionData)
		}
		GuaranteeCode = dictionary["_GuaranteeCode"] as? String
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if GuaranteeDescription != nil{
			dictionary["GuaranteeDescription"] = GuaranteeDescription.toDictionary()
		}
		if GuaranteeCode != nil{
			dictionary["_GuaranteeCode"] = GuaranteeCode
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         GuaranteeDescription = aDecoder.decodeObject(forKey: "GuaranteeDescription") as? MRPenaltyDescription
         GuaranteeCode = aDecoder.decodeObject(forKey: "_GuaranteeCode") as? String

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if GuaranteeDescription != nil{
			aCoder.encode(GuaranteeDescription, forKey: "GuaranteeDescription")
		}
		if GuaranteeCode != nil{
			aCoder.encode(GuaranteeCode, forKey: "_GuaranteeCode")
		}

	}

}