//
//	JBBookingChannel.swift
//
//	Create by Nada Gamal on 9/9/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class JBBookingChannel : NSObject, NSCoding{

	var companyName : JBCompanyName!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		if let companyNameData = dictionary["CompanyName"] as? [String:Any]{
			companyName = JBCompanyName(fromDictionary: companyNameData)
		}
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if companyName != nil{
			dictionary["CompanyName"] = companyName.toDictionary()
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         companyName = aDecoder.decodeObject(forKey: "CompanyName") as? JBCompanyName

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if companyName != nil{
			aCoder.encode(companyName, forKey: "CompanyName")
		}

	}

}