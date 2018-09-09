//
//	JBBase.swift
//
//	Create by Nada Gamal on 9/9/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

class JBBase{

	var amountAfterTax : String!
	var amountBeforeTax : String!
	var currencyCode : String!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		amountAfterTax = dictionary["_AmountAfterTax"] as? String
		amountBeforeTax = dictionary["_AmountBeforeTax"] as? String
		currencyCode = dictionary["_CurrencyCode"] as? String
	}

}