//
//	JRestaurant.swift
//
//	Create by Nada Gamal on 1/7/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class JRestaurant : NSObject, NSCoding{

	var descriptiveText : String!
	var infoCodes : JInfoCode!
	var offerBreakfast : Bool!
	var offerBrunch : Bool!
	var offerDinner : Bool!
	var offerLunch : Bool!
	var proximityCode : String!
	var restaurantName : String!
	var restaurant : [JRestaurant]!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		descriptiveText = dictionary["DescriptiveText"] as? String
		if let infoCodesData = dictionary["InfoCodes"] as? [String:Any]{
			infoCodes = JInfoCode(fromDictionary: infoCodesData)
		}
		offerBreakfast = dictionary["_OfferBreakfast"] as? Bool
		offerBrunch = dictionary["_OfferBrunch"] as? Bool
		offerDinner = dictionary["_OfferDinner"] as? Bool
		offerLunch = dictionary["_OfferLunch"] as? Bool
		proximityCode = dictionary["_ProximityCode"] as? String
		restaurantName = dictionary["_RestaurantName"] as? String
		restaurant = [JRestaurant]()
		if let restaurantArray = dictionary["Restaurant"] as? [[String:Any]]{
			for dic in restaurantArray{
				let value = JRestaurant(fromDictionary: dic)
				restaurant.append(value)
			}
		}
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if descriptiveText != nil{
			dictionary["DescriptiveText"] = descriptiveText
		}
		if infoCodes != nil{
			dictionary["InfoCodes"] = infoCodes.toDictionary()
		}
		if offerBreakfast != nil{
			dictionary["_OfferBreakfast"] = offerBreakfast
		}
		if offerBrunch != nil{
			dictionary["_OfferBrunch"] = offerBrunch
		}
		if offerDinner != nil{
			dictionary["_OfferDinner"] = offerDinner
		}
		if offerLunch != nil{
			dictionary["_OfferLunch"] = offerLunch
		}
		if proximityCode != nil{
			dictionary["_ProximityCode"] = proximityCode
		}
		if restaurantName != nil{
			dictionary["_RestaurantName"] = restaurantName
		}
		if restaurant != nil{
			var dictionaryElements = [[String:Any]]()
			for restaurantElement in restaurant {
				dictionaryElements.append(restaurantElement.toDictionary())
			}
			dictionary["Restaurant"] = dictionaryElements
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         descriptiveText = aDecoder.decodeObject(forKey: "DescriptiveText") as? String
         infoCodes = aDecoder.decodeObject(forKey: "InfoCodes") as? JInfoCode
         offerBreakfast = aDecoder.decodeObject(forKey: "_OfferBreakfast") as? Bool
         offerBrunch = aDecoder.decodeObject(forKey: "_OfferBrunch") as? Bool
         offerDinner = aDecoder.decodeObject(forKey: "_OfferDinner") as? Bool
         offerLunch = aDecoder.decodeObject(forKey: "_OfferLunch") as? Bool
         proximityCode = aDecoder.decodeObject(forKey: "_ProximityCode") as? String
         restaurantName = aDecoder.decodeObject(forKey: "_RestaurantName") as? String
         restaurant = aDecoder.decodeObject(forKey :"Restaurant") as? [JRestaurant]

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if descriptiveText != nil{
			aCoder.encode(descriptiveText, forKey: "DescriptiveText")
		}
		if infoCodes != nil{
			aCoder.encode(infoCodes, forKey: "InfoCodes")
		}
		if offerBreakfast != nil{
			aCoder.encode(offerBreakfast, forKey: "_OfferBreakfast")
		}
		if offerBrunch != nil{
			aCoder.encode(offerBrunch, forKey: "_OfferBrunch")
		}
		if offerDinner != nil{
			aCoder.encode(offerDinner, forKey: "_OfferDinner")
		}
		if offerLunch != nil{
			aCoder.encode(offerLunch, forKey: "_OfferLunch")
		}
		if proximityCode != nil{
			aCoder.encode(proximityCode, forKey: "_ProximityCode")
		}
		if restaurantName != nil{
			aCoder.encode(restaurantName, forKey: "_RestaurantName")
		}
		if restaurant != nil{
			aCoder.encode(restaurant, forKey: "Restaurant")
		}

	}

}