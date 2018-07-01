//
//	JRecreation.swift
//
//	Create by Nada Gamal on 1/7/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

class JRecreation{

	var code : String!
	var codeDetail : String!
	var proximityCode : String!
	var recreation : [JRecreation]!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		code = dictionary["_Code"] as? String
		codeDetail = dictionary["_CodeDetail"] as? String
		proximityCode = dictionary["_ProximityCode"] as? String
		recreation = [JRecreation]()
		if let recreationArray = dictionary["Recreation"] as? [[String:Any]]{
			for dic in recreationArray{
				let value = JRecreation(fromDictionary: dic)
				recreation.append(value)
			}
		}
	}

}
