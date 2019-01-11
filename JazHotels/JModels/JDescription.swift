//
//	JDescription.swift
//
//	Create by Nada Gamal on 1/7/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class JDescription : NSObject, NSCoding{

	var language : String!
	var text : String!
	var multimediaDescriptions : JMultimediaDescription!
    var multimediaDescription : JMultimediaDescription!
	var descriptionField : JDescription!
	var textt : String!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		language = dictionary["_Language"] as? String
		textt = dictionary["__text"] as? String
		if let multimediaDescriptionsData = dictionary["MultimediaDescriptions"] as? [String:Any]{
			multimediaDescriptions = JMultimediaDescription(fromDictionary: multimediaDescriptionsData)
		}
		if let descriptionFieldData = dictionary["Description"] as? [String:Any]{
			descriptionField = JDescription(fromDictionary: descriptionFieldData)
		}
		text = dictionary["Text"] as? String
        
        if let multimediaDescriptionsData = dictionary["MultimediaDescription"] as? [String:Any]{
            multimediaDescription = JMultimediaDescription(fromDictionary: multimediaDescriptionsData)
        }
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if language != nil{
			dictionary["_Language"] = language
		}
		if textt != nil{
			dictionary["__text"] = text
		}
		if multimediaDescriptions != nil{
			dictionary["MultimediaDescriptions"] = multimediaDescriptions.toDictionary()
		}
		if descriptionField != nil{
			dictionary["Description"] = descriptionField.toDictionary()
		}
		if text != nil{
			dictionary["Text"] = text
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         language = aDecoder.decodeObject(forKey: "_Language") as? String
         textt = aDecoder.decodeObject(forKey: "__text") as? String
         multimediaDescriptions = aDecoder.decodeObject(forKey: "MultimediaDescriptions") as? JMultimediaDescription
         descriptionField = aDecoder.decodeObject(forKey: "Description") as? JDescription
         text = aDecoder.decodeObject(forKey: "Text") as? String

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if language != nil{
			aCoder.encode(language, forKey: "_Language")
		}
		if textt != nil{
			aCoder.encode(text, forKey: "__text")
		}
		if multimediaDescriptions != nil{
			aCoder.encode(multimediaDescriptions, forKey: "MultimediaDescriptions")
		}
		if descriptionField != nil{
			aCoder.encode(descriptionField, forKey: "Description")
		}
		if text != nil{
			aCoder.encode(text, forKey: "Text")
		}

	}

}
