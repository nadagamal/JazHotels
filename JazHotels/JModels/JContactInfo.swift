//
//	JContactInfo.swift
//
//	Create by Nada Gamal on 1/7/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class JContactInfo : NSObject, NSCoding{

	var addresses : JAddresse!
	var emails : JEmail!
	var names : JName!
	var phones : JPhone!
	var uRLs : JURL!
	var contactInfo : JContactInfo!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		if let addressesData = dictionary["Addresses"] as? [String:Any]{
			addresses = JAddresse(fromDictionary: addressesData)
		}
		if let emailsData = dictionary["Emails"] as? [String:Any]{
			emails = JEmail(fromDictionary: emailsData)
		}
		if let namesData = dictionary["Names"] as? [String:Any]{
			names = JName(fromDictionary: namesData)
		}
		if let phonesData = dictionary["Phones"] as? [String:Any]{
			phones = JPhone(fromDictionary: phonesData)
		}
		if let uRLsData = dictionary["URLs"] as? [String:Any]{
			uRLs = JURL(fromDictionary: uRLsData)
		}
		if let contactInfoData = dictionary["ContactInfo"] as? [String:Any]{
			contactInfo = JContactInfo(fromDictionary: contactInfoData)
		}
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if addresses != nil{
			dictionary["Addresses"] = addresses.toDictionary()
		}
		if emails != nil{
			dictionary["Emails"] = emails.toDictionary()
		}
		if names != nil{
			dictionary["Names"] = names.toDictionary()
		}
		if phones != nil{
			dictionary["Phones"] = phones.toDictionary()
		}
		if uRLs != nil{
			dictionary["URLs"] = uRLs.toDictionary()
		}
		if contactInfo != nil{
			dictionary["ContactInfo"] = contactInfo.toDictionary()
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         addresses = aDecoder.decodeObject(forKey: "Addresses") as? JAddresse
         emails = aDecoder.decodeObject(forKey: "Emails") as? JEmail
         names = aDecoder.decodeObject(forKey: "Names") as? JName
         phones = aDecoder.decodeObject(forKey: "Phones") as? JPhone
         uRLs = aDecoder.decodeObject(forKey: "URLs") as? JURL
         contactInfo = aDecoder.decodeObject(forKey: "ContactInfo") as? JContactInfo

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if addresses != nil{
			aCoder.encode(addresses, forKey: "Addresses")
		}
		if emails != nil{
			aCoder.encode(emails, forKey: "Emails")
		}
		if names != nil{
			aCoder.encode(names, forKey: "Names")
		}
		if phones != nil{
			aCoder.encode(phones, forKey: "Phones")
		}
		if uRLs != nil{
			aCoder.encode(uRLs, forKey: "URLs")
		}
		if contactInfo != nil{
			aCoder.encode(contactInfo, forKey: "ContactInfo")
		}

	}

}