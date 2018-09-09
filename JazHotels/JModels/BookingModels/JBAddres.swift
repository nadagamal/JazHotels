//
//	JBAddres.swift
//
//	Create by Nada Gamal on 9/9/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

class JBAddres{

	var addressLine : [String]!
	var cityName : String!
	var countryName : JBCountryName!
	var postalCode : String!
	var stateProv : JBStateProv!
	var defaultInd : Bool!
	var formattedInd : Bool!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		addressLine = dictionary["AddressLine"] as? [String]
		cityName = dictionary["CityName"] as? String
		if let countryNameData = dictionary["CountryName"] as? [String:Any]{
			countryName = JBCountryName(fromDictionary: countryNameData)
		}
		postalCode = dictionary["PostalCode"] as? String
		if let stateProvData = dictionary["StateProv"] as? [String:Any]{
			stateProv = JBStateProv(fromDictionary: stateProvData)
		}
		defaultInd = dictionary["_DefaultInd"] as? Bool
		formattedInd = dictionary["_FormattedInd"] as? Bool
	}

}