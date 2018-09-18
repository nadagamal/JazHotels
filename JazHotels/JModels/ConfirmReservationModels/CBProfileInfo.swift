//
//	CBProfileInfo.swift
//
//	Create by Nada Gamal on 18/9/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class CBProfileInfo : NSObject, NSCoding{

	var profile : CBProfile!
	var uniqueID : CBUniqueID!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		if let profileData = dictionary["Profile"] as? [String:Any]{
			profile = CBProfile(fromDictionary: profileData)
		}
		if let uniqueIDData = dictionary["UniqueID"] as? [String:Any]{
			uniqueID = CBUniqueID(fromDictionary: uniqueIDData)
		}
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if profile != nil{
			dictionary["Profile"] = profile.toDictionary()
		}
		if uniqueID != nil{
			dictionary["UniqueID"] = uniqueID.toDictionary()
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         profile = aDecoder.decodeObject(forKey: "Profile") as? CBProfile
         uniqueID = aDecoder.decodeObject(forKey: "UniqueID") as? CBUniqueID

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if profile != nil{
			aCoder.encode(profile, forKey: "Profile")
		}
		if uniqueID != nil{
			aCoder.encode(uniqueID, forKey: "UniqueID")
		}

	}

}