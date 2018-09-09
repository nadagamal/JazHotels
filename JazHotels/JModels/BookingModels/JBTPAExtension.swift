//
//	JBTpaExtension.swift
//
//	Create by Nada Gamal on 9/9/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

class JBTpaExtension{

	var nightlyRate : [JBNightlyRate]!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		nightlyRate = [JBNightlyRate]()
		if let nightlyRateArray = dictionary["NightlyRate"] as? [[String:Any]]{
			for dic in nightlyRateArray{
				let value = JBNightlyRate(fromDictionary: dic)
				nightlyRate.append(value)
			}
		}
	}

}