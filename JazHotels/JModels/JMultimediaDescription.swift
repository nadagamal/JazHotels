//
//	JMultimediaDescription.swift
//
//	Create by Nada Gamal on 1/7/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class JMultimediaDescription : NSObject, NSCoding{

	var textItems : JTextItem!
    var textItem : JTextItem!
	var multimediaDescriptionn : JMultimediaDescription!
	var imageItems : JImageItem!
	var additionalDetailCode : String!
	var multimediaDescription : [JMultimediaDescription]!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		if let textItemsData = dictionary["TextItems"] as? [String:Any]{
			textItems = JTextItem(fromDictionary: textItemsData)
		}
        if let textItemsData = dictionary["TextItem"] as? [String:Any]{
            textItem = JTextItem(fromDictionary: textItemsData)
        }
		if let multimediaDescriptionData = dictionary["MultimediaDescription"] as? [String:Any]{
			multimediaDescriptionn = JMultimediaDescription(fromDictionary: multimediaDescriptionData)
		}
		if let imageItemsData = dictionary["ImageItems"] as? [String:Any]{
			imageItems = JImageItem(fromDictionary: imageItemsData)
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

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if textItems != nil{
			dictionary["TextItems"] = textItems.toDictionary()
		}
		if multimediaDescription != nil{
			dictionary["MultimediaDescription"] = multimediaDescriptionn.toDictionary()
		}
		if imageItems != nil{
			dictionary["ImageItems"] = imageItems.toDictionary()
		}
		if additionalDetailCode != nil{
			dictionary["_AdditionalDetailCode"] = additionalDetailCode
		}
		if multimediaDescription != nil{
			var dictionaryElements = [[String:Any]]()
			for multimediaDescriptionElement in multimediaDescription {
				dictionaryElements.append(multimediaDescriptionElement.toDictionary())
			}
			dictionary["MultimediaDescription"] = dictionaryElements
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         textItems = aDecoder.decodeObject(forKey: "TextItems") as? JTextItem
         multimediaDescriptionn = aDecoder.decodeObject(forKey: "MultimediaDescription") as? JMultimediaDescription
         imageItems = aDecoder.decodeObject(forKey: "ImageItems") as? JImageItem
         additionalDetailCode = aDecoder.decodeObject(forKey: "_AdditionalDetailCode") as? String
         multimediaDescription = aDecoder.decodeObject(forKey :"MultimediaDescription") as? [JMultimediaDescription]

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if textItems != nil{
			aCoder.encode(textItems, forKey: "TextItems")
		}
		if multimediaDescriptionn != nil{
			aCoder.encode(multimediaDescriptionn, forKey: "MultimediaDescription")
		}
		if imageItems != nil{
			aCoder.encode(imageItems, forKey: "ImageItems")
		}
		if additionalDetailCode != nil{
			aCoder.encode(additionalDetailCode, forKey: "_AdditionalDetailCode")
		}
		if multimediaDescription != nil{
			aCoder.encode(multimediaDescription, forKey: "MultimediaDescription")
		}

	}

}
