//
//	JPolicy.swift
//
//	Create by Nada Gamal on 1/7/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class JPolicy : NSObject, NSCoding{

	var cancelPolicy : JCancelPolicy!
	var commissionPolicy : JCommissionPolicy!
	var guaranteePaymentPolicy : String!
	var paymentPolicy : JPaymentPolicy!
	var petsPolicies : JCommissionPolicy!
	var policyInfo : JPolicyInfo!
	var policyInfoCodes : String!
	var policy : JPolicy!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		if let cancelPolicyData = dictionary["CancelPolicy"] as? [String:Any]{
			cancelPolicy = JCancelPolicy(fromDictionary: cancelPolicyData)
		}
		if let commissionPolicyData = dictionary["CommissionPolicy"] as? [String:Any]{
			commissionPolicy = JCommissionPolicy(fromDictionary: commissionPolicyData)
		}
		guaranteePaymentPolicy = dictionary["GuaranteePaymentPolicy"] as? String
		if let paymentPolicyData = dictionary["PaymentPolicy"] as? [String:Any]{
			paymentPolicy = JPaymentPolicy(fromDictionary: paymentPolicyData)
		}
		if let petsPoliciesData = dictionary["PetsPolicies"] as? [String:Any]{
			petsPolicies = JCommissionPolicy(fromDictionary: petsPoliciesData)
		}
		if let policyInfoData = dictionary["PolicyInfo"] as? [String:Any]{
			policyInfo = JPolicyInfo(fromDictionary: policyInfoData)
		}
		policyInfoCodes = dictionary["PolicyInfoCodes"] as? String
		if let policyData = dictionary["Policy"] as? [String:Any]{
			policy = JPolicy(fromDictionary: policyData)
		}
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if cancelPolicy != nil{
			dictionary["CancelPolicy"] = cancelPolicy.toDictionary()
		}
		if commissionPolicy != nil{
			dictionary["CommissionPolicy"] = commissionPolicy.toDictionary()
		}
		if guaranteePaymentPolicy != nil{
			dictionary["GuaranteePaymentPolicy"] = guaranteePaymentPolicy
		}
		if paymentPolicy != nil{
			dictionary["PaymentPolicy"] = paymentPolicy.toDictionary()
		}
		if petsPolicies != nil{
			dictionary["PetsPolicies"] = petsPolicies.toDictionary()
		}
		if policyInfo != nil{
			dictionary["PolicyInfo"] = policyInfo.toDictionary()
		}
		if policyInfoCodes != nil{
			dictionary["PolicyInfoCodes"] = policyInfoCodes
		}
		if policy != nil{
			dictionary["Policy"] = policy.toDictionary()
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         cancelPolicy = aDecoder.decodeObject(forKey: "CancelPolicy") as? JCancelPolicy
         commissionPolicy = aDecoder.decodeObject(forKey: "CommissionPolicy") as? JCommissionPolicy
         guaranteePaymentPolicy = aDecoder.decodeObject(forKey: "GuaranteePaymentPolicy") as? String
         paymentPolicy = aDecoder.decodeObject(forKey: "PaymentPolicy") as? JPaymentPolicy
         petsPolicies = aDecoder.decodeObject(forKey: "PetsPolicies") as? JCommissionPolicy
         policyInfo = aDecoder.decodeObject(forKey: "PolicyInfo") as? JPolicyInfo
         policyInfoCodes = aDecoder.decodeObject(forKey: "PolicyInfoCodes") as? String
         policy = aDecoder.decodeObject(forKey: "Policy") as? JPolicy

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if cancelPolicy != nil{
			aCoder.encode(cancelPolicy, forKey: "CancelPolicy")
		}
		if commissionPolicy != nil{
			aCoder.encode(commissionPolicy, forKey: "CommissionPolicy")
		}
		if guaranteePaymentPolicy != nil{
			aCoder.encode(guaranteePaymentPolicy, forKey: "GuaranteePaymentPolicy")
		}
		if paymentPolicy != nil{
			aCoder.encode(paymentPolicy, forKey: "PaymentPolicy")
		}
		if petsPolicies != nil{
			aCoder.encode(petsPolicies, forKey: "PetsPolicies")
		}
		if policyInfo != nil{
			aCoder.encode(policyInfo, forKey: "PolicyInfo")
		}
		if policyInfoCodes != nil{
			aCoder.encode(policyInfoCodes, forKey: "PolicyInfoCodes")
		}
		if policy != nil{
			aCoder.encode(policy, forKey: "Policy")
		}

	}

}