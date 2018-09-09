//
//	JBAmountPercent.swift
//
//	Create by Nada Gamal on 9/9/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

class JBAmountPercent{

	var amount : String!
	var currencyCode : String!
	var taxInclusive : Bool!
	var percent : String!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		amount = dictionary["_Amount"] as? String
		currencyCode = dictionary["_CurrencyCode"] as? String
		taxInclusive = dictionary["_TaxInclusive"] as? Bool
		percent = dictionary["_Percent"] as? String
	}

}