//
//	JContactInfo.swift
//
//	Create by Nada Gamal on 1/7/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

class JContactInfo{

	var addresses : JAddresse!
	var emails : JEmail!
	var names : JName!
	var phones : JPhone!
	var uRLs : JURL!
	var contactInfo : JContactInfo!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		if let addressesData = dictionary["Addresses"] as? [String:Any]{
			addresses = JAddresse(fromDictionary: addressesData)
		}
		if let emailsData = dictionary["Emails"] as? [String:Any]{
			emails = JEmail(fromDictionary: emailsData)
		}
		if let namesData = dictionary["Names"] as? [String:Any]{
			names = JName(fromDictionary: namesData)
		}
		if let phonesData = dictionary["Phones"] as? [String:Any]{
			phones = JPhone(fromDictionary: phonesData)
		}
		if let uRLsData = dictionary["URLs"] as? [String:Any]{
			uRLs = JURL(fromDictionary: uRLsData)
		}
		if let contactInfoData = dictionary["ContactInfo"] as? [String:Any]{
			contactInfo = JContactInfo(fromDictionary: contactInfoData)
		}
	}

}
