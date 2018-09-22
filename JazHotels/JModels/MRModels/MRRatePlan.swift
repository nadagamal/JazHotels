//
//	MRRatePlan.swift
//
//	Create by Nada Gamal on 22/9/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class MRRatePlan : NSObject, NSCoding{

	var AdditionalDetails : MRAdditionalDetail!
	var CancelPenalties : MRCancelPenalty!
	var Guarantee : MRGuarantee!
	var PriceViewableInd : Bool!
	var RatePlanCode : String!
	var RatePlanName : String!
	var RatePlan : MRRatePlan!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		if let AdditionalDetailsData = dictionary["AdditionalDetails"] as? [String:Any]{
			AdditionalDetails = MRAdditionalDetail(fromDictionary: AdditionalDetailsData)
		}
		if let CancelPenaltiesData = dictionary["CancelPenalties"] as? [String:Any]{
			CancelPenalties = MRCancelPenalty(fromDictionary: CancelPenaltiesData)
		}
		if let GuaranteeData = dictionary["Guarantee"] as? [String:Any]{
			Guarantee = MRGuarantee(fromDictionary: GuaranteeData)
		}
		PriceViewableInd = dictionary["_PriceViewableInd"] as? Bool
		RatePlanCode = dictionary["_RatePlanCode"] as? String
		RatePlanName = dictionary["_RatePlanName"] as? String
		if let RatePlanData = dictionary["RatePlan"] as? [String:Any]{
			RatePlan = MRRatePlan(fromDictionary: RatePlanData)
		}
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if AdditionalDetails != nil{
			dictionary["AdditionalDetails"] = AdditionalDetails.toDictionary()
		}
		if CancelPenalties != nil{
			dictionary["CancelPenalties"] = CancelPenalties.toDictionary()
		}
		if Guarantee != nil{
			dictionary["Guarantee"] = Guarantee.toDictionary()
		}
		if PriceViewableInd != nil{
			dictionary["_PriceViewableInd"] = PriceViewableInd
		}
		if RatePlanCode != nil{
			dictionary["_RatePlanCode"] = RatePlanCode
		}
		if RatePlanName != nil{
			dictionary["_RatePlanName"] = RatePlanName
		}
		if RatePlan != nil{
			dictionary["RatePlan"] = RatePlan.toDictionary()
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         AdditionalDetails = aDecoder.decodeObject(forKey: "AdditionalDetails") as? MRAdditionalDetail
         CancelPenalties = aDecoder.decodeObject(forKey: "CancelPenalties") as? MRCancelPenalty
         Guarantee = aDecoder.decodeObject(forKey: "Guarantee") as? MRGuarantee
         PriceViewableInd = aDecoder.decodeObject(forKey: "_PriceViewableInd") as? Bool
         RatePlanCode = aDecoder.decodeObject(forKey: "_RatePlanCode") as? String
         RatePlanName = aDecoder.decodeObject(forKey: "_RatePlanName") as? String
         RatePlan = aDecoder.decodeObject(forKey: "RatePlan") as? MRRatePlan

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if AdditionalDetails != nil{
			aCoder.encode(AdditionalDetails, forKey: "AdditionalDetails")
		}
		if CancelPenalties != nil{
			aCoder.encode(CancelPenalties, forKey: "CancelPenalties")
		}
		if Guarantee != nil{
			aCoder.encode(Guarantee, forKey: "Guarantee")
		}
		if PriceViewableInd != nil{
			aCoder.encode(PriceViewableInd, forKey: "_PriceViewableInd")
		}
		if RatePlanCode != nil{
			aCoder.encode(RatePlanCode, forKey: "_RatePlanCode")
		}
		if RatePlanName != nil{
			aCoder.encode(RatePlanName, forKey: "_RatePlanName")
		}
		if RatePlan != nil{
			aCoder.encode(RatePlan, forKey: "RatePlan")
		}

	}

}