//
//	CBError.swift
//
//	Create by Nada Gamal on 18/9/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class CBError : NSObject, NSCoding{

	var code : String!
	var recordID : String!
	var shortText : String!
	var error : CBError!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		code = dictionary["_Code"] as? String
		recordID = dictionary["_RecordID"] as? String
		shortText = dictionary["_ShortText"] as? String
		if let errorData = dictionary["Error"] as? [String:Any]{
			error = CBError(fromDictionary: errorData)
		}
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if code != nil{
			dictionary["_Code"] = code
		}
		if recordID != nil{
			dictionary["_RecordID"] = recordID
		}
		if shortText != nil{
			dictionary["_ShortText"] = shortText
		}
		if error != nil{
			dictionary["Error"] = error.toDictionary()
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         code = aDecoder.decodeObject(forKey: "_Code") as? String
         recordID = aDecoder.decodeObject(forKey: "_RecordID") as? String
         shortText = aDecoder.decodeObject(forKey: "_ShortText") as? String
         error = aDecoder.decodeObject(forKey: "Error") as? CBError

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if code != nil{
			aCoder.encode(code, forKey: "_Code")
		}
		if recordID != nil{
			aCoder.encode(recordID, forKey: "_RecordID")
		}
		if shortText != nil{
			aCoder.encode(shortText, forKey: "_ShortText")
		}
		if error != nil{
			aCoder.encode(error, forKey: "Error")
		}

	}

}