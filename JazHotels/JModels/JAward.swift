//
//	JAward.swift
//
//	Create by Nada Gamal on 1/7/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

class JAward{

	var provider : String!
	var rating : String!
	var award : [JAward]!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		provider = dictionary["_Provider"] as? String
		rating = dictionary["_Rating"] as? String
		award = [JAward]()
		if let awardArray = dictionary["Award"] as? [[String:Any]]{
			for dic in awardArray{
				let value = JAward(fromDictionary: dic)
				award.append(value)
			}
		}
	}

}
