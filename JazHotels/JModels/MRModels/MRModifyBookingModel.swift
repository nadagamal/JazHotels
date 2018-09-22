//
//	MRModifyBookingModel.swift
//
//	Create by Nada Gamal on 22/9/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class MRModifyBookingModel : NSObject, NSCoding{

	var Body : MRBody!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
        if let BodyData = dictionary["soap:Body"] as? [String:Any]{
			Body = MRBody(fromDictionary: BodyData)
		}
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if Body != nil{
			dictionary["Body"] = Body.toDictionary()
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         Body = aDecoder.decodeObject(forKey: "Body") as? MRBody

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if Body != nil{
			aCoder.encode(Body, forKey: "Body")
		}

	}

}
