//
//	MRProfileInfo.swift
//
//	Create by Nada Gamal on 22/9/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class MRProfileInfo : NSObject, NSCoding{

	var Profile : MRProfile!
	var UniqueID : MRUniqueID!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		if let ProfileData = dictionary["Profile"] as? [String:Any]{
			Profile = MRProfile(fromDictionary: ProfileData)
		}
		if let UniqueIDData = dictionary["UniqueID"] as? [String:Any]{
			UniqueID = MRUniqueID(fromDictionary: UniqueIDData)
		}
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if Profile != nil{
			dictionary["Profile"] = Profile.toDictionary()
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
         Profile = aDecoder.decodeObject(forKey: "Profile") as? MRProfile
         UniqueID = aDecoder.decodeObject(forKey: "UniqueID") as? MRUniqueID

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if Profile != nil{
			aCoder.encode(Profile, forKey: "Profile")
		}
		if UniqueID != nil{
			aCoder.encode(UniqueID, forKey: "UniqueID")
		}

	}

}