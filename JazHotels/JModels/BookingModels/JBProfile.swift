//
//	JBProfile.swift
//
//	Create by Nada Gamal on 9/9/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class JBProfile : NSObject, NSCoding{

	var companyInfo : JBCompanyInfo!
	var customer : JBCustomer!
	var profileType : String!
	var shareAllMarketInd : String!
	var userID : JBUserID!
	var profileInfo : JBProfileInfo!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		if let companyInfoData = dictionary["CompanyInfo"] as? [String:Any]{
			companyInfo = JBCompanyInfo(fromDictionary: companyInfoData)
		}
		if let customerData = dictionary["Customer"] as? [String:Any]{
			customer = JBCustomer(fromDictionary: customerData)
		}
		profileType = dictionary["ProfileType"] as? String
		shareAllMarketInd = dictionary["ShareAllMarketInd"] as? String
		if let userIDData = dictionary["UserID"] as? [String:Any]{
			userID = JBUserID(fromDictionary: userIDData)
		}
		if let profileInfoData = dictionary["ProfileInfo"] as? [String:Any]{
			profileInfo = JBProfileInfo(fromDictionary: profileInfoData)
		}
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if companyInfo != nil{
			dictionary["CompanyInfo"] = companyInfo.toDictionary()
		}
		if customer != nil{
			dictionary["Customer"] = customer.toDictionary()
		}
		if profileType != nil{
			dictionary["ProfileType"] = profileType
		}
		if shareAllMarketInd != nil{
			dictionary["ShareAllMarketInd"] = shareAllMarketInd
		}
		if userID != nil{
			dictionary["UserID"] = userID.toDictionary()
		}
		if profileInfo != nil{
			dictionary["ProfileInfo"] = profileInfo.toDictionary()
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         companyInfo = aDecoder.decodeObject(forKey: "CompanyInfo") as? JBCompanyInfo
         customer = aDecoder.decodeObject(forKey: "Customer") as? JBCustomer
         profileType = aDecoder.decodeObject(forKey: "ProfileType") as? String
         shareAllMarketInd = aDecoder.decodeObject(forKey: "ShareAllMarketInd") as? String
         userID = aDecoder.decodeObject(forKey: "UserID") as? JBUserID
         profileInfo = aDecoder.decodeObject(forKey: "ProfileInfo") as? JBProfileInfo

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if companyInfo != nil{
			aCoder.encode(companyInfo, forKey: "CompanyInfo")
		}
		if customer != nil{
			aCoder.encode(customer, forKey: "Customer")
		}
		if profileType != nil{
			aCoder.encode(profileType, forKey: "ProfileType")
		}
		if shareAllMarketInd != nil{
			aCoder.encode(shareAllMarketInd, forKey: "ShareAllMarketInd")
		}
		if userID != nil{
			aCoder.encode(userID, forKey: "UserID")
		}
		if profileInfo != nil{
			aCoder.encode(profileInfo, forKey: "ProfileInfo")
		}

	}

}