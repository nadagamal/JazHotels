//
//	JBTimeSpan.swift
//
//	Create by Nada Gamal on 9/9/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

class JBTimeSpan{

	var duration : String!
	var end : String!
	var start : String!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		duration = dictionary["_Duration"] as? String
		end = dictionary["_End"] as? String
		start = dictionary["_Start"] as? String
	}

}