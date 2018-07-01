//
//	JCancelPenalty.swift
//
//	Create by Nada Gamal on 1/7/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class JCancelPenalty : NSObject, NSCoding{

	var deadline : JDeadline!
	var penaltyDescription : JPenaltyDescription!
	var policyCode : String!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		if let deadlineData = dictionary["Deadline"] as? [String:Any]{
			deadline = JDeadline(fromDictionary: deadlineData)
		}
		if let penaltyDescriptionData = dictionary["PenaltyDescription"] as? [String:Any]{
			penaltyDescription = JPenaltyDescription(fromDictionary: penaltyDescriptionData)
		}
		policyCode = dictionary["_PolicyCode"] as? String
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if deadline != nil{
			dictionary["Deadline"] = deadline.toDictionary()
		}
		if penaltyDescription != nil{
			dictionary["PenaltyDescription"] = penaltyDescription.toDictionary()
		}
		if policyCode != nil{
			dictionary["_PolicyCode"] = policyCode
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         deadline = aDecoder.decodeObject(forKey: "Deadline") as? JDeadline
         penaltyDescription = aDecoder.decodeObject(forKey: "PenaltyDescription") as? JPenaltyDescription
         policyCode = aDecoder.decodeObject(forKey: "_PolicyCode") as? String

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if deadline != nil{
			aCoder.encode(deadline, forKey: "Deadline")
		}
		if penaltyDescription != nil{
			aCoder.encode(penaltyDescription, forKey: "PenaltyDescription")
		}
		if policyCode != nil{
			aCoder.encode(policyCode, forKey: "_PolicyCode")
		}

	}

}