//
//	JAddres.swift
//
//	Create by Nada Gamal on 1/7/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

class JAddres{

	var defaultInd : Bool!
	var formattedInd : Bool!
	var addressLine : String!
	var cityName : String!
	var countryName : JCountryName!
	var postalCode : String!
	var stateProv : JStateProv!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		defaultInd = dictionary["_DefaultInd"] as? Bool
		formattedInd = dictionary["_FormattedInd"] as? Bool
		addressLine = dictionary["AddressLine"] as? String
		cityName = dictionary["CityName"] as? String
		if let countryNameData = dictionary["CountryName"] as? [String:Any]{
			countryName = JCountryName(fromDictionary: countryNameData)
		}
		postalCode = dictionary["PostalCode"] as? String
		if let stateProvData = dictionary["StateProv"] as? [String:Any]{
			stateProv = JStateProv(fromDictionary: stateProvData)
		}
	}

}
