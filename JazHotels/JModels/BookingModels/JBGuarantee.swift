//
//	JBGuarantee.swift
//
//	Create by Nada Gamal on 9/9/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

class JBGuarantee{

	var amountPercent : JBAmountPercent!
	var deadline : JBDeadline!
	var guaranteeDescription : JBPenaltyDescription!
	var guaranteeCode : String!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		if let amountPercentData = dictionary["AmountPercent"] as? [String:Any]{
			amountPercent = JBAmountPercent(fromDictionary: amountPercentData)
		}
		if let deadlineData = dictionary["Deadline"] as? [String:Any]{
			deadline = JBDeadline(fromDictionary: deadlineData)
		}
		if let guaranteeDescriptionData = dictionary["GuaranteeDescription"] as? [String:Any]{
			guaranteeDescription = JBPenaltyDescription(fromDictionary: guaranteeDescriptionData)
		}
		guaranteeCode = dictionary["_GuaranteeCode"] as? String
	}

}