//
//	JBRatePlan.swift
//
//	Create by Nada Gamal on 9/9/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

class JBRatePlan{

	var additionalDetails : JBAdditionalDetail!
	var cancelPenalties : JBCancelPenalty!
	var guarantee : JBGuarantee!
	var priceViewableInd : Bool!
	var ratePlanCode : String!
	var ratePlanName : String!
	var ratePlan : JBRatePlan!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		if let additionalDetailsData = dictionary["AdditionalDetails"] as? [String:Any]{
			additionalDetails = JBAdditionalDetail(fromDictionary: additionalDetailsData)
		}
		if let cancelPenaltiesData = dictionary["CancelPenalties"] as? [String:Any]{
			cancelPenalties = JBCancelPenalty(fromDictionary: cancelPenaltiesData)
		}
		if let guaranteeData = dictionary["Guarantee"] as? [String:Any]{
			guarantee = JBGuarantee(fromDictionary: guaranteeData)
		}
		priceViewableInd = dictionary["_PriceViewableInd"] as? Bool
		ratePlanCode = dictionary["_RatePlanCode"] as? String
		ratePlanName = dictionary["_RatePlanName"] as? String
		if let ratePlanData = dictionary["RatePlan"] as? [String:Any]{
			ratePlan = JBRatePlan(fromDictionary: ratePlanData)
		}
	}

}