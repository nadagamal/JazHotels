//
//	CBCustomer.swift
//
//	Create by Nada Gamal on 18/9/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class CBCustomer : NSObject, NSCoding{

	var address : CBAddres!
	var email : String!
	var personName : CBPersonName!
	var telephone : CBTelephone!
	var birthDate : String!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		if let addressData = dictionary["Address"] as? [String:Any]{
			address = CBAddres(fromDictionary: addressData)
		}
		email = dictionary["Email"] as? String
		if let personNameData = dictionary["PersonName"] as? [String:Any]{
			personName = CBPersonName(fromDictionary: personNameData)
		}
		if let telephoneData = dictionary["Telephone"] as? [String:Any]{
			telephone = CBTelephone(fromDictionary: telephoneData)
		}
		birthDate = dictionary["_BirthDate"] as? String
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if address != nil{
			dictionary["Address"] = address.toDictionary()
		}
		if email != nil{
			dictionary["Email"] = email
		}
		if personName != nil{
			dictionary["PersonName"] = personName.toDictionary()
		}
		if telephone != nil{
			dictionary["Telephone"] = telephone.toDictionary()
		}
		if birthDate != nil{
			dictionary["_BirthDate"] = birthDate
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         address = aDecoder.decodeObject(forKey: "Address") as? CBAddres
         email = aDecoder.decodeObject(forKey: "Email") as? String
         personName = aDecoder.decodeObject(forKey: "PersonName") as? CBPersonName
         telephone = aDecoder.decodeObject(forKey: "Telephone") as? CBTelephone
         birthDate = aDecoder.decodeObject(forKey: "_BirthDate") as? String

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if address != nil{
			aCoder.encode(address, forKey: "Address")
		}
		if email != nil{
			aCoder.encode(email, forKey: "Email")
		}
		if personName != nil{
			aCoder.encode(personName, forKey: "PersonName")
		}
		if telephone != nil{
			aCoder.encode(telephone, forKey: "Telephone")
		}
		if birthDate != nil{
			aCoder.encode(birthDate, forKey: "_BirthDate")
		}

	}

}