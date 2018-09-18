//
//	CBResGuest.swift
//
//	Create by Nada Gamal on 18/9/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class CBResGuest : NSObject, NSCoding{

	var profiles : CBProfile!
	var primaryIndicator : Bool!
	var resGuest : CBResGuest!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		if let profilesData = dictionary["Profiles"] as? [String:Any]{
			profiles = CBProfile(fromDictionary: profilesData)
		}
		primaryIndicator = dictionary["_PrimaryIndicator"] as? Bool
		if let resGuestData = dictionary["ResGuest"] as? [String:Any]{
			resGuest = CBResGuest(fromDictionary: resGuestData)
		}
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if profiles != nil{
			dictionary["Profiles"] = profiles.toDictionary()
		}
		if primaryIndicator != nil{
			dictionary["_PrimaryIndicator"] = primaryIndicator
		}
		if resGuest != nil{
			dictionary["ResGuest"] = resGuest.toDictionary()
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         profiles = aDecoder.decodeObject(forKey: "Profiles") as? CBProfile
         primaryIndicator = aDecoder.decodeObject(forKey: "_PrimaryIndicator") as? Bool
         resGuest = aDecoder.decodeObject(forKey: "ResGuest") as? CBResGuest

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if profiles != nil{
			aCoder.encode(profiles, forKey: "Profiles")
		}
		if primaryIndicator != nil{
			aCoder.encode(primaryIndicator, forKey: "_PrimaryIndicator")
		}
		if resGuest != nil{
			aCoder.encode(resGuest, forKey: "ResGuest")
		}

	}

}