//
//	JBProfileInfo.swift
//
//	Create by Nada Gamal on 9/9/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

class JBProfileInfo{

	var profile : JBProfile!
	var uniqueID : JBUniqueID!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		if let profileData = dictionary["Profile"] as? [String:Any]{
			profile = JBProfile(fromDictionary: profileData)
		}
		if let uniqueIDData = dictionary["UniqueID"] as? [String:Any]{
			uniqueID = JBUniqueID(fromDictionary: uniqueIDData)
		}
	}

}