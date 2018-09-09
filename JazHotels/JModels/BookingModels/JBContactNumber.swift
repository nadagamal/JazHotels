//
//	JBContactNumber.swift
//
//	Create by Nada Gamal on 9/9/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class JBContactNumber : NSObject, NSCoding{

	var defaultInd : Bool!
	var phoneNumber : String!
	var phoneTechType : String!
	var contactNumber : [JBContactNumber]!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		defaultInd = dictionary["DefaultInd"] as? Bool
		phoneNumber = dictionary["PhoneNumber"] as? String
		phoneTechType = dictionary["PhoneTechType"] as? String
		contactNumber = [JBContactNumber]()
		if let contactNumberArray = dictionary["ContactNumber"] as? [[String:Any]]{
			for dic in contactNumberArray{
				let value = JBContactNumber(fromDictionary: dic)
				contactNumber.append(value)
			}
		}
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if defaultInd != nil{
			dictionary["DefaultInd"] = defaultInd
		}
		if phoneNumber != nil{
			dictionary["PhoneNumber"] = phoneNumber
		}
		if phoneTechType != nil{
			dictionary["PhoneTechType"] = phoneTechType
		}
		if contactNumber != nil{
			var dictionaryElements = [[String:Any]]()
			for contactNumberElement in contactNumber {
				dictionaryElements.append(contactNumberElement.toDictionary())
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
         defaultInd = aDecoder.decodeObject(forKey: "DefaultInd") as? Bool
         phoneNumber = aDecoder.decodeObject(forKey: "PhoneNumber") as? String
         phoneTechType = aDecoder.decodeObject(forKey: "PhoneTechType") as? String
         contactNumber = aDecoder.decodeObject(forKey :"ContactNumber") as? [JBContactNumber]

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if defaultInd != nil{
			aCoder.encode(defaultInd, forKey: "DefaultInd")
		}
		if phoneNumber != nil{
			aCoder.encode(phoneNumber, forKey: "PhoneNumber")
		}
		if phoneTechType != nil{
			aCoder.encode(phoneTechType, forKey: "PhoneTechType")
		}
		if contactNumber != nil{
			aCoder.encode(contactNumber, forKey: "ContactNumber")
		}

	}

}