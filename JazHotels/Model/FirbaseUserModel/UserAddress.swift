//
//	RootClass.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 
import ObjectMapper


class UserAddress : NSObject, NSCoding, Mappable{

	var addressLine1 : String?
	var addressLine2 : String?
	var addressLine3 : String?
	var city : String?
	var country : String?
	var fullAddress : String?
	var state : String?
	var zip : String?


	class func newInstance(map: Map) -> Mappable?{
		return UserAddress()
	}
	required init?(map: Map){}
	private override init(){}

	func mapping(map: Map)
	{
		addressLine1 <- map["addressLine1"]
		addressLine2 <- map["addressLine2"]
		addressLine3 <- map["addressLine3"]
		city <- map["city"]
		country <- map["country"]
		fullAddress <- map["fullAddress"]
		state <- map["state"]
		zip <- map["zip"]
		
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         addressLine1 = aDecoder.decodeObject(forKey: "addressLine1") as? String
         addressLine2 = aDecoder.decodeObject(forKey: "addressLine2") as? String
         addressLine3 = aDecoder.decodeObject(forKey: "addressLine3") as? String
         city = aDecoder.decodeObject(forKey: "city") as? String
         country = aDecoder.decodeObject(forKey: "country") as? String
         fullAddress = aDecoder.decodeObject(forKey: "fullAddress") as? String
         state = aDecoder.decodeObject(forKey: "state") as? String
         zip = aDecoder.decodeObject(forKey: "zip") as? String

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if addressLine1 != nil{
			aCoder.encode(addressLine1, forKey: "addressLine1")
		}
		if addressLine2 != nil{
			aCoder.encode(addressLine2, forKey: "addressLine2")
		}
		if addressLine3 != nil{
			aCoder.encode(addressLine3, forKey: "addressLine3")
		}
		if city != nil{
			aCoder.encode(city, forKey: "city")
		}
		if country != nil{
			aCoder.encode(country, forKey: "country")
		}
		if fullAddress != nil{
			aCoder.encode(fullAddress, forKey: "fullAddress")
		}
		if state != nil{
			aCoder.encode(state, forKey: "state")
		}
		if zip != nil{
			aCoder.encode(zip, forKey: "zip")
		}

	}

}
