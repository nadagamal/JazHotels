//
//	JCCancelPenalty.swift
//
//	Create by Nada Gamal on 1/7/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

class JCCancelPenalty{

	var amountPercent : JCAmountPercent!
	var deadline : JCDeadline!
	var penaltyDescription : JCPenaltyDescription!
	var policyCode : String!
	var cancelPenalty : JCCancelPenalty!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		if let amountPercentData = dictionary["AmountPercent"] as? [String:Any]{
			amountPercent = JCAmountPercent(fromDictionary: amountPercentData)
		}
		if let deadlineData = dictionary["Deadline"] as? [String:Any]{
			deadline = JCDeadline(fromDictionary: deadlineData)
		}
		if let penaltyDescriptionData = dictionary["PenaltyDescription"] as? [String:Any]{
			penaltyDescription = JCPenaltyDescription(fromDictionary: penaltyDescriptionData)
		}
		policyCode = dictionary["_PolicyCode"] as? String
		if let cancelPenaltyData = dictionary["CancelPenalty"] as? [String:Any]{
			cancelPenalty = JCCancelPenalty(fromDictionary: cancelPenaltyData)
		}
	}

}