//
//	JRestaurant.swift
//
//	Create by Nada Gamal on 1/7/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

class JRestaurant{

	var offerBreakfast : Bool!
	var offerBrunch : Bool!
	var offerDinner : Bool!
	var offerLunch : Bool!
	var proximityCode : String!
	var restaurantName : String!
	var descriptiveText : String!
	var infoCodes : JInfoCode!
	var restaurant : JRestaurant!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		offerBreakfast = dictionary["-OfferBreakfast"] as? Bool
		offerBrunch = dictionary["-OfferBrunch"] as? Bool
		offerDinner = dictionary["-OfferDinner"] as? Bool
		offerLunch = dictionary["-OfferLunch"] as? Bool
		proximityCode = dictionary["-ProximityCode"] as? String
		restaurantName = dictionary["-RestaurantName"] as? String
		descriptiveText = dictionary["DescriptiveText"] as? String
		if let infoCodesData = dictionary["InfoCodes"] as? [String:Any]{
			infoCodes = JInfoCode(fromDictionary: infoCodesData)
		}
		if let restaurantData = dictionary["Restaurant"] as? [String:Any]{
			restaurant = JRestaurant(fromDictionary: restaurantData)
		}
	}

}