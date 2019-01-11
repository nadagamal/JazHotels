//
//	JAddres.swift
//
//	Create by Nada Gamal on 1/7/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class JAddres : NSObject, NSCoding{

	var addressLine : [String]!
	var cityName : String!
	var countryName : JCountryName!
	var postalCode : String!
	var defaultInd : Bool!
	var formattedInd : Bool!
    var addressLineSTR : String!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		addressLine = dictionary["AddressLine"] as? [String]
        addressLineSTR = dictionary["AddressLine"] as? String
		cityName = dictionary["CityName"] as? String
		if let countryNameData = dictionary["CountryName"] as? [String:Any]{
			countryName = JCountryName(fromDictionary: countryNameData)
		}
		postalCode = dictionary["PostalCode"] as? String
		defaultInd = dictionary["_DefaultInd"] as? Bool
		formattedInd = dictionary["_FormattedInd"] as? Bool
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if addressLine != nil{
			dictionary["AddressLine"] = addressLine
		}
		if cityName != nil{
			dictionary["CityName"] = cityName
		}
		if countryName != nil{
			dictionary["CountryName"] = countryName.toDictionary()
		}
		if postalCode != nil{
			dictionary["PostalCode"] = postalCode
		}
		if defaultInd != nil{
			dictionary["_DefaultInd"] = defaultInd
		}
		if formattedInd != nil{
			dictionary["_FormattedInd"] = formattedInd
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         addressLine = aDecoder.decodeObject(forKey: "AddressLine") as? [String]
         cityName = aDecoder.decodeObject(forKey: "CityName") as? String
         countryName = aDecoder.decodeObject(forKey: "CountryName") as? JCountryName
         postalCode = aDecoder.decodeObject(forKey: "PostalCode") as? String
         defaultInd = aDecoder.decodeObject(forKey: "_DefaultInd") as? Bool
         formattedInd = aDecoder.decodeObject(forKey: "_FormattedInd") as? Bool

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if addressLine != nil{
			aCoder.encode(addressLine, forKey: "AddressLine")
		}
		if cityName != nil{
			aCoder.encode(cityName, forKey: "CityName")
		}
		if countryName != nil{
			aCoder.encode(countryName, forKey: "CountryName")
		}
		if postalCode != nil{
			aCoder.encode(postalCode, forKey: "PostalCode")
		}
		if defaultInd != nil{
			aCoder.encode(defaultInd, forKey: "_DefaultInd")
		}
		if formattedInd != nil{
			aCoder.encode(formattedInd, forKey: "_FormattedInd")
		}

	}

}
