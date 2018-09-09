//
//	JBPersonName.swift
//
//	Create by Nada Gamal on 9/9/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

class JBPersonName{

	var givenName : String!
	var middleName : String!
	var namePrefix : String!
	var nameSuffix : AnyObject!
	var surname : String!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		givenName = dictionary["GivenName"] as? String
		middleName = dictionary["MiddleName"] as? String
		namePrefix = dictionary["NamePrefix"] as? String
		nameSuffix = dictionary["NameSuffix"] as? AnyObject
		surname = dictionary["Surname"] as? String
	}

}