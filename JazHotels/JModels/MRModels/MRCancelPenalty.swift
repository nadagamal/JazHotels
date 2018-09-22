//
//	MRCancelPenalty.swift
//
//	Create by Nada Gamal on 22/9/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class MRCancelPenalty : NSObject, NSCoding{

	var AmountPercent : MRAmountPercent!
	var Deadline : MRDeadline!
	var PenaltyDescription : MRPenaltyDescription!
	var PolicyCode : String!
	var CancelPenalty : MRCancelPenalty!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		if let AmountPercentData = dictionary["AmountPercent"] as? [String:Any]{
			AmountPercent = MRAmountPercent(fromDictionary: AmountPercentData)
		}
		if let DeadlineData = dictionary["Deadline"] as? [String:Any]{
			Deadline = MRDeadline(fromDictionary: DeadlineData)
		}
		if let PenaltyDescriptionData = dictionary["PenaltyDescription"] as? [String:Any]{
			PenaltyDescription = MRPenaltyDescription(fromDictionary: PenaltyDescriptionData)
		}
		PolicyCode = dictionary["_PolicyCode"] as? String
		if let CancelPenaltyData = dictionary["CancelPenalty"] as? [String:Any]{
			CancelPenalty = MRCancelPenalty(fromDictionary: CancelPenaltyData)
		}
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if AmountPercent != nil{
			dictionary["AmountPercent"] = AmountPercent.toDictionary()
		}
		if Deadline != nil{
			dictionary["Deadline"] = Deadline.toDictionary()
		}
		if PenaltyDescription != nil{
			dictionary["PenaltyDescription"] = PenaltyDescription.toDictionary()
		}
		if PolicyCode != nil{
			dictionary["_PolicyCode"] = PolicyCode
		}
		if CancelPenalty != nil{
			dictionary["CancelPenalty"] = CancelPenalty.toDictionary()
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         AmountPercent = aDecoder.decodeObject(forKey: "AmountPercent") as? MRAmountPercent
         Deadline = aDecoder.decodeObject(forKey: "Deadline") as? MRDeadline
         PenaltyDescription = aDecoder.decodeObject(forKey: "PenaltyDescription") as? MRPenaltyDescription
         PolicyCode = aDecoder.decodeObject(forKey: "_PolicyCode") as? String
         CancelPenalty = aDecoder.decodeObject(forKey: "CancelPenalty") as? MRCancelPenalty

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if AmountPercent != nil{
			aCoder.encode(AmountPercent, forKey: "AmountPercent")
		}
		if Deadline != nil{
			aCoder.encode(Deadline, forKey: "Deadline")
		}
		if PenaltyDescription != nil{
			aCoder.encode(PenaltyDescription, forKey: "PenaltyDescription")
		}
		if PolicyCode != nil{
			aCoder.encode(PolicyCode, forKey: "_PolicyCode")
		}
		if CancelPenalty != nil{
			aCoder.encode(CancelPenalty, forKey: "CancelPenalty")
		}

	}

}