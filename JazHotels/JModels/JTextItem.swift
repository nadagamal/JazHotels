//
//	JTextItem.swift
//
//	Create by Nada Gamal on 1/7/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class JTextItem : NSObject, NSCoding{

	var descriptionField : JDescription!
	var title : String!
	var textItemm : JTextItem!
	var textItem : [JTextItem]!
	var descriptionFieldd : String!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		if let descriptionFieldData = dictionary["Description"] as? [String:Any]{
			descriptionField = JDescription(fromDictionary: descriptionFieldData)
		}
		title = dictionary["_Title"] as? String
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
		descriptionFieldd = dictionary["Description"] as? String
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if descriptionField != nil{
			dictionary["Description"] = descriptionField.toDictionary()
		}
		if title != nil{
			dictionary["_Title"] = title
		}
		if textItemm != nil{
			dictionary["TextItem"] = textItemm.toDictionary()
		}
		if textItem != nil{
			var dictionaryElements = [[String:Any]]()
			for textItemElement in textItem {
				dictionaryElements.append(textItemElement.toDictionary())
			}
			dictionary["TextItem"] = dictionaryElements
		}
		if descriptionField != nil{
			dictionary["Description"] = descriptionFieldd
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         descriptionField = aDecoder.decodeObject(forKey: "Description") as? JDescription
         title = aDecoder.decodeObject(forKey: "_Title") as? String
         textItemm = aDecoder.decodeObject(forKey: "TextItem") as? JTextItem
         textItem = aDecoder.decodeObject(forKey :"TextItem") as? [JTextItem]
         descriptionFieldd = aDecoder.decodeObject(forKey: "Description") as? String

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if descriptionField != nil{
			aCoder.encode(descriptionField, forKey: "Description")
		}
		if title != nil{
			aCoder.encode(title, forKey: "_Title")
		}
		if textItemm != nil{
			aCoder.encode(textItem, forKey: "TextItem")
		}
		if textItem != nil{
			aCoder.encode(textItem, forKey: "TextItem")
		}
		if descriptionFieldd != nil{
			aCoder.encode(descriptionField, forKey: "Description")
		}

	}

}
