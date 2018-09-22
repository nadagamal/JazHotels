//
//	MRContactNumber.swift
//
//	Create by Nada Gamal on 22/9/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class MRContactNumber : NSObject, NSCoding{

	var DefaultInd : Bool!
	var PhoneNumber : String!
	var PhoneTechType : String!
	var ContactNumber : [MRContactNumber]!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		DefaultInd = dictionary["_DefaultInd"] as? Bool
		PhoneNumber = dictionary["_PhoneNumber"] as? String
		PhoneTechType = dictionary["_PhoneTechType"] as? String
		ContactNumber = [MRContactNumber]()
		if let ContactNumberArray = dictionary["ContactNumber"] as? [[String:Any]]{
			for dic in ContactNumberArray{
				let value = MRContactNumber(fromDictionary: dic)
				ContactNumber.append(value)
			}
		}
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if DefaultInd != nil{
			dictionary["_DefaultInd"] = DefaultInd
		}
		if PhoneNumber != nil{
			dictionary["_PhoneNumber"] = PhoneNumber
		}
		if PhoneTechType != nil{
			dictionary["_PhoneTechType"] = PhoneTechType
		}
		if ContactNumber != nil{
			var dictionaryElements = [[String:Any]]()
			for ContactNumberElement in ContactNumber {
				dictionaryElements.append(ContactNumberElement.toDictionary())
			}
			dictionary["ContactNumber"] = dictionaryElements
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         DefaultInd = aDecoder.decodeObject(forKey: "_DefaultInd") as? Bool
         PhoneNumber = aDecoder.decodeObject(forKey: "_PhoneNumber") as? String
         PhoneTechType = aDecoder.decodeObject(forKey: "_PhoneTechType") as? String
         ContactNumber = aDecoder.decodeObject(forKey :"ContactNumber") as? [MRContactNumber]

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if DefaultInd != nil{
			aCoder.encode(DefaultInd, forKey: "_DefaultInd")
		}
		if PhoneNumber != nil{
			aCoder.encode(PhoneNumber, forKey: "_PhoneNumber")
		}
		if PhoneTechType != nil{
			aCoder.encode(PhoneTechType, forKey: "_PhoneTechType")
		}
		if ContactNumber != nil{
			aCoder.encode(ContactNumber, forKey: "ContactNumber")
		}

	}

}