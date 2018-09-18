//
//	CBProfile.swift
//
//	Create by Nada Gamal on 18/9/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class CBProfile : NSObject, NSCoding{

	var companyInfo : CBCompanyInfo!
	var customer : CBCustomer!
	var userID : CBUserID!
	var profileType : String!
	var shareAllMarketInd : String!
	var profileInfo : CBProfileInfo!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		if let companyInfoData = dictionary["CompanyInfo"] as? [String:Any]{
			companyInfo = CBCompanyInfo(fromDictionary: companyInfoData)
		}
		if let customerData = dictionary["Customer"] as? [String:Any]{
			customer = CBCustomer(fromDictionary: customerData)
		}
		if let userIDData = dictionary["UserID"] as? [String:Any]{
			userID = CBUserID(fromDictionary: userIDData)
		}
		profileType = dictionary["_ProfileType"] as? String
		shareAllMarketInd = dictionary["_ShareAllMarketInd"] as? String
		if let profileInfoData = dictionary["ProfileInfo"] as? [String:Any]{
			profileInfo = CBProfileInfo(fromDictionary: profileInfoData)
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
		if userID != nil{
			dictionary["UserID"] = userID.toDictionary()
		}
		if profileType != nil{
			dictionary["_ProfileType"] = profileType
		}
		if shareAllMarketInd != nil{
			dictionary["_ShareAllMarketInd"] = shareAllMarketInd
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
         companyInfo = aDecoder.decodeObject(forKey: "CompanyInfo") as? CBCompanyInfo
         customer = aDecoder.decodeObject(forKey: "Customer") as? CBCustomer
         userID = aDecoder.decodeObject(forKey: "UserID") as? CBUserID
         profileType = aDecoder.decodeObject(forKey: "_ProfileType") as? String
         shareAllMarketInd = aDecoder.decodeObject(forKey: "_ShareAllMarketInd") as? String
         profileInfo = aDecoder.decodeObject(forKey: "ProfileInfo") as? CBProfileInfo

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
		if userID != nil{
			aCoder.encode(userID, forKey: "UserID")
		}
		if profileType != nil{
			aCoder.encode(profileType, forKey: "_ProfileType")
		}
		if shareAllMarketInd != nil{
			aCoder.encode(shareAllMarketInd, forKey: "_ShareAllMarketInd")
		}
		if profileInfo != nil{
			aCoder.encode(profileInfo, forKey: "ProfileInfo")
		}

	}

}