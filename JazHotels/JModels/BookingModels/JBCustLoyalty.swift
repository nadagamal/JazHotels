//
//	JBCustLoyalty.swift
//
//	Create by Nada Gamal on 9/9/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class JBCustLoyalty : NSObject, NSCoding{

	var effectiveDate : String!
	var expireDate : String!
	var membershipID : String!
	var programID : String!
	var signupDate : String!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		effectiveDate = dictionary["EffectiveDate"] as? String
		expireDate = dictionary["ExpireDate"] as? String
		membershipID = dictionary["MembershipID"] as? String
		programID = dictionary["ProgramID"] as? String
		signupDate = dictionary["SignupDate"] as? String
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if effectiveDate != nil{
			dictionary["EffectiveDate"] = effectiveDate
		}
		if expireDate != nil{
			dictionary["ExpireDate"] = expireDate
		}
		if membershipID != nil{
			dictionary["MembershipID"] = membershipID
		}
		if programID != nil{
			dictionary["ProgramID"] = programID
		}
		if signupDate != nil{
			dictionary["SignupDate"] = signupDate
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         effectiveDate = aDecoder.decodeObject(forKey: "EffectiveDate") as? String
         expireDate = aDecoder.decodeObject(forKey: "ExpireDate") as? String
         membershipID = aDecoder.decodeObject(forKey: "MembershipID") as? String
         programID = aDecoder.decodeObject(forKey: "ProgramID") as? String
         signupDate = aDecoder.decodeObject(forKey: "SignupDate") as? String

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if effectiveDate != nil{
			aCoder.encode(effectiveDate, forKey: "EffectiveDate")
		}
		if expireDate != nil{
			aCoder.encode(expireDate, forKey: "ExpireDate")
		}
		if membershipID != nil{
			aCoder.encode(membershipID, forKey: "MembershipID")
		}
		if programID != nil{
			aCoder.encode(programID, forKey: "ProgramID")
		}
		if signupDate != nil{
			aCoder.encode(signupDate, forKey: "SignupDate")
		}

	}

}