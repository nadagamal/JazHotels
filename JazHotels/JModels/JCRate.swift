//
//	JCRate.swift
//
//	Create by Nada Gamal on 1/7/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

class JCRate{

	var base : JCBase!
	var cancelPolicies : JCCancelPolicy!
	var fees : JCFee!
	var paymentPolicies : JCPaymentPolicy!
	var taxes : JCTaxe!
	var total : JCTotal!
	var tpaExtensions : JCTpaExtension!
	var rate : JCRate!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		if let baseData = dictionary["Base"] as? [String:Any]{
			base = JCBase(fromDictionary: baseData)
		}
		if let cancelPoliciesData = dictionary["CancelPolicies"] as? [String:Any]{
			cancelPolicies = JCCancelPolicy(fromDictionary: cancelPoliciesData)
		}
		if let feesData = dictionary["Fees"] as? [String:Any]{
			fees = JCFee(fromDictionary: feesData)
		}
		if let paymentPoliciesData = dictionary["PaymentPolicies"] as? [String:Any]{
			paymentPolicies = JCPaymentPolicy(fromDictionary: paymentPoliciesData)
		}
		if let taxesData = dictionary["Taxes"] as? [String:Any]{
			taxes = JCTaxe(fromDictionary: taxesData)
		}
		if let totalData = dictionary["Total"] as? [String:Any]{
			total = JCTotal(fromDictionary: totalData)
		}
		if let tpaExtensionsData = dictionary["Tpa_Extensions"] as? [String:Any]{
			tpaExtensions = JCTpaExtension(fromDictionary: tpaExtensionsData)
		}
		if let rateData = dictionary["Rate"] as? [String:Any]{
			rate = JCRate(fromDictionary: rateData)
		}
	}

}
