//
//	JTypeRoom.swift
//
//	Create by Nada Gamal on 1/7/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

class JTypeRoom{

	var bedTypeCode : String!
	var maxRollaways : String!
	var roomViewCode : String!
	var standardNumBeds : String!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		bedTypeCode = dictionary["_BedTypeCode"] as? String
		maxRollaways = dictionary["_MaxRollaways"] as? String
		roomViewCode = dictionary["_RoomViewCode"] as? String
		standardNumBeds = dictionary["_StandardNumBeds"] as? String
	}

}
