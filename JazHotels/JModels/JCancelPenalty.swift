//
//	JCancelPenalty.swift
//
//	Create by Nada Gamal on 1/7/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

class JCancelPenalty{

	var policyCode : String!
	var deadline : JDeadline!
	var penaltyDescription : JPenaltyDescription!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		policyCode = dictionary["_PolicyCode"] as? String
		if let deadlineData = dictionary["Deadline"] as? [String:Any]{
			deadline = JDeadline(fromDictionary: deadlineData)
		}
		if let penaltyDescriptionData = dictionary["PenaltyDescription"] as? [String:Any]{
			penaltyDescription = JPenaltyDescription(fromDictionary: penaltyDescriptionData)
		}
	}

}
