//
//	JBCancelPenalty.swift
//
//	Create by Nada Gamal on 9/9/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

class JBCancelPenalty{

	var amountPercent : JBAmountPercent!
	var penaltyDescription : JBPenaltyDescription!
	var policyCode : String!
	var cancelPenalty : JBCancelPenalty!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		if let amountPercentData = dictionary["AmountPercent"] as? [String:Any]{
			amountPercent = JBAmountPercent(fromDictionary: amountPercentData)
		}
		if let penaltyDescriptionData = dictionary["PenaltyDescription"] as? [String:Any]{
			penaltyDescription = JBPenaltyDescription(fromDictionary: penaltyDescriptionData)
		}
		policyCode = dictionary["_PolicyCode"] as? String
		if let cancelPenaltyData = dictionary["CancelPenalty"] as? [String:Any]{
			cancelPenalty = JBCancelPenalty(fromDictionary: cancelPenaltyData)
		}
	}

}