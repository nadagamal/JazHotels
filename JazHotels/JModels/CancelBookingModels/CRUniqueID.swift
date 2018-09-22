//
//	CRUniqueID.swift
//
//	Create by Nada Gamal on 22/9/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class CRUniqueID : NSObject, NSCoding{

	var ID : String!
	var IDContext : String!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		ID = dictionary["_ID"] as? String
		IDContext = dictionary["_ID_Context"] as? String
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if ID != nil{
			dictionary["_ID"] = ID
		}
		if IDContext != nil{
			dictionary["_ID_Context"] = IDContext
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         ID = aDecoder.decodeObject(forKey: "_ID") as? String
         IDContext = aDecoder.decodeObject(forKey: "_ID_Context") as? String

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if ID != nil{
			aCoder.encode(ID, forKey: "_ID")
		}
		if IDContext != nil{
			aCoder.encode(IDContext, forKey: "_ID_Context")
		}

	}

}