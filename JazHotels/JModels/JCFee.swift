//
//	JCFee.swift
//
//	Create by Nada Gamal on 1/7/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

class JCFee{

	var amount : String!
	var currencyCode : String!
	var fee : JCFee!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		amount = dictionary["_Amount"] as? String
		currencyCode = dictionary["_CurrencyCode"] as? String
		if let feeData = dictionary["Fee"] as? [String:Any]{
			fee = JCFee(fromDictionary: feeData)
		}
	}

}