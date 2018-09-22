//
//	MRResGuest.swift
//
//	Create by Nada Gamal on 22/9/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class MRResGuest : NSObject, NSCoding{

	var Profiles : MRProfile!
	var PrimaryIndicator : Bool!
	var ResGuest : MRResGuest!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		if let ProfilesData = dictionary["Profiles"] as? [String:Any]{
			Profiles = MRProfile(fromDictionary: ProfilesData)
		}
		PrimaryIndicator = dictionary["_PrimaryIndicator"] as? Bool
		if let ResGuestData = dictionary["ResGuest"] as? [String:Any]{
			ResGuest = MRResGuest(fromDictionary: ResGuestData)
		}
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if Profiles != nil{
			dictionary["Profiles"] = Profiles.toDictionary()
		}
		if PrimaryIndicator != nil{
			dictionary["_PrimaryIndicator"] = PrimaryIndicator
		}
		if ResGuest != nil{
			dictionary["ResGuest"] = ResGuest.toDictionary()
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         Profiles = aDecoder.decodeObject(forKey: "Profiles") as? MRProfile
         PrimaryIndicator = aDecoder.decodeObject(forKey: "_PrimaryIndicator") as? Bool
         ResGuest = aDecoder.decodeObject(forKey: "ResGuest") as? MRResGuest

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if Profiles != nil{
			aCoder.encode(Profiles, forKey: "Profiles")
		}
		if PrimaryIndicator != nil{
			aCoder.encode(PrimaryIndicator, forKey: "_PrimaryIndicator")
		}
		if ResGuest != nil{
			aCoder.encode(ResGuest, forKey: "ResGuest")
		}

	}

}