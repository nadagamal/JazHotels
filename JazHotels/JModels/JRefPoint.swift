//
//	JRefPoint.swift
//
//	Create by Nada Gamal on 1/7/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class JRefPoint : NSObject, NSCoding{

	var transportations : JTransportation!
	var code : String!
	var direction : String!
	var primaryIndicator : Bool!
	var altitude : String!
	var distance : String!
	var distanceUnitName : String!
	var latitude : String!
	var longitude : String!
	var refPoint : JRefPoint!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		if let transportationsData = dictionary["Transportations"] as? [String:Any]{
			transportations = JTransportation(fromDictionary: transportationsData)
		}
		code = dictionary["_Code"] as? String
		direction = dictionary["_Direction"] as? String
		primaryIndicator = dictionary["_PrimaryIndicator"] as? Bool
		altitude = dictionary["Altitude"] as? String
		distance = dictionary["Distance"] as? String
		distanceUnitName = dictionary["DistanceUnitName"] as? String
		latitude = dictionary["Latitude"] as? String
		longitude = dictionary["Longitude"] as? String
		if let refPointData = dictionary["RefPoint"] as? [String:Any]{
			refPoint = JRefPoint(fromDictionary: refPointData)
		}
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if transportations != nil{
			dictionary["Transportations"] = transportations.toDictionary()
		}
		if code != nil{
			dictionary["_Code"] = code
		}
		if direction != nil{
			dictionary["_Direction"] = direction
		}
		if primaryIndicator != nil{
			dictionary["_PrimaryIndicator"] = primaryIndicator
		}
		if altitude != nil{
			dictionary["Altitude"] = altitude
		}
		if distance != nil{
			dictionary["Distance"] = distance
		}
		if distanceUnitName != nil{
			dictionary["DistanceUnitName"] = distanceUnitName
		}
		if latitude != nil{
			dictionary["Latitude"] = latitude
		}
		if longitude != nil{
			dictionary["Longitude"] = longitude
		}
		if refPoint != nil{
			dictionary["RefPoint"] = refPoint.toDictionary()
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         transportations = aDecoder.decodeObject(forKey: "Transportations") as? JTransportation
         code = aDecoder.decodeObject(forKey: "_Code") as? String
         direction = aDecoder.decodeObject(forKey: "_Direction") as? String
         primaryIndicator = aDecoder.decodeObject(forKey: "_PrimaryIndicator") as? Bool
         altitude = aDecoder.decodeObject(forKey: "Altitude") as? String
         distance = aDecoder.decodeObject(forKey: "Distance") as? String
         distanceUnitName = aDecoder.decodeObject(forKey: "DistanceUnitName") as? String
         latitude = aDecoder.decodeObject(forKey: "Latitude") as? String
         longitude = aDecoder.decodeObject(forKey: "Longitude") as? String
         refPoint = aDecoder.decodeObject(forKey: "RefPoint") as? JRefPoint

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if transportations != nil{
			aCoder.encode(transportations, forKey: "Transportations")
		}
		if code != nil{
			aCoder.encode(code, forKey: "_Code")
		}
		if direction != nil{
			aCoder.encode(direction, forKey: "_Direction")
		}
		if primaryIndicator != nil{
			aCoder.encode(primaryIndicator, forKey: "_PrimaryIndicator")
		}
		if altitude != nil{
			aCoder.encode(altitude, forKey: "Altitude")
		}
		if distance != nil{
			aCoder.encode(distance, forKey: "Distance")
		}
		if distanceUnitName != nil{
			aCoder.encode(distanceUnitName, forKey: "DistanceUnitName")
		}
		if latitude != nil{
			aCoder.encode(latitude, forKey: "Latitude")
		}
		if longitude != nil{
			aCoder.encode(longitude, forKey: "Longitude")
		}
		if refPoint != nil{
			aCoder.encode(refPoint, forKey: "RefPoint")
		}

	}

}