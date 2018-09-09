//
//	JBTaxe.swift
//
//	Create by Nada Gamal on 9/9/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

class JBTaxe{

	var tax : [JBTax]!
	var amount : String!
	var taxItem : JBTax!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		tax = [JBTax]()
		if let taxArray = dictionary["Tax"] as? [[String:Any]]{
			for dic in taxArray{
				let value = JBTax(fromDictionary: dic)
				tax.append(value)
			}
		}
		amount = dictionary["_Amount"] as? String
		if let taxData = dictionary["Tax"] as? [String:Any]{
			taxItem = JBTax(fromDictionary: taxData)
		}
	}

}
