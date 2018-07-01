//
//	JDescription.swift
//
//	Create by Nada Gamal on 1/7/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

class JDescription{

	var text : String!
	var language : String!
	var textt : String!
	var multimediaDescriptions : JMultimediaDescription!
	var descriptionField : JDescription!
	var renovation : JRenovation!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		textt = dictionary["#text"] as? String
		language = dictionary["_Language"] as? String
		text = dictionary["Text"] as? String
		if let multimediaDescriptionsData = dictionary["MultimediaDescriptions"] as? [String:Any]{
			multimediaDescriptions = JMultimediaDescription(fromDictionary: multimediaDescriptionsData)
		}
		if let descriptionFieldData = dictionary["Description"] as? [String:Any]{
			descriptionField = JDescription(fromDictionary: descriptionFieldData)
		}
		if let renovationData = dictionary["Renovation"] as? [String:Any]{
			renovation = JRenovation(fromDictionary: renovationData)
		}
	}

}
