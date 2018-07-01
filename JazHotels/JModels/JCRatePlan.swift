//
//	JCRatePlan.swift
//
//	Create by Nada Gamal on 1/7/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

class JCRatePlan{

	var cancelPenalties : JCCancelPenalty!
	var guarantee : JCGuarantee!
	var mealsIncluded : JCMealsIncluded!
	var ratePlanDescription : JCRatePlanDescription!
	var ratePlanCode : String!
	var ratePlanName : String!
	var ratePlan : [JCRatePlan]!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		if let cancelPenaltiesData = dictionary["CancelPenalties"] as? [String:Any]{
			cancelPenalties = JCCancelPenalty(fromDictionary: cancelPenaltiesData)
		}
		if let guaranteeData = dictionary["Guarantee"] as? [String:Any]{
			guarantee = JCGuarantee(fromDictionary: guaranteeData)
		}
		if let mealsIncludedData = dictionary["MealsIncluded"] as? [String:Any]{
			mealsIncluded = JCMealsIncluded(fromDictionary: mealsIncludedData)
		}
		if let ratePlanDescriptionData = dictionary["RatePlanDescription"] as? [String:Any]{
			ratePlanDescription = JCRatePlanDescription(fromDictionary: ratePlanDescriptionData)
		}
		ratePlanCode = dictionary["_RatePlanCode"] as? String
		ratePlanName = dictionary["_RatePlanName"] as? String
		ratePlan = [JCRatePlan]()
		if let ratePlanArray = dictionary["RatePlan"] as? [[String:Any]]{
			for dic in ratePlanArray{
				let value = JCRatePlan(fromDictionary: dic)
				ratePlan.append(value)
			}
		}
	}

}