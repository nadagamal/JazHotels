//
//	RootClass.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 
import ObjectMapper


class FirestoreHotelReservation : NSObject, NSCoding, Mappable{

	var cancelled : String?
	var confirmed : String?
	var adultsQuantity : String?
	var amountAfterTax : String?
	var amountBeforeTax : String?
	var cancellationPolicy : String?
	var chainCode : String?
	var checkIn : String?
	var checkOut : String?
	var childrenQuantity : String?
	var currencyCode : String?
	var dynamicPackages : String?
	var guaranteePolicy : String?
	var hotelCode : String?
	var hotelName : String?
	var maxOccupancy : String?
	var numberOfUnits : String?
	var ratePlanCode : String?
	var ratePlanName : String?
	var roomTypeCode : String?
	var roomTypeName : String?
	var specialRequests : String?
     var confirmationId : String?
    var status : String?

	class func newInstance(map: Map) -> Mappable?{
		return FirestoreHotelReservation()
	}
	required init?(map: Map){}
	private override init(){}

	func mapping(map: Map)
	{
		cancelled <- map["Cancelled"]
		confirmed <- map["Confirmed"]
        status <- map["status"]
		adultsQuantity <- map["adultsQuantity"]
		amountAfterTax <- map["amountAfterTax"]
		amountBeforeTax <- map["amountBeforeTax"]
		cancellationPolicy <- map["cancellationPolicy"]
		chainCode <- map["chainCode"]
		checkIn <- map["checkIn"]
		checkOut <- map["checkOut"]
		childrenQuantity <- map["childrenQuantity"]
		currencyCode <- map["currencyCode"]
		dynamicPackages <- map["dynamicPackages"]
		guaranteePolicy <- map["guaranteePolicy"]
		hotelCode <- map["hotelCode"]
		hotelName <- map["hotelName"]
		maxOccupancy <- map["maxOccupancy"]
		numberOfUnits <- map["numberOfUnits"]
		ratePlanCode <- map["ratePlanCode"]
		ratePlanName <- map["ratePlanName"]
		roomTypeCode <- map["roomTypeCode"]
		roomTypeName <- map["roomTypeName"]
		specialRequests <- map["specialRequests"]
        confirmationId <- map["id"]
		
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         cancelled = aDecoder.decodeObject(forKey: "Cancelled") as? String
        status = aDecoder.decodeObject(forKey: "status") as? String

         confirmed = aDecoder.decodeObject(forKey: "Confirmed") as? String
         adultsQuantity = aDecoder.decodeObject(forKey: "adultsQuantity") as? String
         amountAfterTax = aDecoder.decodeObject(forKey: "amountAfterTax") as? String
         amountBeforeTax = aDecoder.decodeObject(forKey: "amountBeforeTax") as? String
         cancellationPolicy = aDecoder.decodeObject(forKey: "cancellationPolicy") as? String
         chainCode = aDecoder.decodeObject(forKey: "chainCode") as? String
         checkIn = aDecoder.decodeObject(forKey: "checkIn") as? String
         checkOut = aDecoder.decodeObject(forKey: "checkOut") as? String
         childrenQuantity = aDecoder.decodeObject(forKey: "childrenQuantity") as? String
         currencyCode = aDecoder.decodeObject(forKey: "currencyCode") as? String
         dynamicPackages = aDecoder.decodeObject(forKey: "dynamicPackages") as? String
         guaranteePolicy = aDecoder.decodeObject(forKey: "guaranteePolicy") as? String
         hotelCode = aDecoder.decodeObject(forKey: "hotelCode") as? String
         hotelName = aDecoder.decodeObject(forKey: "hotelName") as? String
         maxOccupancy = aDecoder.decodeObject(forKey: "maxOccupancy") as? String
         numberOfUnits = aDecoder.decodeObject(forKey: "numberOfUnits") as? String
         ratePlanCode = aDecoder.decodeObject(forKey: "ratePlanCode") as? String
         ratePlanName = aDecoder.decodeObject(forKey: "ratePlanName") as? String
         roomTypeCode = aDecoder.decodeObject(forKey: "roomTypeCode") as? String
         roomTypeName = aDecoder.decodeObject(forKey: "roomTypeName") as? String
         specialRequests = aDecoder.decodeObject(forKey: "specialRequests") as? String
        confirmationId = aDecoder.decodeObject(forKey: "id") as? String

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if cancelled != nil{
			aCoder.encode(cancelled, forKey: "Cancelled")
		}
        if status != nil{
            aCoder.encode(status, forKey: "status")
        }
        if confirmationId != nil{
            aCoder.encode(confirmationId, forKey: "id")
        }
		if confirmed != nil{
			aCoder.encode(confirmed, forKey: "Confirmed")
		}
		if adultsQuantity != nil{
			aCoder.encode(adultsQuantity, forKey: "adultsQuantity")
		}
		if amountAfterTax != nil{
			aCoder.encode(amountAfterTax, forKey: "amountAfterTax")
		}
		if amountBeforeTax != nil{
			aCoder.encode(amountBeforeTax, forKey: "amountBeforeTax")
		}
		if cancellationPolicy != nil{
			aCoder.encode(cancellationPolicy, forKey: "cancellationPolicy")
		}
		if chainCode != nil{
			aCoder.encode(chainCode, forKey: "chainCode")
		}
		if checkIn != nil{
			aCoder.encode(checkIn, forKey: "checkIn")
		}
		if checkOut != nil{
			aCoder.encode(checkOut, forKey: "checkOut")
		}
		if childrenQuantity != nil{
			aCoder.encode(childrenQuantity, forKey: "childrenQuantity")
		}
		if currencyCode != nil{
			aCoder.encode(currencyCode, forKey: "currencyCode")
		}
		if dynamicPackages != nil{
			aCoder.encode(dynamicPackages, forKey: "dynamicPackages")
		}
		if guaranteePolicy != nil{
			aCoder.encode(guaranteePolicy, forKey: "guaranteePolicy")
		}
		if hotelCode != nil{
			aCoder.encode(hotelCode, forKey: "hotelCode")
		}
		if hotelName != nil{
			aCoder.encode(hotelName, forKey: "hotelName")
		}
		if maxOccupancy != nil{
			aCoder.encode(maxOccupancy, forKey: "maxOccupancy")
		}
		if numberOfUnits != nil{
			aCoder.encode(numberOfUnits, forKey: "numberOfUnits")
		}
		if ratePlanCode != nil{
			aCoder.encode(ratePlanCode, forKey: "ratePlanCode")
		}
		if ratePlanName != nil{
			aCoder.encode(ratePlanName, forKey: "ratePlanName")
		}
		if roomTypeCode != nil{
			aCoder.encode(roomTypeCode, forKey: "roomTypeCode")
		}
		if roomTypeName != nil{
			aCoder.encode(roomTypeName, forKey: "roomTypeName")
		}
		if specialRequests != nil{
			aCoder.encode(specialRequests, forKey: "specialRequests")
		}

	}
    
    
    func toDictionary() -> [String:Any]
    {
        var dictionary :[String:Any] = [:]
        
        if cancelled != nil{
            dictionary["cancelled"] = cancelled
        }
        if status != nil{
            dictionary["status"] = status
        }
        if confirmationId != nil{
            dictionary["id"] = confirmationId
        }
        if confirmed != nil{
            dictionary["confirmed"] = confirmed
        }
        if adultsQuantity != nil{
            dictionary["adultsQuantity"] = adultsQuantity
        }
        if amountAfterTax != nil{
            dictionary["amountAfterTax"] = amountAfterTax
        }
        if amountBeforeTax != nil{
            dictionary["amountBeforeTax"] = amountBeforeTax
        }
        if cancellationPolicy != nil{
            dictionary["cancellationPolicy"] = cancellationPolicy
        }
        if chainCode != nil{
            dictionary["chainCode"] = chainCode
        }
        if checkIn != nil
        {
            dictionary["checkIn"] = checkIn
        }
        if checkOut != nil{
            dictionary["checkOut"] = checkOut
        }
        if childrenQuantity != nil{
            dictionary["childrenQuantity"] = childrenQuantity
        }
        if currencyCode != nil{
            dictionary["currencyCode"] = currencyCode
        }
        if dynamicPackages != nil{
            dictionary["dynamicPackages"] = dynamicPackages
        }
        if guaranteePolicy != nil{
            dictionary["guaranteePolicy"] = guaranteePolicy
        }
        if hotelCode != nil{
            dictionary["hotelCode"] = hotelCode
        }
        if chainCode != nil{
            dictionary["chainCode"] = chainCode
        }
        if hotelName != nil
        {
            dictionary["hotelName"] = hotelName
        }
        if maxOccupancy != nil{
            dictionary["maxOccupancy"] = maxOccupancy
        }
        if numberOfUnits != nil{
            dictionary["numberOfUnits"] = numberOfUnits
        }
        if ratePlanCode != nil{
            dictionary["ratePlanCode"] = ratePlanCode
        }
        if ratePlanName != nil{
            dictionary["ratePlanName"] = ratePlanName
        }
        if roomTypeCode != nil{
            dictionary["roomTypeCode"] = roomTypeCode
        }
        
        if roomTypeName != nil
        {
            dictionary["roomTypeName"] = roomTypeName
        }
        if specialRequests != nil
        {
            dictionary["specialRequests"] = specialRequests
        }
        return dictionary
    }
      

}
