//
//	JBRatePlan.swift
//
//	Create by Nada Gamal on 9/9/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class JBRatePlan : NSObject, NSCoding{

	var additionalDetails : JBAdditionalDetail!
	var cancelPenalties : JBCancelPenalty!
	var guarantee : JBGuarantee!
	var priceViewableInd : Bool!
	var ratePlanCode : String!
	var ratePlanName : String!
	var ratePlan : JBRatePlan!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		if let additionalDetailsData = dictionary["AdditionalDetails"] as? [String:Any]{
			additionalDetails = JBAdditionalDetail(fromDictionary: additionalDetailsData)
		}
		if let cancelPenaltiesData = dictionary["CancelPenalties"] as? [String:Any]{
			cancelPenalties = JBCancelPenalty(fromDictionary: cancelPenaltiesData)
		}
		if let guaranteeData = dictionary["Guarantee"] as? [String:Any]{
			guarantee = JBGuarantee(fromDictionary: guaranteeData)
		}
		priceViewableInd = dictionary["PriceViewableInd"] as? Bool
		ratePlanCode = dictionary["RatePlanCode"] as? String
		ratePlanName = dictionary["RatePlanName"] as? String
		if let ratePlanData = dictionary["RatePlan"] as? [String:Any]{
			ratePlan = JBRatePlan(fromDictionary: ratePlanData)
		}
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if additionalDetails != nil{
			dictionary["AdditionalDetails"] = additionalDetails.toDictionary()
		}
		if cancelPenalties != nil{
			dictionary["CancelPenalties"] = cancelPenalties.toDictionary()
		}
		if guarantee != nil{
			dictionary["Guarantee"] = guarantee.toDictionary()
		}
		if priceViewableInd != nil{
			dictionary["PriceViewableInd"] = priceViewableInd
		}
		if ratePlanCode != nil{
			dictionary["RatePlanCode"] = ratePlanCode
		}
		if ratePlanName != nil{
			dictionary["RatePlanName"] = ratePlanName
		}
		if ratePlan != nil{
			dictionary["RatePlan"] = ratePlan.toDictionary()
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         additionalDetails = aDecoder.decodeObject(forKey: "AdditionalDetails") as? JBAdditionalDetail
         cancelPenalties = aDecoder.decodeObject(forKey: "CancelPenalties") as? JBCancelPenalty
         guarantee = aDecoder.decodeObject(forKey: "Guarantee") as? JBGuarantee
         priceViewableInd = aDecoder.decodeObject(forKey: "PriceViewableInd") as? Bool
         ratePlanCode = aDecoder.decodeObject(forKey: "RatePlanCode") as? String
         ratePlanName = aDecoder.decodeObject(forKey: "RatePlanName") as? String
         ratePlan = aDecoder.decodeObject(forKey: "RatePlan") as? JBRatePlan

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if additionalDetails != nil{
			aCoder.encode(additionalDetails, forKey: "AdditionalDetails")
		}
		if cancelPenalties != nil{
			aCoder.encode(cancelPenalties, forKey: "CancelPenalties")
		}
		if guarantee != nil{
			aCoder.encode(guarantee, forKey: "Guarantee")
		}
		if priceViewableInd != nil{
			aCoder.encode(priceViewableInd, forKey: "PriceViewableInd")
		}
		if ratePlanCode != nil{
			aCoder.encode(ratePlanCode, forKey: "RatePlanCode")
		}
		if ratePlanName != nil{
			aCoder.encode(ratePlanName, forKey: "RatePlanName")
		}
		if ratePlan != nil{
			aCoder.encode(ratePlan, forKey: "RatePlan")
		}

	}

}