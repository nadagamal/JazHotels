//
//	JBAddres.swift
//
//	Create by Nada Gamal on 9/9/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class JBAddres : NSObject, NSCoding{

	//var cityName : AnyObject!
	var countryName : JBCountryName!
	var defaultInd : Bool!
	var formattedInd : Bool!
	//var postalCode : AnyObject!
	var stateProv : JBStateProv!
	var addressLine : [String]!
	var cityName : String!
	var postalCode : String!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		//cityName = dictionary["CityName"] as? AnyObject
		if let countryNameData = dictionary["CountryName"] as? [String:Any]{
			countryName = JBCountryName(fromDictionary: countryNameData)
		}
		defaultInd = dictionary["DefaultInd"] as? Bool
		formattedInd = dictionary["FormattedInd"] as? Bool
		//postalCode = dictionary["PostalCode"] as? AnyObject
		if let stateProvData = dictionary["StateProv"] as? [String:Any]{
			stateProv = JBStateProv(fromDictionary: stateProvData)
		}
		addressLine = dictionary["AddressLine"] as? [String]
		cityName = dictionary["CityName"] as? String
		postalCode = dictionary["PostalCode"] as? String
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if cityName != nil{
			dictionary["CityName"] = cityName
		}
		if countryName != nil{
			dictionary["CountryName"] = countryName.toDictionary()
		}
		if defaultInd != nil{
			dictionary["DefaultInd"] = defaultInd
		}
		if formattedInd != nil{
			dictionary["FormattedInd"] = formattedInd
		}
		if postalCode != nil{
			dictionary["PostalCode"] = postalCode
		}
		if stateProv != nil{
			dictionary["StateProv"] = stateProv.toDictionary()
		}
		if addressLine != nil{
			dictionary["AddressLine"] = addressLine
		}
		if cityName != nil{
			dictionary["CityName"] = cityName
		}
		if postalCode != nil{
			dictionary["PostalCode"] = postalCode
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
        // cityName = aDecoder.decodeObject(forKey: "CityName") as? AnyObject
         countryName = aDecoder.decodeObject(forKey: "CountryName") as? JBCountryName
         defaultInd = aDecoder.decodeObject(forKey: "DefaultInd") as? Bool
         formattedInd = aDecoder.decodeObject(forKey: "FormattedInd") as? Bool
        // postalCode = aDecoder.decodeObject(forKey: "PostalCode") as? AnyObject
         stateProv = aDecoder.decodeObject(forKey: "StateProv") as? JBStateProv
         addressLine = aDecoder.decodeObject(forKey: "AddressLine") as? [String]
         cityName = aDecoder.decodeObject(forKey: "CityName") as? String
         postalCode = aDecoder.decodeObject(forKey: "PostalCode") as? String

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if cityName != nil{
			aCoder.encode(cityName, forKey: "CityName")
		}
		if countryName != nil{
			aCoder.encode(countryName, forKey: "CountryName")
		}
		if defaultInd != nil{
			aCoder.encode(defaultInd, forKey: "DefaultInd")
		}
		if formattedInd != nil{
			aCoder.encode(formattedInd, forKey: "FormattedInd")
		}
		if postalCode != nil{
			aCoder.encode(postalCode, forKey: "PostalCode")
		}
		if stateProv != nil{
			aCoder.encode(stateProv, forKey: "StateProv")
		}
		if addressLine != nil{
			aCoder.encode(addressLine, forKey: "AddressLine")
		}
		if cityName != nil{
			aCoder.encode(cityName, forKey: "CityName")
		}
		if postalCode != nil{
			aCoder.encode(postalCode, forKey: "PostalCode")
		}

	}

}
