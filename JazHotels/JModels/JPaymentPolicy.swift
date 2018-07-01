//
//	JPaymentPolicy.swift
//
//	Create by Nada Gamal on 1/7/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class JPaymentPolicy : NSObject, NSCoding{

	var requiredPayment : JRequiredPayment!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		if let requiredPaymentData = dictionary["RequiredPayment"] as? [String:Any]{
			requiredPayment = JRequiredPayment(fromDictionary: requiredPaymentData)
		}
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if requiredPayment != nil{
			dictionary["RequiredPayment"] = requiredPayment.toDictionary()
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         requiredPayment = aDecoder.decodeObject(forKey: "RequiredPayment") as? JRequiredPayment

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if requiredPayment != nil{
			aCoder.encode(requiredPayment, forKey: "RequiredPayment")
		}

	}

}