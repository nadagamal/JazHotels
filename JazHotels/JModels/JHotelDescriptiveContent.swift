//
//	JHotelDescriptiveContent.swift
//
//	Create by Nada Gamal on 1/7/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

class JHotelDescriptiveContent{

	var brandCode : String!
	var brandName : String!
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
	var affiliationInfo : JAffiliationInfo!
	var areaInfo : JAreaInfo!
	var contactInfos : JContactInfo!
	var facilityInfo : JFacilityInfo!
	var hotelInfo : JHotelInfo!
	var policies : JPolicy!
	var hotelDescriptiveContent : [JHotelDescriptiveContent]!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		brandCode = dictionary["_BrandCode"] as? String
		brandName = dictionary["_BrandName"] as? String
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
		hotelDescriptiveContent = [JHotelDescriptiveContent]()
		if let hotelDescriptiveContentArray = dictionary["HotelDescriptiveContent"] as? [[String:Any]]{
			for dic in hotelDescriptiveContentArray{
				let value = JHotelDescriptiveContent(fromDictionary: dic)
				hotelDescriptiveContent.append(value)
			}
		}
	}

}
