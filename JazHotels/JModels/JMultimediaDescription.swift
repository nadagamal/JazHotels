//
//	JMultimediaDescription.swift
//
//	Create by Nada Gamal on 1/7/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

class JMultimediaDescription{

	var textItems : JTextItem!
	var multimediaDescrip : JMultimediaDescription!
	var additionalDetailCode : String!
	var multimediaDescription : [JMultimediaDescription]!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		if let textItemsData = dictionary["TextItems"] as? [String:Any]{
			textItems = JTextItem(fromDictionary: textItemsData)
		}
		if let multimediaDescriptionData = dictionary["MultimediaDescription"] as? [String:Any]{
			multimediaDescrip = JMultimediaDescription(fromDictionary: multimediaDescriptionData)
		}
		additionalDetailCode = dictionary["_AdditionalDetailCode"] as? String
		multimediaDescription = [JMultimediaDescription]()
		if let multimediaDescriptionArray = dictionary["MultimediaDescription"] as? [[String:Any]]{
			for dic in multimediaDescriptionArray{
				let value = JMultimediaDescription(fromDictionary: dic)
				multimediaDescription.append(value)
			}
		}
	}

}
