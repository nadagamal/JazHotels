//
//	RootClass.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class Location : NSObject, NSCoding{

	var latitude : Double!
	var longtitude : Double!


     init(latitude : Double , longtitude : Double) {
        self.latitude = latitude
        self.longtitude = longtitude
    }
	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		latitude = dictionary["latitude"] as? Double
		longtitude = dictionary["longtitude"] as? Double
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if latitude != nil{
			dictionary["latitude"] = latitude
		}
		if longtitude != nil{
			dictionary["longtitude"] = longtitude
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         latitude = aDecoder.decodeObject(forKey: "latitude") as? Double
         longtitude = aDecoder.decodeObject(forKey: "longtitude") as? Double

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if latitude != nil{
			aCoder.encode(latitude, forKey: "latitude")
		}
		if longtitude != nil{
			aCoder.encode(longtitude, forKey: "longtitude")
		}

	}

}
