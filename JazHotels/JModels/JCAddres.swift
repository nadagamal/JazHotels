//
//	JCAddres.swift
//
//	Create by Nada Gamal on 1/7/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

class JCAddres{

	var addressLine : [String]!
	var cityName : String!
	var countryName : JCCountryName!
	var postalCode : String!
	var defaultInd : Bool!
	var formattedInd : Bool!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		addressLine = dictionary["AddressLine"] as? [String]
		cityName = dictionary["CityName"] as? String
		if let countryNameData = dictionary["CountryName"] as? [String:Any]{
			countryName = JCCountryName(fromDictionary: countryNameData)
		}
		postalCode = dictionary["PostalCode"] as? String
		defaultInd = dictionary["_DefaultInd"] as? Bool
		formattedInd = dictionary["_FormattedInd"] as? Bool
	}

}