//
//	JRequiredPayment.swift
//
//	Create by Nada Gamal on 1/7/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class JRequiredPayment : NSObject, NSCoding{

	var acceptedPayments : JAcceptedPayment!
	var deadline : JDeadline!
	var paymentDescription : JPenaltyDescription!
	var paymentCode : String!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		if let acceptedPaymentsData = dictionary["AcceptedPayments"] as? [String:Any]{
			acceptedPayments = JAcceptedPayment(fromDictionary: acceptedPaymentsData)
		}
		if let deadlineData = dictionary["Deadline"] as? [String:Any]{
			deadline = JDeadline(fromDictionary: deadlineData)
		}
		if let paymentDescriptionData = dictionary["PaymentDescription"] as? [String:Any]{
			paymentDescription = JPenaltyDescription(fromDictionary: paymentDescriptionData)
		}
		paymentCode = dictionary["_PaymentCode"] as? String
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if acceptedPayments != nil{
			dictionary["AcceptedPayments"] = acceptedPayments.toDictionary()
		}
		if deadline != nil{
			dictionary["Deadline"] = deadline.toDictionary()
		}
		if paymentDescription != nil{
			dictionary["PaymentDescription"] = paymentDescription.toDictionary()
		}
		if paymentCode != nil{
			dictionary["_PaymentCode"] = paymentCode
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         acceptedPayments = aDecoder.decodeObject(forKey: "AcceptedPayments") as? JAcceptedPayment
         deadline = aDecoder.decodeObject(forKey: "Deadline") as? JDeadline
         paymentDescription = aDecoder.decodeObject(forKey: "PaymentDescription") as? JPenaltyDescription
         paymentCode = aDecoder.decodeObject(forKey: "_PaymentCode") as? String

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if acceptedPayments != nil{
			aCoder.encode(acceptedPayments, forKey: "AcceptedPayments")
		}
		if deadline != nil{
			aCoder.encode(deadline, forKey: "Deadline")
		}
		if paymentDescription != nil{
			aCoder.encode(paymentDescription, forKey: "PaymentDescription")
		}
		if paymentCode != nil{
			aCoder.encode(paymentCode, forKey: "_PaymentCode")
		}

	}

}