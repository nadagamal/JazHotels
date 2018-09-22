//
//	MRProfile.swift
//
//	Create by Nada Gamal on 22/9/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class MRProfile : NSObject, NSCoding{

	var CompanyInfo : MRCompanyInfo!
	var Customer : MRCustomer!
	var UserID : MRUserID!
	var ProfileType : String!
	var ShareAllMarketInd : String!
	var ProfileInfo : MRProfileInfo!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		if let CompanyInfoData = dictionary["CompanyInfo"] as? [String:Any]{
			CompanyInfo = MRCompanyInfo(fromDictionary: CompanyInfoData)
		}
		if let CustomerData = dictionary["Customer"] as? [String:Any]{
			Customer = MRCustomer(fromDictionary: CustomerData)
		}
		if let UserIDData = dictionary["UserID"] as? [String:Any]{
			UserID = MRUserID(fromDictionary: UserIDData)
		}
		ProfileType = dictionary["_ProfileType"] as? String
		ShareAllMarketInd = dictionary["_ShareAllMarketInd"] as? String
		if let ProfileInfoData = dictionary["ProfileInfo"] as? [String:Any]{
			ProfileInfo = MRProfileInfo(fromDictionary: ProfileInfoData)
		}
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if CompanyInfo != nil{
			dictionary["CompanyInfo"] = CompanyInfo.toDictionary()
		}
		if Customer != nil{
			dictionary["Customer"] = Customer.toDictionary()
		}
		if UserID != nil{
			dictionary["UserID"] = UserID.toDictionary()
		}
		if ProfileType != nil{
			dictionary["_ProfileType"] = ProfileType
		}
		if ShareAllMarketInd != nil{
			dictionary["_ShareAllMarketInd"] = ShareAllMarketInd
		}
		if ProfileInfo != nil{
			dictionary["ProfileInfo"] = ProfileInfo.toDictionary()
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         CompanyInfo = aDecoder.decodeObject(forKey: "CompanyInfo") as? MRCompanyInfo
         Customer = aDecoder.decodeObject(forKey: "Customer") as? MRCustomer
         UserID = aDecoder.decodeObject(forKey: "UserID") as? MRUserID
         ProfileType = aDecoder.decodeObject(forKey: "_ProfileType") as? String
         ShareAllMarketInd = aDecoder.decodeObject(forKey: "_ShareAllMarketInd") as? String
         ProfileInfo = aDecoder.decodeObject(forKey: "ProfileInfo") as? MRProfileInfo

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if CompanyInfo != nil{
			aCoder.encode(CompanyInfo, forKey: "CompanyInfo")
		}
		if Customer != nil{
			aCoder.encode(Customer, forKey: "Customer")
		}
		if UserID != nil{
			aCoder.encode(UserID, forKey: "UserID")
		}
		if ProfileType != nil{
			aCoder.encode(ProfileType, forKey: "_ProfileType")
		}
		if ShareAllMarketInd != nil{
			aCoder.encode(ShareAllMarketInd, forKey: "_ShareAllMarketInd")
		}
		if ProfileInfo != nil{
			aCoder.encode(ProfileInfo, forKey: "ProfileInfo")
		}

	}

}