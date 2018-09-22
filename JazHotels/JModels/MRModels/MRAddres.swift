//
//	MRAddres.swift
//
//	Create by Nada Gamal on 22/9/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class MRAddres : NSObject{

	var AddressLine : [String]!
	var CountryName : MRCountryName!
	var StateProv : MRStateProv!
	var DefaultInd : Bool!
	var FormattedInd : Bool!
	var CityNamee : String!
	var PostalCodee : String!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		AddressLine = dictionary["AddressLine"] as? [String]
		if let CountryNameData = dictionary["CountryName"] as? [String:Any]{
			CountryName = MRCountryName(fromDictionary: CountryNameData)
		}
		if let StateProvData = dictionary["StateProv"] as? [String:Any]{
			StateProv = MRStateProv(fromDictionary: StateProvData)
		}
		DefaultInd = dictionary["_DefaultInd"] as? Bool
		FormattedInd = dictionary["_FormattedInd"] as? Bool
		CityNamee = dictionary["CityName"] as? String
		PostalCodee = dictionary["PostalCode"] as? String
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if AddressLine != nil{
			dictionary["AddressLine"] = AddressLine
		}
		if CountryName != nil{
			dictionary["CountryName"] = CountryName.toDictionary()
		}
		if StateProv != nil{
			dictionary["StateProv"] = StateProv.toDictionary()
		}
		if DefaultInd != nil{
			dictionary["_DefaultInd"] = DefaultInd
		}
		if FormattedInd != nil{
			dictionary["_FormattedInd"] = FormattedInd
		}
		if CityNamee != nil{
			dictionary["CityName"] = CityNamee
		}
		if PostalCodee != nil{
			dictionary["PostalCode"] = PostalCodee
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         AddressLine = aDecoder.decodeObject(forKey: "AddressLine") as? [String]
         CountryName = aDecoder.decodeObject(forKey: "CountryName") as? MRCountryName
         StateProv = aDecoder.decodeObject(forKey: "StateProv") as? MRStateProv
         DefaultInd = aDecoder.decodeObject(forKey: "_DefaultInd") as? Bool
         FormattedInd = aDecoder.decodeObject(forKey: "_FormattedInd") as? Bool
         CityNamee = aDecoder.decodeObject(forKey: "CityName") as? String
         PostalCodee = aDecoder.decodeObject(forKey: "PostalCode") as? String

	}


}
