//
//	JBBasicPropertyInfo.swift
//
//	Create by Nada Gamal on 9/9/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class JBBasicPropertyInfo : NSObject, NSCoding{

	var address : JBAddres!
	var chainCode : String!
	var chainName : String!
	var contactNumbers : JBContactNumber!
	var hotelCode : String!
	var hotelName : String!
	var position : JBPosition!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		if let addressData = dictionary["Address"] as? [String:Any]{
			address = JBAddres(fromDictionary: addressData)
		}
		chainCode = dictionary["ChainCode"] as? String
		chainName = dictionary["ChainName"] as? String
		if let contactNumbersData = dictionary["ContactNumbers"] as? [String:Any]{
			contactNumbers = JBContactNumber(fromDictionary: contactNumbersData)
		}
		hotelCode = dictionary["HotelCode"] as? String
		hotelName = dictionary["HotelName"] as? String
		if let positionData = dictionary["Position"] as? [String:Any]{
			position = JBPosition(fromDictionary: positionData)
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
		if chainCode != nil{
			dictionary["ChainCode"] = chainCode
		}
		if chainName != nil{
			dictionary["ChainName"] = chainName
		}
		if contactNumbers != nil{
			dictionary["ContactNumbers"] = contactNumbers.toDictionary()
		}
		if hotelCode != nil{
			dictionary["HotelCode"] = hotelCode
		}
		if hotelName != nil{
			dictionary["HotelName"] = hotelName
		}
		if position != nil{
			dictionary["Position"] = position.toDictionary()
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
         chainCode = aDecoder.decodeObject(forKey: "ChainCode") as? String
         chainName = aDecoder.decodeObject(forKey: "ChainName") as? String
         contactNumbers = aDecoder.decodeObject(forKey: "ContactNumbers") as? JBContactNumber
         hotelCode = aDecoder.decodeObject(forKey: "HotelCode") as? String
         hotelName = aDecoder.decodeObject(forKey: "HotelName") as? String
         position = aDecoder.decodeObject(forKey: "Position") as? JBPosition

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
		if chainCode != nil{
			aCoder.encode(chainCode, forKey: "ChainCode")
		}
		if chainName != nil{
			aCoder.encode(chainName, forKey: "ChainName")
		}
		if contactNumbers != nil{
			aCoder.encode(contactNumbers, forKey: "ContactNumbers")
		}
		if hotelCode != nil{
			aCoder.encode(hotelCode, forKey: "HotelCode")
		}
		if hotelName != nil{
			aCoder.encode(hotelName, forKey: "HotelName")
		}
		if position != nil{
			aCoder.encode(position, forKey: "Position")
		}

	}

}