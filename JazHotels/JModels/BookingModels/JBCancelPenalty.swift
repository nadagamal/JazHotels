//
//	JBCancelPenalty.swift
//
//	Create by Nada Gamal on 9/9/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class JBCancelPenalty : NSObject, NSCoding{

	var amountPercent : JBAmountPercent!
	var deadline : JBDeadline!
	var penaltyDescription : JBPenaltyDescription!
	var policyCode : String!
	var cancelPenalty : JBCancelPenalty!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		if let amountPercentData = dictionary["AmountPercent"] as? [String:Any]{
			amountPercent = JBAmountPercent(fromDictionary: amountPercentData)
		}
		if let deadlineData = dictionary["Deadline"] as? [String:Any]{
			deadline = JBDeadline(fromDictionary: deadlineData)
		}
		if let penaltyDescriptionData = dictionary["PenaltyDescription"] as? [String:Any]{
			penaltyDescription = JBPenaltyDescription(fromDictionary: penaltyDescriptionData)
		}
		policyCode = dictionary["PolicyCode"] as? String
		if let cancelPenaltyData = dictionary["CancelPenalty"] as? [String:Any]{
			cancelPenalty = JBCancelPenalty(fromDictionary: cancelPenaltyData)
		}
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if amountPercent != nil{
			dictionary["AmountPercent"] = amountPercent.toDictionary()
		}
		if deadline != nil{
			dictionary["Deadline"] = deadline.toDictionary()
		}
		if penaltyDescription != nil{
			dictionary["PenaltyDescription"] = penaltyDescription.toDictionary()
		}
		if policyCode != nil{
			dictionary["PolicyCode"] = policyCode
		}
		if cancelPenalty != nil{
			dictionary["CancelPenalty"] = cancelPenalty.toDictionary()
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         amountPercent = aDecoder.decodeObject(forKey: "AmountPercent") as? JBAmountPercent
         deadline = aDecoder.decodeObject(forKey: "Deadline") as? JBDeadline
         penaltyDescription = aDecoder.decodeObject(forKey: "PenaltyDescription") as? JBPenaltyDescription
         policyCode = aDecoder.decodeObject(forKey: "PolicyCode") as? String
         cancelPenalty = aDecoder.decodeObject(forKey: "CancelPenalty") as? JBCancelPenalty

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if amountPercent != nil{
			aCoder.encode(amountPercent, forKey: "AmountPercent")
		}
		if deadline != nil{
			aCoder.encode(deadline, forKey: "Deadline")
		}
		if penaltyDescription != nil{
			aCoder.encode(penaltyDescription, forKey: "PenaltyDescription")
		}
		if policyCode != nil{
			aCoder.encode(policyCode, forKey: "PolicyCode")
		}
		if cancelPenalty != nil{
			aCoder.encode(cancelPenalty, forKey: "CancelPenalty")
		}

	}

}