//
//	JPolicy.swift
//
//	Create by Nada Gamal on 1/7/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

class JPolicy{

	var cancelPolicy : JCancelPolicy!
	var commissionPolicy : JCommissionPolicy!
	var paymentPolicy : JPaymentPolicy!
	var petsPolicies : JCommissionPolicy!
	var policyInfo : JPolicyInfo!
	var policy : JPolicy!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		if let cancelPolicyData = dictionary["CancelPolicy"] as? [String:Any]{
			cancelPolicy = JCancelPolicy(fromDictionary: cancelPolicyData)
		}
		if let commissionPolicyData = dictionary["CommissionPolicy"] as? [String:Any]{
			commissionPolicy = JCommissionPolicy(fromDictionary: commissionPolicyData)
		}
		if let paymentPolicyData = dictionary["PaymentPolicy"] as? [String:Any]{
			paymentPolicy = JPaymentPolicy(fromDictionary: paymentPolicyData)
		}
		if let petsPoliciesData = dictionary["PetsPolicies"] as? [String:Any]{
			petsPolicies = JCommissionPolicy(fromDictionary: petsPoliciesData)
		}
		if let policyInfoData = dictionary["PolicyInfo"] as? [String:Any]{
			policyInfo = JPolicyInfo(fromDictionary: policyInfoData)
		}
		if let policyData = dictionary["Policy"] as? [String:Any]{
			policy = JPolicy(fromDictionary: policyData)
		}
	}

}