//
//	JAreaInfo.swift
//
//	Create by Nada Gamal on 1/7/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

class JAreaInfo{

	var attractions : JAttraction!
	var recreations : JRecreation!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		if let attractionsData = dictionary["Attractions"] as? [String:Any]{
			attractions = JAttraction(fromDictionary: attractionsData)
		}
		if let recreationsData = dictionary["Recreations"] as? [String:Any]{
			recreations = JRecreation(fromDictionary: recreationsData)
		}
	}

}