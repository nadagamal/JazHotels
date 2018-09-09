//
//	JBResGuest.swift
//
//	Create by Nada Gamal on 9/9/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

class JBResGuest{

	var profiles : JBProfile!
	var primaryIndicator : Bool!
	var resGuest : JBResGuest!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		if let profilesData = dictionary["Profiles"] as? [String:Any]{
			profiles = JBProfile(fromDictionary: profilesData)
		}
		primaryIndicator = dictionary["_PrimaryIndicator"] as? Bool
		if let resGuestData = dictionary["ResGuest"] as? [String:Any]{
			resGuest = JBResGuest(fromDictionary: resGuestData)
		}
	}

}