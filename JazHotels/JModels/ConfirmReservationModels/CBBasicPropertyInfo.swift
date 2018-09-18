//
//	CBBasicPropertyInfo.swift
//
//	Create by Nada Gamal on 18/9/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class CBBasicPropertyInfo : NSObject, NSCoding{

	var address : CBAddres!
	var contactNumbers : CBContactNumber!
	var position : CBPosition!
	var chainCode : String!
	var chainName : String!
	var hotelCode : String!
	var hotelName : String!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		if let addressData = dictionary["Address"] as? [String:Any]{
			address = CBAddres(fromDictionary: addressData)
		}
		if let contactNumbersData = dictionary["ContactNumbers"] as? [String:Any]{
			contactNumbers = CBContactNumber(fromDictionary: contactNumbersData)
		}
		if let positionData = dictionary["Position"] as? [String:Any]{
			position = CBPosition(fromDictionary: positionData)
		}
		chainCode = dictionary["_ChainCode"] as? String
		chainName = dictionary["_ChainName"] as? String
		hotelCode = dictionary["_HotelCode"] as? String
		hotelName = dictionary["_HotelName"] as? String
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
		if contactNumbers != nil{
			dictionary["ContactNumbers"] = contactNumbers.toDictionary()
		}
		if position != nil{
			dictionary["Position"] = position.toDictionary()
		}
		if chainCode != nil{
			dictionary["_ChainCode"] = chainCode
		}
		if chainName != nil{
			dictionary["_ChainName"] = chainName
		}
		if hotelCode != nil{
			dictionary["_HotelCode"] = hotelCode
		}
		if hotelName != nil{
			dictionary["_HotelName"] = hotelName
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
         contactNumbers = aDecoder.decodeObject(forKey: "ContactNumbers") as? CBContactNumber
         position = aDecoder.decodeObject(forKey: "Position") as? CBPosition
         chainCode = aDecoder.decodeObject(forKey: "_ChainCode") as? String
         chainName = aDecoder.decodeObject(forKey: "_ChainName") as? String
         hotelCode = aDecoder.decodeObject(forKey: "_HotelCode") as? String
         hotelName = aDecoder.decodeObject(forKey: "_HotelName") as? String

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
		if contactNumbers != nil{
			aCoder.encode(contactNumbers, forKey: "ContactNumbers")
		}
		if position != nil{
			aCoder.encode(position, forKey: "Position")
		}
		if chainCode != nil{
			aCoder.encode(chainCode, forKey: "_ChainCode")
		}
		if chainName != nil{
			aCoder.encode(chainName, forKey: "_ChainName")
		}
		if hotelCode != nil{
			aCoder.encode(hotelCode, forKey: "_HotelCode")
		}
		if hotelName != nil{
			aCoder.encode(hotelName, forKey: "_HotelName")
		}

	}

}