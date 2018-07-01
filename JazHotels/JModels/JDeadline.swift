//
//	JDeadline.swift
//
//	Create by Nada Gamal on 1/7/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

class JDeadline{

	var offsetDropTime : String!
	var offsetTimeUnit : String!
	var offsetUnitMultiplier : String!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		offsetDropTime = dictionary["_OffsetDropTime"] as? String
		offsetTimeUnit = dictionary["_OffsetTimeUnit"] as? String
		offsetUnitMultiplier = dictionary["_OffsetUnitMultiplier"] as? String
	}

}
