//
//	MRBookingChannel.swift
//
//	Create by Nada Gamal on 22/9/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class MRBookingChannel : NSObject, NSCoding{

	var CompanyName : MRCompanyName!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		if let CompanyNameData = dictionary["CompanyName"] as? [String:Any]{
			CompanyName = MRCompanyName(fromDictionary: CompanyNameData)
		}
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if CompanyName != nil{
			dictionary["CompanyName"] = CompanyName.toDictionary()
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         CompanyName = aDecoder.decodeObject(forKey: "CompanyName") as? MRCompanyName

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if CompanyName != nil{
			aCoder.encode(CompanyName, forKey: "CompanyName")
		}

	}

}