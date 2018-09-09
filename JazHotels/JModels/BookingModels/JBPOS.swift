//
//	JBPOS.swift
//
//	Create by Nada Gamal on 9/9/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

class JBPOS{

	var source : JBSource!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		if let sourceData = dictionary["Source"] as? [String:Any]{
			source = JBSource(fromDictionary: sourceData)
		}
	}

}