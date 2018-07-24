//
//	JCTpaExtension.swift
//
//	Create by Nada Gamal on 1/7/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

class JCTpaExtension{

    var nightlyRate : [JCNightlyRate]!
    
    
    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    init(fromDictionary dictionary: [String:Any]){
        nightlyRate = [JCNightlyRate]()
        if let nightlyRateArray = dictionary["NightlyRate"] as? [[String:Any]]{
            for dic in nightlyRateArray{
                let value = JCNightlyRate(fromDictionary: dic)
                nightlyRate.append(value)
            }
        }
    }

}
