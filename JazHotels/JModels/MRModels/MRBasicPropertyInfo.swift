//
//	MRBasicPropertyInfo.swift
//
//	Create by Nada Gamal on 22/9/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class MRBasicPropertyInfo : NSObject, NSCoding{

	var Address : MRAddres!
	var ContactNumbers : MRContactNumber!
	var Position : MRPosition!
	var ChainCode : String!
	var ChainName : String!
	var HotelCode : String!
	var HotelName : String!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		if let AddressData = dictionary["Address"] as? [String:Any]{
			Address = MRAddres(fromDictionary: AddressData)
		}
		if let ContactNumbersData = dictionary["ContactNumbers"] as? [String:Any]{
			ContactNumbers = MRContactNumber(fromDictionary: ContactNumbersData)
		}
		if let PositionData = dictionary["Position"] as? [String:Any]{
			Position = MRPosition(fromDictionary: PositionData)
		}
		ChainCode = dictionary["_ChainCode"] as? String
		ChainName = dictionary["_ChainName"] as? String
		HotelCode = dictionary["_HotelCode"] as? String
		HotelName = dictionary["_HotelName"] as? String
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
		if ContactNumbers != nil{
			dictionary["ContactNumbers"] = ContactNumbers.toDictionary()
		}
		if Position != nil{
			dictionary["Position"] = Position.toDictionary()
		}
		if ChainCode != nil{
			dictionary["_ChainCode"] = ChainCode
		}
		if ChainName != nil{
			dictionary["_ChainName"] = ChainName
		}
		if HotelCode != nil{
			dictionary["_HotelCode"] = HotelCode
		}
		if HotelName != nil{
			dictionary["_HotelName"] = HotelName
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
         ContactNumbers = aDecoder.decodeObject(forKey: "ContactNumbers") as? MRContactNumber
         Position = aDecoder.decodeObject(forKey: "Position") as? MRPosition
         ChainCode = aDecoder.decodeObject(forKey: "_ChainCode") as? String
         ChainName = aDecoder.decodeObject(forKey: "_ChainName") as? String
         HotelCode = aDecoder.decodeObject(forKey: "_HotelCode") as? String
         HotelName = aDecoder.decodeObject(forKey: "_HotelName") as? String

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
		if ContactNumbers != nil{
			aCoder.encode(ContactNumbers, forKey: "ContactNumbers")
		}
		if Position != nil{
			aCoder.encode(Position, forKey: "Position")
		}
		if ChainCode != nil{
			aCoder.encode(ChainCode, forKey: "_ChainCode")
		}
		if ChainName != nil{
			aCoder.encode(ChainName, forKey: "_ChainName")
		}
		if HotelCode != nil{
			aCoder.encode(HotelCode, forKey: "_HotelCode")
		}
		if HotelName != nil{
			aCoder.encode(HotelName, forKey: "_HotelName")
		}

	}

}