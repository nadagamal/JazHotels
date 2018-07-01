//
//	JTypeRoom.swift
//
//	Create by Nada Gamal on 1/7/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class JTypeRoom : NSObject, NSCoding{

	var bedTypeCode : String!
	var maxRollaways : String!
	var roomViewCode : String!
	var standardNumBeds : String!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		bedTypeCode = dictionary["_BedTypeCode"] as? String
		maxRollaways = dictionary["_MaxRollaways"] as? String
		roomViewCode = dictionary["_RoomViewCode"] as? String
		standardNumBeds = dictionary["_StandardNumBeds"] as? String
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if bedTypeCode != nil{
			dictionary["_BedTypeCode"] = bedTypeCode
		}
		if maxRollaways != nil{
			dictionary["_MaxRollaways"] = maxRollaways
		}
		if roomViewCode != nil{
			dictionary["_RoomViewCode"] = roomViewCode
		}
		if standardNumBeds != nil{
			dictionary["_StandardNumBeds"] = standardNumBeds
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         bedTypeCode = aDecoder.decodeObject(forKey: "_BedTypeCode") as? String
         maxRollaways = aDecoder.decodeObject(forKey: "_MaxRollaways") as? String
         roomViewCode = aDecoder.decodeObject(forKey: "_RoomViewCode") as? String
         standardNumBeds = aDecoder.decodeObject(forKey: "_StandardNumBeds") as? String

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if bedTypeCode != nil{
			aCoder.encode(bedTypeCode, forKey: "_BedTypeCode")
		}
		if maxRollaways != nil{
			aCoder.encode(maxRollaways, forKey: "_MaxRollaways")
		}
		if roomViewCode != nil{
			aCoder.encode(roomViewCode, forKey: "_RoomViewCode")
		}
		if standardNumBeds != nil{
			aCoder.encode(standardNumBeds, forKey: "_StandardNumBeds")
		}

	}

}