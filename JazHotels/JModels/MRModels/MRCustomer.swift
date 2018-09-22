//
//	MRCustomer.swift
//
//	Create by Nada Gamal on 22/9/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class MRCustomer : NSObject, NSCoding{

	var Address : MRAddres!
	var Email : String!
	var PersonName : MRPersonName!
	var Telephone : MRTelephone!
	var BirthDate : String!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		if let AddressData = dictionary["Address"] as? [String:Any]{
			Address = MRAddres(fromDictionary: AddressData)
		}
		Email = dictionary["Email"] as? String
		if let PersonNameData = dictionary["PersonName"] as? [String:Any]{
			PersonName = MRPersonName(fromDictionary: PersonNameData)
		}
		if let TelephoneData = dictionary["Telephone"] as? [String:Any]{
			Telephone = MRTelephone(fromDictionary: TelephoneData)
		}
		BirthDate = dictionary["_BirthDate"] as? String
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if Address != nil{
			dictionary["Address"] = Address.toDictionary()
		}
		if Email != nil{
			dictionary["Email"] = Email
		}
		if PersonName != nil{
			dictionary["PersonName"] = PersonName.toDictionary()
		}
		if Telephone != nil{
			dictionary["Telephone"] = Telephone.toDictionary()
		}
		if BirthDate != nil{
			dictionary["_BirthDate"] = BirthDate
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         Address = aDecoder.decodeObject(forKey: "Address") as? MRAddres
         Email = aDecoder.decodeObject(forKey: "Email") as? String
         PersonName = aDecoder.decodeObject(forKey: "PersonName") as? MRPersonName
         Telephone = aDecoder.decodeObject(forKey: "Telephone") as? MRTelephone
         BirthDate = aDecoder.decodeObject(forKey: "_BirthDate") as? String

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if Address != nil{
			aCoder.encode(Address, forKey: "Address")
		}
		if Email != nil{
			aCoder.encode(Email, forKey: "Email")
		}
		if PersonName != nil{
			aCoder.encode(PersonName, forKey: "PersonName")
		}
		if Telephone != nil{
			aCoder.encode(Telephone, forKey: "Telephone")
		}
		if BirthDate != nil{
			aCoder.encode(BirthDate, forKey: "_BirthDate")
		}

	}

}