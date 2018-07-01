//
//	JImageItem.swift
//
//	Create by Nada Gamal on 1/7/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class JImageItem : NSObject, NSCoding{

	var imageFormat : JURL!
	var imageItem : JImageItem!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		if let imageFormatData = dictionary["ImageFormat"] as? [String:Any]{
			imageFormat = JURL(fromDictionary: imageFormatData)
		}
		if let imageItemData = dictionary["ImageItem"] as? [String:Any]{
			imageItem = JImageItem(fromDictionary: imageItemData)
		}
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if imageFormat != nil{
			dictionary["ImageFormat"] = imageFormat.toDictionary()
		}
		if imageItem != nil{
			dictionary["ImageItem"] = imageItem.toDictionary()
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         imageFormat = aDecoder.decodeObject(forKey: "ImageFormat") as? JURL
         imageItem = aDecoder.decodeObject(forKey: "ImageItem") as? JImageItem

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if imageFormat != nil{
			aCoder.encode(imageFormat, forKey: "ImageFormat")
		}
		if imageItem != nil{
			aCoder.encode(imageItem, forKey: "ImageItem")
		}

	}

}