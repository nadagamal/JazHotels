//
//	JCNightlyRate.swift
//
//	Create by Nada Gamal on 1/7/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

class JCNightlyRate{

	var date : String!
	var fee : String!
	var price : String!
	var priceWithTaxAndFee : String!
	var tax : String!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		date = dictionary["_Date"] as? String
		fee = dictionary["_Fee"] as? String
		price = dictionary["_Price"] as? String
		priceWithTaxAndFee = dictionary["_PriceWithTaxAndFee"] as? String
		tax = dictionary["_Tax"] as? String
	}

}