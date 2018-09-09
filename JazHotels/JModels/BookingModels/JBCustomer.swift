//
//	JBCustomer.swift
//
//	Create by Nada Gamal on 9/9/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class JBCustomer : NSObject, NSCoding{

	var address : JBAddres!
	var birthDate : String!
	var custLoyalty : JBCustLoyalty!
	var email : String!
	var personName : JBPersonName!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		if let addressData = dictionary["Address"] as? [String:Any]{
			address = JBAddres(fromDictionary: addressData)
		}
		birthDate = dictionary["BirthDate"] as? String
		if let custLoyaltyData = dictionary["CustLoyalty"] as? [String:Any]{
			custLoyalty = JBCustLoyalty(fromDictionary: custLoyaltyData)
		}
		email = dictionary["Email"] as? String
		if let personNameData = dictionary["PersonName"] as? [String:Any]{
			personName = JBPersonName(fromDictionary: personNameData)
		}
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
		if birthDate != nil{
			dictionary["BirthDate"] = birthDate
		}
		if custLoyalty != nil{
			dictionary["CustLoyalty"] = custLoyalty.toDictionary()
		}
		if email != nil{
			dictionary["Email"] = email
		}
		if personName != nil{
			dictionary["PersonName"] = personName.toDictionary()
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         address = aDecoder.decodeObject(forKey: "Address") as? JBAddres
         birthDate = aDecoder.decodeObject(forKey: "BirthDate") as? String
         custLoyalty = aDecoder.decodeObject(forKey: "CustLoyalty") as? JBCustLoyalty
         email = aDecoder.decodeObject(forKey: "Email") as? String
         personName = aDecoder.decodeObject(forKey: "PersonName") as? JBPersonName

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
		if birthDate != nil{
			aCoder.encode(birthDate, forKey: "BirthDate")
		}
		if custLoyalty != nil{
			aCoder.encode(custLoyalty, forKey: "CustLoyalty")
		}
		if email != nil{
			aCoder.encode(email, forKey: "Email")
		}
		if personName != nil{
			aCoder.encode(personName, forKey: "PersonName")
		}

	}

}