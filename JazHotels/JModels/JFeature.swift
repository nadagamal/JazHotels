//
//	JFeature.swift
//
//	Create by Nada Gamal on 1/7/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

class JFeature{

	var accessibleCode : String!
	var codeDetail : String!
	var feature : [JFeature]!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		accessibleCode = dictionary["_AccessibleCode"] as? String
		codeDetail = dictionary["_CodeDetail"] as? String
		feature = [JFeature]()
		if let featureArray = dictionary["Feature"] as? [[String:Any]]{
			for dic in featureArray{
				let value = JFeature(fromDictionary: dic)
				feature.append(value)
			}
		}
	}

}
