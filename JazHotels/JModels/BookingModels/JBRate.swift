//
//	JBRate.swift
//
//	Create by Nada Gamal on 9/9/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

class JBRate{

	var base : JBBase!
	var fees : JBFee!
	var taxes : JBTaxe!
	var total : JBTotal!
	var tpaExtensions : JBTpaExtension!
	var rate : JBRate!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		if let baseData = dictionary["Base"] as? [String:Any]{
			base = JBBase(fromDictionary: baseData)
		}
		if let feesData = dictionary["Fees"] as? [String:Any]{
			fees = JBFee(fromDictionary: feesData)
		}
		if let taxesData = dictionary["Taxes"] as? [String:Any]{
			taxes = JBTaxe(fromDictionary: taxesData)
		}
		if let totalData = dictionary["Total"] as? [String:Any]{
			total = JBTotal(fromDictionary: totalData)
		}
		if let tpaExtensionsData = dictionary["Tpa_Extensions"] as? [String:Any]{
			tpaExtensions = JBTpaExtension(fromDictionary: tpaExtensionsData)
		}
		if let rateData = dictionary["Rate"] as? [String:Any]{
			rate = JBRate(fromDictionary: rateData)
		}
	}

}