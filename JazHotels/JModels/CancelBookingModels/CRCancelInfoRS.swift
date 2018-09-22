//
//	CRCancelInfoRS.swift
//
//	Create by Nada Gamal on 22/9/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class CRCancelInfoRS : NSObject, NSCoding{

	var CancelRules : CRCancelRule!
	var UniqueID : CRUniqueID!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		if let CancelRulesData = dictionary["CancelRules"] as? [String:Any]{
			CancelRules = CRCancelRule(fromDictionary: CancelRulesData)
		}
		if let UniqueIDData = dictionary["UniqueID"] as? [String:Any]{
			UniqueID = CRUniqueID(fromDictionary: UniqueIDData)
		}
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if CancelRules != nil{
			dictionary["CancelRules"] = CancelRules.toDictionary()
		}
		if UniqueID != nil{
			dictionary["UniqueID"] = UniqueID.toDictionary()
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         CancelRules = aDecoder.decodeObject(forKey: "CancelRules") as? CRCancelRule
         UniqueID = aDecoder.decodeObject(forKey: "UniqueID") as? CRUniqueID

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if CancelRules != nil{
			aCoder.encode(CancelRules, forKey: "CancelRules")
		}
		if UniqueID != nil{
			aCoder.encode(UniqueID, forKey: "UniqueID")
		}

	}

}