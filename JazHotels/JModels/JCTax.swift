//
//	JCTax.swift
//
//	Create by Nada Gamal on 1/7/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

class JCTax{

	var amount : String!
	var currencyCode : String!
	var taxDescription : [JCRatePlanDescription]!
	var chargeFrequency : String!
	var code : String!
	var effectiveDate : String!
	var expireDate : String!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		amount = dictionary["_Amount"] as? String
		currencyCode = dictionary["_CurrencyCode"] as? String
		taxDescription = [JCRatePlanDescription]()
		if let taxDescriptionArray = dictionary["TaxDescription"] as? [[String:Any]]{
			for dic in taxDescriptionArray{
				let value = JCRatePlanDescription(fromDictionary: dic)
				taxDescription.append(value)
			}
		}
		chargeFrequency = dictionary["_ChargeFrequency"] as? String
		code = dictionary["_Code"] as? String
		effectiveDate = dictionary["_EffectiveDate"] as? String
		expireDate = dictionary["_ExpireDate"] as? String
	}

}