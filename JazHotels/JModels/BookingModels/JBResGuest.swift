//
//	JBResGuest.swift
//
//	Create by Nada Gamal on 9/9/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class JBResGuest : NSObject, NSCoding{

	var primaryIndicator : Bool!
	var profiles : JBProfile!
	var resGuest : JBResGuest!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		primaryIndicator = dictionary["PrimaryIndicator"] as? Bool
		if let profilesData = dictionary["Profiles"] as? [String:Any]{
			profiles = JBProfile(fromDictionary: profilesData)
		}
		if let resGuestData = dictionary["ResGuest"] as? [String:Any]{
			resGuest = JBResGuest(fromDictionary: resGuestData)
		}
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if primaryIndicator != nil{
			dictionary["PrimaryIndicator"] = primaryIndicator
		}
		if profiles != nil{
			dictionary["Profiles"] = profiles.toDictionary()
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
         primaryIndicator = aDecoder.decodeObject(forKey: "PrimaryIndicator") as? Bool
         profiles = aDecoder.decodeObject(forKey: "Profiles") as? JBProfile
         resGuest = aDecoder.decodeObject(forKey: "ResGuest") as? JBResGuest

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if primaryIndicator != nil{
			aCoder.encode(primaryIndicator, forKey: "PrimaryIndicator")
		}
		if profiles != nil{
			aCoder.encode(profiles, forKey: "Profiles")
		}
		if resGuest != nil{
			aCoder.encode(resGuest, forKey: "ResGuest")
		}

	}

}