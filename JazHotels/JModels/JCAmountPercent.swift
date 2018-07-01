//
//	JCAmountPercent.swift
//
//	Create by Nada Gamal on 1/7/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

class JCAmountPercent{

	var nmbrOfNights : String!
	var taxInclusive : Bool!
	var amount : String!
	var currencyCode : String!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		nmbrOfNights = dictionary["_NmbrOfNights"] as? String
		taxInclusive = dictionary["_TaxInclusive"] as? Bool
		amount = dictionary["_Amount"] as? String
		currencyCode = dictionary["_CurrencyCode"] as? String
	}

}