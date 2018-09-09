//
//	JBProfile.swift
//
//	Create by Nada Gamal on 9/9/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

class JBProfile{

	var companyInfo : JBCompanyInfo!
	var customer : JBCustomer!
	var userID : JBUserID!
	var profileType : String!
	var shareAllMarketInd : String!
	var profileInfo : JBProfileInfo!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		if let companyInfoData = dictionary["CompanyInfo"] as? [String:Any]{
			companyInfo = JBCompanyInfo(fromDictionary: companyInfoData)
		}
		if let customerData = dictionary["Customer"] as? [String:Any]{
			customer = JBCustomer(fromDictionary: customerData)
		}
		if let userIDData = dictionary["UserID"] as? [String:Any]{
			userID = JBUserID(fromDictionary: userIDData)
		}
		profileType = dictionary["_ProfileType"] as? String
		shareAllMarketInd = dictionary["_ShareAllMarketInd"] as? String
		if let profileInfoData = dictionary["ProfileInfo"] as? [String:Any]{
			profileInfo = JBProfileInfo(fromDictionary: profileInfoData)
		}
	}

}