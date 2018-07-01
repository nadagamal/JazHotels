//
//	JCPaymentPolicy.swift
//
//	Create by Nada Gamal on 1/7/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

class JCPaymentPolicy{

	var guaranteePayment : JCGuaranteePayment!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		if let guaranteePaymentData = dictionary["GuaranteePayment"] as? [String:Any]{
			guaranteePayment = JCGuaranteePayment(fromDictionary: guaranteePaymentData)
		}
	}

}