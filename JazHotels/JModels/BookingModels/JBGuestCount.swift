//
//	JBGuestCount.swift
//
//	Create by Nada Gamal on 9/9/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

class JBGuestCount{

	var ageQualifyingCode : String!
	var count : String!
	var guestCount : [JBGuestCount]!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		ageQualifyingCode = dictionary["_AgeQualifyingCode"] as? String
		count = dictionary["_Count"] as? String
		guestCount = [JBGuestCount]()
		if let guestCountArray = dictionary["GuestCount"] as? [[String:Any]]{
			for dic in guestCountArray{
				let value = JBGuestCount(fromDictionary: dic)
				guestCount.append(value)
			}
		}
	}

}