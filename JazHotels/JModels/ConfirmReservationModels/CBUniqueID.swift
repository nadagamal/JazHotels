//
//	CBUniqueID.swift
//
//	Create by Nada Gamal on 18/9/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class CBUniqueID : NSObject, NSCoding{

	var iD : String!
	var iDContext : String!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		iD = dictionary["_ID"] as? String
		iDContext = dictionary["_ID_Context"] as? String
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if iD != nil{
			dictionary["_ID"] = iD
		}
		if iDContext != nil{
			dictionary["_ID_Context"] = iDContext
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         iD = aDecoder.decodeObject(forKey: "_ID") as? String
         iDContext = aDecoder.decodeObject(forKey: "_ID_Context") as? String

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if iD != nil{
			aCoder.encode(iD, forKey: "_ID")
		}
		if iDContext != nil{
			aCoder.encode(iDContext, forKey: "_ID_Context")
		}

	}

}