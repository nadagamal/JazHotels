//
//	JBCustLoyalty.swift
//
//	Create by Nada Gamal on 9/9/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

class JBCustLoyalty{

	var effectiveDate : String!
	var expireDate : String!
	var membershipID : String!
	var programID : String!
	var signupDate : String!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		effectiveDate = dictionary["_EffectiveDate"] as? String
		expireDate = dictionary["_ExpireDate"] as? String
		membershipID = dictionary["_MembershipID"] as? String
		programID = dictionary["_ProgramID"] as? String
		signupDate = dictionary["_SignupDate"] as? String
	}

}