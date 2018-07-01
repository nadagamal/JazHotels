//
//	JGuestRoom.swift
//
//	Create by Nada Gamal on 1/7/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class JGuestRoom : NSObject, NSCoding{

	var amenities : JAmenity!
	var multimediaDescriptions : JMultimediaDescription!
	var typeRoom : JTypeRoom!
	var code : String!
	var maxOccupancy : String!
	var quantity : String!
	var roomTypeName : String!
	var guestRoom : [JGuestRoom]!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		if let amenitiesData = dictionary["Amenities"] as? [String:Any]{
			amenities = JAmenity(fromDictionary: amenitiesData)
		}
		if let multimediaDescriptionsData = dictionary["MultimediaDescriptions"] as? [String:Any]{
			multimediaDescriptions = JMultimediaDescription(fromDictionary: multimediaDescriptionsData)
		}
		if let typeRoomData = dictionary["TypeRoom"] as? [String:Any]{
			typeRoom = JTypeRoom(fromDictionary: typeRoomData)
		}
		code = dictionary["_Code"] as? String
		maxOccupancy = dictionary["_MaxOccupancy"] as? String
		quantity = dictionary["_Quantity"] as? String
		roomTypeName = dictionary["_RoomTypeName"] as? String
		guestRoom = [JGuestRoom]()
		if let guestRoomArray = dictionary["GuestRoom"] as? [[String:Any]]{
			for dic in guestRoomArray{
				let value = JGuestRoom(fromDictionary: dic)
				guestRoom.append(value)
			}
		}
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if amenities != nil{
			dictionary["Amenities"] = amenities.toDictionary()
		}
		if multimediaDescriptions != nil{
			dictionary["MultimediaDescriptions"] = multimediaDescriptions.toDictionary()
		}
		if typeRoom != nil{
			dictionary["TypeRoom"] = typeRoom.toDictionary()
		}
		if code != nil{
			dictionary["_Code"] = code
		}
		if maxOccupancy != nil{
			dictionary["_MaxOccupancy"] = maxOccupancy
		}
		if quantity != nil{
			dictionary["_Quantity"] = quantity
		}
		if roomTypeName != nil{
			dictionary["_RoomTypeName"] = roomTypeName
		}
		if guestRoom != nil{
			var dictionaryElements = [[String:Any]]()
			for guestRoomElement in guestRoom {
				dictionaryElements.append(guestRoomElement.toDictionary())
			}
			dictionary["GuestRoom"] = dictionaryElements
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         amenities = aDecoder.decodeObject(forKey: "Amenities") as? JAmenity
         multimediaDescriptions = aDecoder.decodeObject(forKey: "MultimediaDescriptions") as? JMultimediaDescription
         typeRoom = aDecoder.decodeObject(forKey: "TypeRoom") as? JTypeRoom
         code = aDecoder.decodeObject(forKey: "_Code") as? String
         maxOccupancy = aDecoder.decodeObject(forKey: "_MaxOccupancy") as? String
         quantity = aDecoder.decodeObject(forKey: "_Quantity") as? String
         roomTypeName = aDecoder.decodeObject(forKey: "_RoomTypeName") as? String
         guestRoom = aDecoder.decodeObject(forKey :"GuestRoom") as? [JGuestRoom]

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if amenities != nil{
			aCoder.encode(amenities, forKey: "Amenities")
		}
		if multimediaDescriptions != nil{
			aCoder.encode(multimediaDescriptions, forKey: "MultimediaDescriptions")
		}
		if typeRoom != nil{
			aCoder.encode(typeRoom, forKey: "TypeRoom")
		}
		if code != nil{
			aCoder.encode(code, forKey: "_Code")
		}
		if maxOccupancy != nil{
			aCoder.encode(maxOccupancy, forKey: "_MaxOccupancy")
		}
		if quantity != nil{
			aCoder.encode(quantity, forKey: "_Quantity")
		}
		if roomTypeName != nil{
			aCoder.encode(roomTypeName, forKey: "_RoomTypeName")
		}
		if guestRoom != nil{
			aCoder.encode(guestRoom, forKey: "GuestRoom")
		}

	}

}