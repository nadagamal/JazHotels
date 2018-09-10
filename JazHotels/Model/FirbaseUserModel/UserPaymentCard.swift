//
//	RootClass.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 
import ObjectMapper


class UserPaymentCard : NSObject, NSCoding, Mappable{

	var cardCode : String?
	var cardHolderName : String?
	var cardNumber : String?
	var expireDate : String?
	var obscuredCardNumber : String?
	var seriesCode : String?


	class func newInstance(map: Map) -> Mappable?{
		return UserPaymentCard()
	}
	required init?(map: Map){}
	private override init(){}

	func mapping(map: Map)
	{
		cardCode <- map["cardCode"]
		cardHolderName <- map["cardHolderName"]
		cardNumber <- map["cardNumber"]
		expireDate <- map["expireDate"]
		obscuredCardNumber <- map["obscuredCardNumber"]
		seriesCode <- map["seriesCode"]
		
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         cardCode = aDecoder.decodeObject(forKey: "cardCode") as? String
         cardHolderName = aDecoder.decodeObject(forKey: "cardHolderName") as? String
         cardNumber = aDecoder.decodeObject(forKey: "cardNumber") as? String
         expireDate = aDecoder.decodeObject(forKey: "expireDate") as? String
         obscuredCardNumber = aDecoder.decodeObject(forKey: "obscuredCardNumber") as? String
         seriesCode = aDecoder.decodeObject(forKey: "seriesCode") as? String

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if cardCode != nil{
			aCoder.encode(cardCode, forKey: "cardCode")
		}
		if cardHolderName != nil{
			aCoder.encode(cardHolderName, forKey: "cardHolderName")
		}
		if cardNumber != nil{
			aCoder.encode(cardNumber, forKey: "cardNumber")
		}
		if expireDate != nil{
			aCoder.encode(expireDate, forKey: "expireDate")
		}
		if obscuredCardNumber != nil{
			aCoder.encode(obscuredCardNumber, forKey: "obscuredCardNumber")
		}
		if seriesCode != nil{
			aCoder.encode(seriesCode, forKey: "seriesCode")
		}

	}

}
