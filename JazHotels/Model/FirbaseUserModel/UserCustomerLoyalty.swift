//
//	RootClass.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 
import ObjectMapper


class UserCustomerLoyalty : NSObject, NSCoding, Mappable{

	var effectiveDate : String?
	var expireDate : String?
	var loyaltyLevel : String?
	var membershipNumber : String?
	var pinNumber : String?
	var points : String?
	var programCode : String?
	var signupDate : String?


	class func newInstance(map: Map) -> Mappable?{
		return UserCustomerLoyalty()
	}
	required init?(map: Map){}
	 override init(){}

	func mapping(map: Map)
	{
		effectiveDate <- map["effectiveDate"]
		expireDate <- map["expireDate"]
		loyaltyLevel <- map["loyaltyLevel"]
		membershipNumber <- map["membershipNumber"]
		pinNumber <- map["pinNumber"]
		points <- map["points"]
		programCode <- map["programCode"]
		signupDate <- map["signupDate"]
		
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         effectiveDate = aDecoder.decodeObject(forKey: "effectiveDate") as? String
         expireDate = aDecoder.decodeObject(forKey: "expireDate") as? String
         loyaltyLevel = aDecoder.decodeObject(forKey: "loyaltyLevel") as? String
         membershipNumber = aDecoder.decodeObject(forKey: "membershipNumber") as? String
         pinNumber = aDecoder.decodeObject(forKey: "pinNumber") as? String
         points = aDecoder.decodeObject(forKey: "points") as? String
         programCode = aDecoder.decodeObject(forKey: "programCode") as? String
         signupDate = aDecoder.decodeObject(forKey: "signupDate") as? String

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if effectiveDate != nil{
			aCoder.encode(effectiveDate, forKey: "effectiveDate")
		}
		if expireDate != nil{
			aCoder.encode(expireDate, forKey: "expireDate")
		}
		if loyaltyLevel != nil{
			aCoder.encode(loyaltyLevel, forKey: "loyaltyLevel")
		}
		if membershipNumber != nil{
			aCoder.encode(membershipNumber, forKey: "membershipNumber")
		}
		if pinNumber != nil{
			aCoder.encode(pinNumber, forKey: "pinNumber")
		}
		if points != nil{
			aCoder.encode(points, forKey: "points")
		}
		if programCode != nil{
			aCoder.encode(programCode, forKey: "programCode")
		}
		if signupDate != nil{
			aCoder.encode(signupDate, forKey: "signupDate")
		}

	}

}
