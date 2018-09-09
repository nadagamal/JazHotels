//
//	JBContactNumber.swift
//
//	Create by Nada Gamal on 9/9/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

class JBContactNumber{

	var defaultInd : Bool!
	var phoneNumber : String!
	var phoneTechType : String!
	var contactNumber : [JBContactNumber]!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		defaultInd = dictionary["_DefaultInd"] as? Bool
		phoneNumber = dictionary["_PhoneNumber"] as? String
		phoneTechType = dictionary["_PhoneTechType"] as? String
		contactNumber = [JBContactNumber]()
		if let contactNumberArray = dictionary["ContactNumber"] as? [[String:Any]]{
			for dic in contactNumberArray{
				let value = JBContactNumber(fromDictionary: dic)
				contactNumber.append(value)
			}
		}
	}

}