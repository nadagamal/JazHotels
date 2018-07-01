//
//	JCGuaranteePayment.swift
//
//	Create by Nada Gamal on 1/7/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

class JCGuaranteePayment{

	var amountPercent : JCAmountPercent!
	var descriptionField : JCPenaltyDescription!
	var guaranteeCode : String!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		if let amountPercentData = dictionary["AmountPercent"] as? [String:Any]{
			amountPercent = JCAmountPercent(fromDictionary: amountPercentData)
		}
		if let descriptionFieldData = dictionary["Description"] as? [String:Any]{
			descriptionField = JCPenaltyDescription(fromDictionary: descriptionFieldData)
		}
		guaranteeCode = dictionary["_GuaranteeCode"] as? String
	}

}