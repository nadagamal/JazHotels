//
//	MRAddres.swift
//
//	Create by Nada Gamal on 22/9/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class MRAddres : NSObject, NSCoding{

	var AddressLine : [String]!
	var CityName : AnyObject!
	var CountryName : MRCountryName!
	var PostalCode : AnyObject!
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
		CityName = dictionary["CityName"] as? AnyObject
		if let CountryNameData = dictionary["CountryName"] as? [String:Any]{
			CountryName = MRCountryName(fromDictionary: CountryNameData)
		}
		PostalCode = dictionary["PostalCode"] as? AnyObject
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
		if CityName != nil{
			dictionary["CityName"] = CityName
		}
		if CountryName != nil{
			dictionary["CountryName"] = CountryName.toDictionary()
		}
		if PostalCode != nil{
			dictionary["PostalCode"] = PostalCode
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
         CityName = aDecoder.decodeObject(forKey: "CityName") as? AnyObject
         CountryName = aDecoder.decodeObject(forKey: "CountryName") as? MRCountryName
         PostalCode = aDecoder.decodeObject(forKey: "PostalCode") as? AnyObject
         StateProv = aDecoder.decodeObject(forKey: "StateProv") as? MRStateProv
         DefaultInd = aDecoder.decodeObject(forKey: "_DefaultInd") as? Bool
         FormattedInd = aDecoder.decodeObject(forKey: "_FormattedInd") as? Bool
         CityNamee = aDecoder.decodeObject(forKey: "CityName") as? String
         PostalCodee = aDecoder.decodeObject(forKey: "PostalCode") as? String

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if AddressLine != nil{
			aCoder.encode(AddressLine, forKey: "AddressLine")
		}
		if CityName != nil{
			aCoder.encode(CityName, forKey: "CityName")
		}
		if CountryName != nil{
			aCoder.encode(CountryName, forKey: "CountryName")
		}
		if PostalCode != nil{
			aCoder.encode(PostalCode, forKey: "PostalCode")
		}
		if StateProv != nil{
			aCoder.encode(StateProv, forKey: "StateProv")
		}
		if DefaultInd != nil{
			aCoder.encode(DefaultInd, forKey: "_DefaultInd")
		}
		if FormattedInd != nil{
			aCoder.encode(FormattedInd, forKey: "_FormattedInd")
		}
		if CityNamee != nil{
			aCoder.encode(CityNamee, forKey: "CityName")
		}
		if PostalCodee != nil{
			aCoder.encode(PostalCodee, forKey: "PostalCode")
		}

	}

}
