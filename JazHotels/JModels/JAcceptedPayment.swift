//
//	JAcceptedPayment.swift
//
//	Create by Nada Gamal on 1/7/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class JAcceptedPayment : NSObject, NSCoding{

	var paymentCard : JPaymentCard!
	var acceptedPayment : [JAcceptedPayment]!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		if let paymentCardData = dictionary["PaymentCard"] as? [String:Any]{
			paymentCard = JPaymentCard(fromDictionary: paymentCardData)
		}
		acceptedPayment = [JAcceptedPayment]()
		if let acceptedPaymentArray = dictionary["AcceptedPayment"] as? [[String:Any]]{
			for dic in acceptedPaymentArray{
				let value = JAcceptedPayment(fromDictionary: dic)
				acceptedPayment.append(value)
			}
		}
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if paymentCard != nil{
			dictionary["PaymentCard"] = paymentCard.toDictionary()
		}
		if acceptedPayment != nil{
			var dictionaryElements = [[String:Any]]()
			for acceptedPaymentElement in acceptedPayment {
				dictionaryElements.append(acceptedPaymentElement.toDictionary())
			}
			dictionary["AcceptedPayment"] = dictionaryElements
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         paymentCard = aDecoder.decodeObject(forKey: "PaymentCard") as? JPaymentCard
         acceptedPayment = aDecoder.decodeObject(forKey :"AcceptedPayment") as? [JAcceptedPayment]

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if paymentCard != nil{
			aCoder.encode(paymentCard, forKey: "PaymentCard")
		}
		if acceptedPayment != nil{
			aCoder.encode(acceptedPayment, forKey: "AcceptedPayment")
		}

	}

}