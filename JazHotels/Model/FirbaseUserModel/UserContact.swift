//
//	RootClass.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 
import ObjectMapper


class UserContact : NSObject, NSCoding, Mappable{

	var emailAddress : String?
	var landLine : String?
	var mobilePhone : String?
	var phoneNumbers : String?


	class func newInstance(map: Map) -> Mappable?{
		return UserContact()
	}
	required init?(map: Map){}
	 override init(){}

     init(emailAddress : String ,landLine : String , mobilePhone : String, phoneNumbers : String) {
        self.emailAddress = emailAddress
        self.landLine = landLine
        self.mobilePhone = mobilePhone
        self.phoneNumbers = phoneNumbers
        
    }
    
	func mapping(map: Map)
	{
		emailAddress <- map["emailAddress"]
		landLine <- map["landLine"]
		mobilePhone <- map["mobilePhone"]
		phoneNumbers <- map["phoneNumbers"]
		
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         emailAddress = aDecoder.decodeObject(forKey: "emailAddress") as? String
         landLine = aDecoder.decodeObject(forKey: "landLine") as? String
         mobilePhone = aDecoder.decodeObject(forKey: "mobilePhone") as? String
         phoneNumbers = aDecoder.decodeObject(forKey: "phoneNumbers") as? String

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if emailAddress != nil{
			aCoder.encode(emailAddress, forKey: "emailAddress")
		}
		if landLine != nil{
			aCoder.encode(landLine, forKey: "landLine")
		}
		if mobilePhone != nil{
			aCoder.encode(mobilePhone, forKey: "mobilePhone")
		}
		if phoneNumbers != nil{
			aCoder.encode(phoneNumbers, forKey: "phoneNumbers")
		}

	}

}
