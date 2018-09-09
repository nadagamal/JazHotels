//
//	JBCustomer.swift
//
//	Create by Nada Gamal on 9/9/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

class JBCustomer{

	var address : JBAddres!
	var custLoyalty : JBCustLoyalty!
	var email : String!
	var personName : JBPersonName!
	var telephone : JBTelephone!
	var birthDate : String!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		if let addressData = dictionary["Address"] as? [String:Any]{
			address = JBAddres(fromDictionary: addressData)
		}
		if let custLoyaltyData = dictionary["CustLoyalty"] as? [String:Any]{
			custLoyalty = JBCustLoyalty(fromDictionary: custLoyaltyData)
		}
		email = dictionary["Email"] as? String
		if let personNameData = dictionary["PersonName"] as? [String:Any]{
			personName = JBPersonName(fromDictionary: personNameData)
		}
		if let telephoneData = dictionary["Telephone"] as? [String:Any]{
			telephone = JBTelephone(fromDictionary: telephoneData)
		}
		birthDate = dictionary["_BirthDate"] as? String
	}

}