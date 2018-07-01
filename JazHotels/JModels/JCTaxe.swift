//
//	JCTaxe.swift
//
//	Create by Nada Gamal on 1/7/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

class JCTaxe{

	var tax : [JCTax]!
	var amount : String!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		tax = [JCTax]()
		if let taxArray = dictionary["Tax"] as? [[String:Any]]{
			for dic in taxArray{
				let value = JCTax(fromDictionary: dic)
				tax.append(value)
			}
		}
		amount = dictionary["_Amount"] as? String
	}

}