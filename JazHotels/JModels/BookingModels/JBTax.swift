//
//	JBTax.swift
//
//	Create by Nada Gamal on 9/9/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

class JBTax{

	var taxDescription : [JBTaxDescription]!
	var amount : String!
	var chargeFrequency : String!
	var code : String!
	var effectiveDate : String!
	var expireDate : String!
	var currencyCode : String!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		taxDescription = [JBTaxDescription]()
		if let taxDescriptionArray = dictionary["TaxDescription"] as? [[String:Any]]{
			for dic in taxDescriptionArray{
				let value = JBTaxDescription(fromDictionary: dic)
				taxDescription.append(value)
			}
		}
		amount = dictionary["_Amount"] as? String
		chargeFrequency = dictionary["_ChargeFrequency"] as? String
		code = dictionary["_Code"] as? String
		effectiveDate = dictionary["_EffectiveDate"] as? String
		expireDate = dictionary["_ExpireDate"] as? String
		currencyCode = dictionary["_CurrencyCode"] as? String
	}

}