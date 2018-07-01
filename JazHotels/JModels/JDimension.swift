//
//	JDimension.swift
//
//	Create by Nada Gamal on 1/7/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

class JDimension{

	var area : String!
	var height : String!
	var length : String!
	var width : String!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		area = dictionary["_Area"] as? String
		height = dictionary["_Height"] as? String
		length = dictionary["_Length"] as? String
		width = dictionary["_Width"] as? String
	}

}
