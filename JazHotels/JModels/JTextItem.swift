//
//	JTextItem.swift
//
//	Create by Nada Gamal on 1/7/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

class JTextItem{

	var title : String!
	var descriptionFieldd : JDescription!
	var textItemm : JTextItem!
	var textItem : [JTextItem]!
	var descriptionField : String!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		title = dictionary["_Title"] as? String
		if let descriptionFieldData = dictionary["Description"] as? [String:Any]{
			descriptionFieldd = JDescription(fromDictionary: descriptionFieldData)
		}
		if let textItemData = dictionary["TextItem"] as? [String:Any]{
			textItemm = JTextItem(fromDictionary: textItemData)
		}
		textItem = [JTextItem]()
		if let textItemArray = dictionary["TextItem"] as? [[String:Any]]{
			for dic in textItemArray{
				let value = JTextItem(fromDictionary: dic)
				textItem.append(value)
			}
		}
		descriptionField = dictionary["Description"] as? String
	}

}
