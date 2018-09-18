//
//	RootClass.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 
import ObjectMapper


class UserName : NSObject, NSCoding, Mappable{

	var firstName : String?
	var fullName : String?
	var lastName : String?
	var middleInitial : String?
	var middleName : String?
    var photo:String?



	class func newInstance(map: Map) -> Mappable?{
		return UserName()
	}
	required init?(map: Map){}
	private override init(){}

    init(firstName : String ,fullName : String , lastName : String , middleInitial : String, middleName : String , photo:String) {
        self.firstName = firstName
        self.fullName = fullName
        self.lastName = lastName
        self.middleName = middleName
        self.middleInitial = middleInitial
        self.photo = photo
    }
    
	func mapping(map: Map)
	{
		firstName <- map["firstName"]
		fullName <- map["fullName"]
		lastName <- map["lastName"]
		middleInitial <- map["middleInitial"]
		middleName <- map["middleName"]
        photo <- map["photo"]
		
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         firstName = aDecoder.decodeObject(forKey: "firstName") as? String
         fullName = aDecoder.decodeObject(forKey: "fullName") as? String
         lastName = aDecoder.decodeObject(forKey: "lastName") as? String
         middleInitial = aDecoder.decodeObject(forKey: "middleInitial") as? String
         middleName = aDecoder.decodeObject(forKey: "middleName") as? String
         photo = aDecoder.decodeObject(forKey: "photo") as? String
    

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if firstName != nil{
			aCoder.encode(firstName, forKey: "firstName")
		}
		if fullName != nil{
			aCoder.encode(fullName, forKey: "fullName")
		}
		if lastName != nil{
			aCoder.encode(lastName, forKey: "lastName")
		}
		if middleInitial != nil{
			aCoder.encode(middleInitial, forKey: "middleInitial")
		}
		if middleName != nil{
			aCoder.encode(middleName, forKey: "middleName")
		}
        if photo != nil
        {
            aCoder.encode(photo, forKey: "photo")
        }

	}

}
