//
//	JCWarning.swift
//
//	Create by Nada Gamal on 1/7/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

class JCWarning{

	var code : String!
	var shortText : String!
	var type : String!
	var text : String!
	var warning : JCWarning!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		code = dictionary["_Code"] as? String
		shortText = dictionary["_ShortText"] as? String
		type = dictionary["_Type"] as? String
		text = dictionary["__text"] as? String
		if let warningData = dictionary["Warning"] as? [String:Any]{
			warning = JCWarning(fromDictionary: warningData)
		}
	}

}