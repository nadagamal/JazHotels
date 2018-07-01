//
//	JPhone.swift
//
//	Create by Nada Gamal on 1/7/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

class JPhone{

	var defaultInd : Bool!
	var phoneNumber : String!
	var phoneTechType : String!
	var phone : [JPhone]!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		defaultInd = dictionary["_DefaultInd"] as? Bool
		phoneNumber = dictionary["_PhoneNumber"] as? String
		phoneTechType = dictionary["_PhoneTechType"] as? String
		phone = [JPhone]()
		if let phoneArray = dictionary["Phone"] as? [[String:Any]]{
			for dic in phoneArray{
				let value = JPhone(fromDictionary: dic)
				phone.append(value)
			}
		}
	}

}
