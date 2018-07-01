//
//	JHotelDescriptiveContent.swift
//
//	Create by Nada Gamal on 1/7/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class JHotelDescriptiveContent : NSObject, NSCoding{

	var affiliationInfo : JAffiliationInfo!
	var areaInfo : JAreaInfo!
	var contactInfos : JContactInfo!
	var facilityInfo : JFacilityInfo!
	var hotelInfo : JHotelInfo!
	var policies : JPolicy!
	var chainCode : String!
	var chainName : String!
	var currencyCode : String!
	var hotelCode : String!
	var hotelCodeContext : String!
	var hotelName : String!
	var languageCode : String!
	var overwrite : Bool!
	var timeZone : String!
	var unitOfMeasureCode : String!
	var hotelDescriptiveContent : [JHotelDescriptiveContent]!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		if let affiliationInfoData = dictionary["AffiliationInfo"] as? [String:Any]{
			affiliationInfo = JAffiliationInfo(fromDictionary: affiliationInfoData)
		}
		if let areaInfoData = dictionary["AreaInfo"] as? [String:Any]{
			areaInfo = JAreaInfo(fromDictionary: areaInfoData)
		}
		if let contactInfosData = dictionary["ContactInfos"] as? [String:Any]{
			contactInfos = JContactInfo(fromDictionary: contactInfosData)
		}
		if let facilityInfoData = dictionary["FacilityInfo"] as? [String:Any]{
			facilityInfo = JFacilityInfo(fromDictionary: facilityInfoData)
		}
		if let hotelInfoData = dictionary["HotelInfo"] as? [String:Any]{
			hotelInfo = JHotelInfo(fromDictionary: hotelInfoData)
		}
		if let policiesData = dictionary["Policies"] as? [String:Any]{
			policies = JPolicy(fromDictionary: policiesData)
		}
		chainCode = dictionary["_ChainCode"] as? String
		chainName = dictionary["_ChainName"] as? String
		currencyCode = dictionary["_CurrencyCode"] as? String
		hotelCode = dictionary["_HotelCode"] as? String
		hotelCodeContext = dictionary["_HotelCodeContext"] as? String
		hotelName = dictionary["_HotelName"] as? String
		languageCode = dictionary["_LanguageCode"] as? String
		overwrite = dictionary["_Overwrite"] as? Bool
		timeZone = dictionary["_TimeZone"] as? String
		unitOfMeasureCode = dictionary["_UnitOfMeasureCode"] as? String
        hotelDescriptiveContent = [JHotelDescriptiveContent]()
		if let hotelDescriptiveContentList = dictionary["HotelDescriptiveContent"] as? [[String:Any]]{
			//hotelDescriptiveContent = JHotelDescriptiveContent(fromDictionary: hotelDescriptiveContentData)
            for dic in hotelDescriptiveContentList{
                let value = JHotelDescriptiveContent(fromDictionary: dic)
                hotelDescriptiveContent.append(value)
            }
		}

	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if affiliationInfo != nil{
			dictionary["AffiliationInfo"] = affiliationInfo.toDictionary()
		}
		if areaInfo != nil{
			dictionary["AreaInfo"] = areaInfo.toDictionary()
		}
		if contactInfos != nil{
			dictionary["ContactInfos"] = contactInfos.toDictionary()
		}
		if facilityInfo != nil{
			dictionary["FacilityInfo"] = facilityInfo.toDictionary()
		}
		if hotelInfo != nil{
			dictionary["HotelInfo"] = hotelInfo.toDictionary()
		}
		if policies != nil{
			dictionary["Policies"] = policies.toDictionary()
		}
		if chainCode != nil{
			dictionary["_ChainCode"] = chainCode
		}
		if chainName != nil{
			dictionary["_ChainName"] = chainName
		}
		if currencyCode != nil{
			dictionary["_CurrencyCode"] = currencyCode
		}
		if hotelCode != nil{
			dictionary["_HotelCode"] = hotelCode
		}
		if hotelCodeContext != nil{
			dictionary["_HotelCodeContext"] = hotelCodeContext
		}
		if hotelName != nil{
			dictionary["_HotelName"] = hotelName
		}
		if languageCode != nil{
			dictionary["_LanguageCode"] = languageCode
		}
		if overwrite != nil{
			dictionary["_Overwrite"] = overwrite
		}
		if timeZone != nil{
			dictionary["_TimeZone"] = timeZone
		}
		if unitOfMeasureCode != nil{
			dictionary["_UnitOfMeasureCode"] = unitOfMeasureCode
		}
		if hotelDescriptiveContent != nil{            
            var dictionaryElements = [[String:Any]]()
            for textItemElement in hotelDescriptiveContent {
                dictionaryElements.append(textItemElement.toDictionary())
            }
            dictionary["HotelDescriptiveContent"] = dictionaryElements
		}

		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         affiliationInfo = aDecoder.decodeObject(forKey: "AffiliationInfo") as? JAffiliationInfo
         areaInfo = aDecoder.decodeObject(forKey: "AreaInfo") as? JAreaInfo
         contactInfos = aDecoder.decodeObject(forKey: "ContactInfos") as? JContactInfo
         facilityInfo = aDecoder.decodeObject(forKey: "FacilityInfo") as? JFacilityInfo
         hotelInfo = aDecoder.decodeObject(forKey: "HotelInfo") as? JHotelInfo
         policies = aDecoder.decodeObject(forKey: "Policies") as? JPolicy
         chainCode = aDecoder.decodeObject(forKey: "_ChainCode") as? String
         chainName = aDecoder.decodeObject(forKey: "_ChainName") as? String
         currencyCode = aDecoder.decodeObject(forKey: "_CurrencyCode") as? String
         hotelCode = aDecoder.decodeObject(forKey: "_HotelCode") as? String
         hotelCodeContext = aDecoder.decodeObject(forKey: "_HotelCodeContext") as? String
         hotelName = aDecoder.decodeObject(forKey: "_HotelName") as? String
         languageCode = aDecoder.decodeObject(forKey: "_LanguageCode") as? String
         overwrite = aDecoder.decodeObject(forKey: "_Overwrite") as? Bool
         timeZone = aDecoder.decodeObject(forKey: "_TimeZone") as? String
         unitOfMeasureCode = aDecoder.decodeObject(forKey: "_UnitOfMeasureCode") as? String
         hotelDescriptiveContent = aDecoder.decodeObject(forKey: "HotelDescriptiveContent") as? [JHotelDescriptiveContent]

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if affiliationInfo != nil{
			aCoder.encode(affiliationInfo, forKey: "AffiliationInfo")
		}
		if areaInfo != nil{
			aCoder.encode(areaInfo, forKey: "AreaInfo")
		}
		if contactInfos != nil{
			aCoder.encode(contactInfos, forKey: "ContactInfos")
		}
		if facilityInfo != nil{
			aCoder.encode(facilityInfo, forKey: "FacilityInfo")
		}
		if hotelInfo != nil{
			aCoder.encode(hotelInfo, forKey: "HotelInfo")
		}
		if policies != nil{
			aCoder.encode(policies, forKey: "Policies")
		}
		if chainCode != nil{
			aCoder.encode(chainCode, forKey: "_ChainCode")
		}
		if chainName != nil{
			aCoder.encode(chainName, forKey: "_ChainName")
		}
		if currencyCode != nil{
			aCoder.encode(currencyCode, forKey: "_CurrencyCode")
		}
		if hotelCode != nil{
			aCoder.encode(hotelCode, forKey: "_HotelCode")
		}
		if hotelCodeContext != nil{
			aCoder.encode(hotelCodeContext, forKey: "_HotelCodeContext")
		}
		if hotelName != nil{
			aCoder.encode(hotelName, forKey: "_HotelName")
		}
		if languageCode != nil{
			aCoder.encode(languageCode, forKey: "_LanguageCode")
		}
		if overwrite != nil{
			aCoder.encode(overwrite, forKey: "_Overwrite")
		}
		if timeZone != nil{
			aCoder.encode(timeZone, forKey: "_TimeZone")
		}
		if unitOfMeasureCode != nil{
			aCoder.encode(unitOfMeasureCode, forKey: "_UnitOfMeasureCode")
		}
		if hotelDescriptiveContent != nil{
			aCoder.encode(hotelDescriptiveContent, forKey: "HotelDescriptiveContent")
		}

	}

}
