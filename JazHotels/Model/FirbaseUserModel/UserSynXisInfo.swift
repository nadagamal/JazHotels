//
//	RootClass.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 
import ObjectMapper


class UserSynXisInfo : NSObject, NSCoding, Mappable{

	var synXisPassword : String?
	var synXisUserID : String?


	class func newInstance(map: Map) -> Mappable?{
		return UserSynXisInfo()
	}
	required init?(map: Map){}
	 override init(){}
    
    init( synXisPassword : String ,synXisUserID : String) {
        self.synXisUserID = synXisUserID
        self.synXisPassword =  synXisPassword.toBase64()
    }

	func mapping(map: Map)
	{
		synXisPassword <- map["synXisPassword"]
		synXisUserID <- map["synXisUserID"]
		
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         synXisPassword = aDecoder.decodeObject(forKey: "synXisPassword") as? String
         synXisUserID = aDecoder.decodeObject(forKey: "synXisUserID") as? String

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if synXisPassword != nil{
			aCoder.encode(synXisPassword, forKey: "synXisPassword")
		}
		if synXisUserID != nil{
			aCoder.encode(synXisUserID, forKey: "synXisUserID")
		}

	}

}
