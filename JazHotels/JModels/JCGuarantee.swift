//
//	JCGuarantee.swift
//
//	Create by Nada Gamal on 1/7/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

class JCGuarantee{

	var guaranteeDescription : JCPenaltyDescription!
	var guaranteeCode : String!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		if let guaranteeDescriptionData = dictionary["GuaranteeDescription"] as? [String:Any]{
			guaranteeDescription = JCPenaltyDescription(fromDictionary: guaranteeDescriptionData)
		}
		guaranteeCode = dictionary["_GuaranteeCode"] as? String
	}

}