//
//	JCAdditionalDetail.swift
//
//	Create by Nada Gamal on 1/7/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

class JCAdditionalDetail{

	var detailDescription : JCPenaltyDescription!
	var code : String!
	var type : String!
	var additionalDetail : [JCAdditionalDetail]!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		if let detailDescriptionData = dictionary["DetailDescription"] as? [String:Any]{
			detailDescription = JCPenaltyDescription(fromDictionary: detailDescriptionData)
		}
		code = dictionary["_Code"] as? String
		type = dictionary["_Type"] as? String
		additionalDetail = [JCAdditionalDetail]()
		if let additionalDetailArray = dictionary["AdditionalDetail"] as? [[String:Any]]{
			for dic in additionalDetailArray{
				let value = JCAdditionalDetail(fromDictionary: dic)
				additionalDetail.append(value)
			}
		}
	}

}