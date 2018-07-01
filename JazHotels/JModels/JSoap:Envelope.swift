//
//	JSoap:Envelope.swift
//
//	Create by Nada Gamal on 1/7/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

class JSoapEnvelope{

	var xmlnssoap : String!
	var xmlnsxsd : String!
	var xmlnsxsi : String!
	var soapBody : JSoapBody!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		xmlnssoap = dictionary["_xmlns:soap"] as? String
		xmlnsxsd = dictionary["_xmlns:xsd"] as? String
		xmlnsxsi = dictionary["_xmlns:xsi"] as? String
		if let soapBodyData = dictionary["soap:Body"] as? [String:Any]{
			soapBody = JSoapBody(fromDictionary: soapBodyData)
		}
	}

}
