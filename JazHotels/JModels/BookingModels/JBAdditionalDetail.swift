//
//	JBAdditionalDetail.swift
//
//	Create by Nada Gamal on 9/9/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

class JBAdditionalDetail{

	var detailDescription : JBPenaltyDescription!
	var code : String!
	var additionalDetail : [JBAdditionalDetail]!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		if let detailDescriptionData = dictionary["DetailDescription"] as? [String:Any]{
			detailDescription = JBPenaltyDescription(fromDictionary: detailDescriptionData)
		}
		code = dictionary["_Code"] as? String
		additionalDetail = [JBAdditionalDetail]()
		if let additionalDetailArray = dictionary["AdditionalDetail"] as? [[String:Any]]{
			for dic in additionalDetailArray{
				let value = JBAdditionalDetail(fromDictionary: dic)
				additionalDetail.append(value)
			}
		}
	}

}