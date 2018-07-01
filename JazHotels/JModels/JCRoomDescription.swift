//
//	JCRoomDescription.swift
//
//	Create by Nada Gamal on 1/7/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

class JCRoomDescription{

	var image : [String]!
	var text : String!
	var name : String!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		image = dictionary["Image"] as? [String]
		text = dictionary["Text"] as? String
		name = dictionary["_Name"] as? String
	}

}