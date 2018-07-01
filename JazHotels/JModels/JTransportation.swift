//
//	JTransportation.swift
//
//	Create by Nada Gamal on 1/7/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

class JTransportation{

	var codeDetail : String!
	var transportationCode : String!
	var transportation : [JTransportation]!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		codeDetail = dictionary["_CodeDetail"] as? String
		transportationCode = dictionary["_TransportationCode"] as? String
		transportation = [JTransportation]()
		if let transportationArray = dictionary["Transportation"] as? [[String:Any]]{
			for dic in transportationArray{
				let value = JTransportation(fromDictionary: dic)
				transportation.append(value)
			}
		}
	}

}
