//
//	JCommissionPolicy.swift
//
//	Create by Nada Gamal on 1/7/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

class JCommissionPolicy{

	var descriptionField : JDescription!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		if let descriptionFieldData = dictionary["Description"] as? [String:Any]{
			descriptionField = JDescription(fromDictionary: descriptionFieldData)
		}
	}

}