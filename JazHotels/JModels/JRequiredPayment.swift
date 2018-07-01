//
//	JRequiredPayment.swift
//
//	Create by Nada Gamal on 1/7/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

class JRequiredPayment{

	var paymentCode : String!
	var acceptedPayments : JAcceptedPayment!
	var deadline : JDeadline!
	var paymentDescription : JPenaltyDescription!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		paymentCode = dictionary["_PaymentCode"] as? String
		if let acceptedPaymentsData = dictionary["AcceptedPayments"] as? [String:Any]{
			acceptedPayments = JAcceptedPayment(fromDictionary: acceptedPaymentsData)
		}
		if let deadlineData = dictionary["Deadline"] as? [String:Any]{
			deadline = JDeadline(fromDictionary: deadlineData)
		}
		if let paymentDescriptionData = dictionary["PaymentDescription"] as? [String:Any]{
			paymentDescription = JPenaltyDescription(fromDictionary: paymentDescriptionData)
		}
	}

}
