//
//	JCCriteria.swift
//
//	Create by Nada Gamal on 1/7/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

class JCCriteria{

	var criterion : [JCCriterion]!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
//        if let criterionData = dictionary["Criterion"] as? [String:Any]{
//            criterion = JCCriterion(fromDictionary: criterionData)
//        }
//
//
        criterion = [JCCriterion]()
        if let criterionData = dictionary["Criterion"] as? [[String : Any]]{
            for room in criterionData {
                if room != nil{
                    criterion.append(JCCriterion(fromDictionary: room as! [String : Any]))
                }
            }
        }
	}

}
