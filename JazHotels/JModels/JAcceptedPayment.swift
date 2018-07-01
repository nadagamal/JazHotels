//
//	JAcceptedPayment.swift
//
//	Create by Nada Gamal on 1/7/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

class JAcceptedPayment{

	var paymentCard : JPaymentCard!
	var acceptedPayment : [JAcceptedPayment]!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		if let paymentCardData = dictionary["PaymentCard"] as? [String:Any]{
			paymentCard = JPaymentCard(fromDictionary: paymentCardData)
		}
		acceptedPayment = [JAcceptedPayment]()
		if let acceptedPaymentArray = dictionary["AcceptedPayment"] as? [[String:Any]]{
			for dic in acceptedPaymentArray{
				let value = JAcceptedPayment(fromDictionary: dic)
				acceptedPayment.append(value)
			}
		}
	}

}