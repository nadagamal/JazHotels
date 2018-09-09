//
//	JBTotal.swift
//
//	Create by Nada Gamal on 9/9/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

class JBTotal{

	var taxes : JBTaxe!
	var amountAfterTax : String!
	var amountBeforeTax : String!
	var currencyCode : String!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		if let taxesData = dictionary["Taxes"] as? [String:Any]{
			taxes = JBTaxe(fromDictionary: taxesData)
		}
		amountAfterTax = dictionary["_AmountAfterTax"] as? String
		amountBeforeTax = dictionary["_AmountBeforeTax"] as? String
		currencyCode = dictionary["_CurrencyCode"] as? String
	}

}