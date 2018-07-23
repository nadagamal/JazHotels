//
//  ServiceManager.swift
//  JazHotels
//
//  Created by Nada Gamal Mohamed on 6/30/18.
//  Copyright © 2018 Jaz. All rights reserved.
//

import UIKit

class ServiceManager: NSObject {
    var getBaseUrl:String {
        get{
            return "https://interface.synxis.com/channelconnect.asmx"
        }
    }
    var soapHeader: String = "<v:Envelope xmlns:v=\"http://www.w3.org/2003/05/soap-envelope\"><v:Header><n0:HTNGHeader xmlns:n0=\"http://htng.org/1.1/Header/\"><n0:From><n0:Credential><n0:userName>JAZHTLMCBEPROD</n0:userName><n0:password>1fvnZ$1aUKO</n0:password></n0:Credential></n0:From></n0:HTNGHeader></v:Header><v:Body>"

    func getHotels(completion:  @escaping (_ hotels:[JHotelDescriptiveContent]?, _ :NSError?) -> Void)
    {
        
        var lobj_Request = NSMutableURLRequest(url: NSURL(string: getBaseUrl)! as URL) as URLRequest
        let session = URLSession.shared
        var err: NSError?
        
        lobj_Request.httpMethod = "POST"
        lobj_Request.httpBody = String(format: "%@%@", soapHeader,"<OTA_HotelDescriptiveInfoRQ xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" EchoToken=\"JAZ-Android_QkPvCUzmFr\" PrimaryLangID=\"en-US\" xmlns=\"http://www.opentravel.org/OTA/2003/05\"><HotelDescriptiveInfos><HotelDescriptiveInfo HotelCode=\"61567\"><HotelInfo SendData=\"True\" /><FacilityInfo SendMeetingRooms=\"True\" SendGuestRooms=\"True\" SendRestaurants=\"True\" /><Policies SendPolicies=\"True\" /><AreaInfo SendRefPoints=\"True\" SendAttractions=\"True\" SendRecreations=\"True\" /><AffiliationInfo SendAwards=\"True\" /><ContactInfo SendData=\"True\" /></HotelDescriptiveInfo><HotelDescriptiveInfo HotelCode=\"61564\"><HotelInfo SendData=\"True\" /><FacilityInfo SendMeetingRooms=\"True\" SendGuestRooms=\"True\" SendRestaurants=\"True\" /><Policies SendPolicies=\"false\" /><AreaInfo SendRefPoints=\"True\" SendAttractions=\"True\" SendRecreations=\"True\" /><AffiliationInfo SendAwards=\"True\" /><ContactInfo SendData=\"True\" /></HotelDescriptiveInfo><HotelDescriptiveInfo HotelCode=\"64946\"><HotelInfo SendData=\"True\" /><FacilityInfo SendMeetingRooms=\"True\" SendGuestRooms=\"True\" SendRestaurants=\"True\" /><Policies SendPolicies=\"True\" /><AreaInfo SendRefPoints=\"True\" SendAttractions=\"True\" SendRecreations=\"True\" /><AffiliationInfo SendAwards=\"True\" /><ContactInfo SendData=\"True\" /></HotelDescriptiveInfo><HotelDescriptiveInfo HotelCode=\"61576\"><HotelInfo SendData=\"True\" /><FacilityInfo SendMeetingRooms=\"True\" SendGuestRooms=\"True\" SendRestaurants=\"True\" /><Policies SendPolicies=\"True\" /><AreaInfo SendRefPoints=\"True\" SendAttractions=\"True\" SendRecreations=\"True\" /><AffiliationInfo SendAwards=\"True\" /><ContactInfo SendData=\"True\" /></HotelDescriptiveInfo><HotelDescriptiveInfo HotelCode=\"61585\"><HotelInfo SendData=\"True\" /><FacilityInfo SendMeetingRooms=\"True\" SendGuestRooms=\"True\" SendRestaurants=\"True\" /><Policies SendPolicies=\"True\" /><AreaInfo SendRefPoints=\"True\" SendAttractions=\"True\" SendRecreations=\"True\" /><AffiliationInfo SendAwards=\"True\" /><ContactInfo SendData=\"True\" /></HotelDescriptiveInfo><HotelDescriptiveInfo HotelCode=\"61586\"><HotelInfo SendData=\"True\" /><FacilityInfo SendMeetingRooms=\"True\" SendGuestRooms=\"True\" SendRestaurants=\"True\" /><Policies SendPolicies=\"True\" /><AreaInfo SendRefPoints=\"True\" SendAttractions=\"True\" SendRecreations=\"True\" /><AffiliationInfo SendAwards=\"True\" /><ContactInfo SendData=\"True\" /></HotelDescriptiveInfo><HotelDescriptiveInfo HotelCode=\"63101\"><HotelInfo SendData=\"True\" /><FacilityInfo SendMeetingRooms=\"True\" SendGuestRooms=\"True\" SendRestaurants=\"True\" /><Policies SendPolicies=\"True\" /><AreaInfo SendRefPoints=\"True\" SendAttractions=\"True\" SendRecreations=\"True\" /><AffiliationInfo SendAwards=\"True\" /><ContactInfo SendData=\"True\" /></HotelDescriptiveInfo><HotelDescriptiveInfo HotelCode=\"61578\"><HotelInfo SendData=\"True\" /><FacilityInfo SendMeetingRooms=\"True\" SendGuestRooms=\"True\" SendRestaurants=\"True\" /><Policies SendPolicies=\"True\" /><AreaInfo SendRefPoints=\"True\" SendAttractions=\"True\" SendRecreations=\"True\" /><AffiliationInfo SendAwards=\"True\" /><ContactInfo SendData=\"True\" /></HotelDescriptiveInfo><HotelDescriptiveInfo HotelCode=\"61582\"><HotelInfo SendData=\"True\" /><FacilityInfo SendMeetingRooms=\"True\" SendGuestRooms=\"True\" SendRestaurants=\"True\" /><Policies SendPolicies=\"True\" /><AreaInfo SendRefPoints=\"True\" SendAttractions=\"True\" SendRecreations=\"True\" /><AffiliationInfo SendAwards=\"True\" /><ContactInfo SendData=\"True\" /></HotelDescriptiveInfo><HotelDescriptiveInfo HotelCode=\"69911\"><HotelInfo SendData=\"True\" /><FacilityInfo SendMeetingRooms=\"True\" SendGuestRooms=\"True\" SendRestaurants=\"True\" /><Policies SendPolicies=\"True\" /><AreaInfo SendRefPoints=\"True\" SendAttractions=\"True\" SendRecreations=\"True\" /><AffiliationInfo SendAwards=\"True\" /><ContactInfo SendData=\"True\" /></HotelDescriptiveInfo><HotelDescriptiveInfo HotelCode=\"66461\"><HotelInfo SendData=\"True\" /><FacilityInfo SendMeetingRooms=\"True\" SendGuestRooms=\"True\" SendRestaurants=\"True\" /><Policies SendPolicies=\"True\" /><AreaInfo SendRefPoints=\"True\" SendAttractions=\"True\" SendRecreations=\"True\" /><AffiliationInfo SendAwards=\"True\" /><ContactInfo SendData=\"True\" /></HotelDescriptiveInfo><HotelDescriptiveInfo HotelCode=\"61572\"><HotelInfo SendData=\"True\" /><FacilityInfo SendMeetingRooms=\"True\" SendGuestRooms=\"True\" SendRestaurants=\"True\" /><Policies SendPolicies=\"True\" /><AreaInfo SendRefPoints=\"True\" SendAttractions=\"True\" SendRecreations=\"True\" /><AffiliationInfo SendAwards=\"True\" /><ContactInfo SendData=\"True\" /></HotelDescriptiveInfo><HotelDescriptiveInfo HotelCode=\"61574\"><HotelInfo SendData=\"True\" /><FacilityInfo SendMeetingRooms=\"True\" SendGuestRooms=\"True\" SendRestaurants=\"True\" /><Policies SendPolicies=\"True\" /><AreaInfo SendRefPoints=\"True\" SendAttractions=\"True\" SendRecreations=\"True\" /><AffiliationInfo SendAwards=\"True\" /><ContactInfo SendData=\"True\" /></HotelDescriptiveInfo><HotelDescriptiveInfo HotelCode=\"63064\"><HotelInfo SendData=\"True\" /><FacilityInfo SendMeetingRooms=\"True\" SendGuestRooms=\"True\" SendRestaurants=\"True\" /><Policies SendPolicies=\"True\" /><AreaInfo SendRefPoints=\"True\" SendAttractions=\"True\" SendRecreations=\"True\" /><AffiliationInfo SendAwards=\"True\" /><ContactInfo SendData=\"True\" /></HotelDescriptiveInfo><HotelDescriptiveInfo HotelCode=\"61568\"><HotelInfo SendData=\"True\" /><FacilityInfo SendMeetingRooms=\"True\" SendGuestRooms=\"True\" SendRestaurants=\"True\" /><Policies SendPolicies=\"True\" /><AreaInfo SendRefPoints=\"True\" SendAttractions=\"True\" SendRecreations=\"True\" /><AffiliationInfo SendAwards=\"True\" /><ContactInfo SendData=\"True\" /></HotelDescriptiveInfo><HotelDescriptiveInfo HotelCode=\"61573\"><HotelInfo SendData=\"True\" /><FacilityInfo SendMeetingRooms=\"True\" SendGuestRooms=\"True\" SendRestaurants=\"True\" /><Policies SendPolicies=\"True\" /><AreaInfo SendRefPoints=\"True\" SendAttractions=\"True\" SendRecreations=\"True\" /><AffiliationInfo SendAwards=\"True\" /><ContactInfo SendData=\"True\" /></HotelDescriptiveInfo><HotelDescriptiveInfo HotelCode=\"61577\"><HotelInfo SendData=\"True\" /><FacilityInfo SendMeetingRooms=\"True\" SendGuestRooms=\"True\" SendRestaurants=\"True\" /><Policies SendPolicies=\"True\" /><AreaInfo SendRefPoints=\"True\" SendAttractions=\"True\" SendRecreations=\"True\" /><AffiliationInfo SendAwards=\"True\" /><ContactInfo SendData=\"True\" /></HotelDescriptiveInfo><HotelDescriptiveInfo HotelCode=\"77835\"><HotelInfo SendData=\"True\" /><FacilityInfo SendMeetingRooms=\"True\" SendGuestRooms=\"True\" SendRestaurants=\"True\" /><Policies SendPolicies=\"True\" /><AreaInfo SendRefPoints=\"True\" SendAttractions=\"True\" SendRecreations=\"True\" /><AffiliationInfo SendAwards=\"True\" /><ContactInfo SendData=\"True\" /></HotelDescriptiveInfo><HotelDescriptiveInfo HotelCode=\"78859\"><HotelInfo SendData=\"True\" /><FacilityInfo SendMeetingRooms=\"True\" SendGuestRooms=\"True\" SendRestaurants=\"True\" /><Policies SendPolicies=\"True\" /><AreaInfo SendRefPoints=\"True\" SendAttractions=\"True\" SendRecreations=\"True\" /><AffiliationInfo SendAwards=\"True\" /><ContactInfo SendData=\"True\" /></HotelDescriptiveInfo><HotelDescriptiveInfo HotelCode=\"61584\"><HotelInfo SendData=\"True\" /><FacilityInfo SendMeetingRooms=\"True\" SendGuestRooms=\"True\" SendRestaurants=\"True\" /><Policies SendPolicies=\"True\" /><AreaInfo SendRefPoints=\"True\" SendAttractions=\"True\" SendRecreations=\"True\" /><AffiliationInfo SendAwards=\"True\" /><ContactInfo SendData=\"True\" /></HotelDescriptiveInfo><HotelDescriptiveInfo HotelCode=\"61579\"><HotelInfo SendData=\"True\" /><FacilityInfo SendMeetingRooms=\"True\" SendGuestRooms=\"True\" SendRestaurants=\"True\" /><Policies SendPolicies=\"True\" /><AreaInfo SendRefPoints=\"True\" SendAttractions=\"True\" SendRecreations=\"True\" /><AffiliationInfo SendAwards=\"True\" /><ContactInfo SendData=\"True\" /></HotelDescriptiveInfo><HotelDescriptiveInfo HotelCode=\"61571\"><HotelInfo SendData=\"True\" /><FacilityInfo SendMeetingRooms=\"True\" SendGuestRooms=\"True\" SendRestaurants=\"True\" /><Policies SendPolicies=\"True\" /><AreaInfo SendRefPoints=\"True\" SendAttractions=\"True\" SendRecreations=\"True\" /><AffiliationInfo SendAwards=\"True\" /><ContactInfo SendData=\"True\" /></HotelDescriptiveInfo><HotelDescriptiveInfo HotelCode=\"78958\"><HotelInfo SendData=\"True\" /><FacilityInfo SendMeetingRooms=\"True\" SendGuestRooms=\"True\" SendRestaurants=\"True\" /><Policies SendPolicies=\"True\" /><AreaInfo SendRefPoints=\"True\" SendAttractions=\"True\" SendRecreations=\"True\" /><AffiliationInfo SendAwards=\"True\" /><ContactInfo SendData=\"True\" /></HotelDescriptiveInfo><HotelDescriptiveInfo HotelCode=\"62984\"><HotelInfo SendData=\"True\" /><FacilityInfo SendMeetingRooms=\"True\" SendGuestRooms=\"True\" SendRestaurants=\"True\" /><Policies SendPolicies=\"True\" /><AreaInfo SendRefPoints=\"True\" SendAttractions=\"True\" SendRecreations=\"True\" /><AffiliationInfo SendAwards=\"True\" /><ContactInfo SendData=\"True\" /></HotelDescriptiveInfo><HotelDescriptiveInfo HotelCode=\"61579\"><HotelInfo SendData=\"True\" /><FacilityInfo SendMeetingRooms=\"True\" SendGuestRooms=\"True\" SendRestaurants=\"True\" /><Policies SendPolicies=\"True\" /><AreaInfo SendRefPoints=\"True\" SendAttractions=\"True\" SendRecreations=\"True\" /><AffiliationInfo SendAwards=\"True\" /><ContactInfo SendData=\"True\" /></HotelDescriptiveInfo><HotelDescriptiveInfo HotelCode=\"61587\"><HotelInfo SendData=\"True\" /><FacilityInfo SendMeetingRooms=\"True\" SendGuestRooms=\"True\" SendRestaurants=\"True\" /><Policies SendPolicies=\"True\" /><AreaInfo SendRefPoints=\"True\" SendAttractions=\"True\" SendRecreations=\"True\" /><AffiliationInfo SendAwards=\"True\" /><ContactInfo SendData=\"True\" /></HotelDescriptiveInfo><HotelDescriptiveInfo HotelCode=\"61867\"><HotelInfo SendData=\"True\" /><FacilityInfo SendMeetingRooms=\"True\" SendGuestRooms=\"True\" SendRestaurants=\"True\" /><Policies SendPolicies=\"True\" /><AreaInfo SendRefPoints=\"True\" SendAttractions=\"True\" SendRecreations=\"True\" /><AffiliationInfo SendAwards=\"True\" /><ContactInfo SendData=\"True\" /></HotelDescriptiveInfo><HotelDescriptiveInfo HotelCode=\"61575\"><HotelInfo SendData=\"True\" /><FacilityInfo SendMeetingRooms=\"True\" SendGuestRooms=\"True\" SendRestaurants=\"True\" /><Policies SendPolicies=\"True\" /><AreaInfo SendRefPoints=\"True\" SendAttractions=\"True\" SendRecreations=\"True\" /><AffiliationInfo SendAwards=\"True\" /><ContactInfo SendData=\"True\" /></HotelDescriptiveInfo><HotelDescriptiveInfo HotelCode=\"61588\"><HotelInfo SendData=\"True\" /><FacilityInfo SendMeetingRooms=\"True\" SendGuestRooms=\"True\" SendRestaurants=\"True\" /><Policies SendPolicies=\"True\" /><AreaInfo SendRefPoints=\"True\" SendAttractions=\"True\" SendRecreations=\"True\" /><AffiliationInfo SendAwards=\"True\" /><ContactInfo SendData=\"True\" /></HotelDescriptiveInfo></HotelDescriptiveInfos><POS><Source><RequestorId ID=\"10\" ID_Context=\"Synxis\"><CompanyName Code=\"WSBE\" /></RequestorId><RequestorID ID=\"10\" ID_Context=\"Synxis\"><CompanyName Code=\"WSBE\" /></RequestorID></Source></POS></OTA_HotelDescriptiveInfoRQ></v:Body></v:Envelope>").data(using: .ascii)
        
       
        lobj_Request.addValue("text/xml; charset=utf-8", forHTTPHeaderField: "Content-Type")
        lobj_Request.addValue("http://synxis.com/OTA2004AService/GetHotelDetails", forHTTPHeaderField: "SOAPAction")
        
        let task = session.dataTask(with: lobj_Request, completionHandler: {data, response, error -> Void in
            if error != nil
            {
                print("Error: " + error.debugDescription)
                completion(nil, error! as NSError)
            }
            else{
                let strData = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
                let outputDic = NSDictionary(xmlString: strData as! String)
                let obj  =  JSoapEnvelope.init(fromDictionary: outputDic as! [String : Any])
                if obj.body.oTAHotelDescriptiveInfoRS.hotelDescriptiveContents != nil{
            completion(obj.body.oTAHotelDescriptiveInfoRS.hotelDescriptiveContents.hotelDescriptiveContent, nil)
                }

            }
            
        })
        task.resume()
    }
    
    func checkAvailbility(startDate:String, endDate:String ,adultsNum:String , childNum:String, hotelCode:String,roomsNum:String ,completion:  @escaping (_ :JCCheckAvaibility?, _ :NSError?) -> Void)
    {
        
        var lobj_Request = NSMutableURLRequest(url: NSURL(string: getBaseUrl)! as URL) as URLRequest
        let session = URLSession.shared
        var err: NSError?
        
        lobj_Request.httpMethod = "POST"
        lobj_Request.addValue("text/xml; charset=utf-8", forHTTPHeaderField: "Content-Type")
        //lobj_Request.addValue("223", forHTTPHeaderField: "Content-Length")
        lobj_Request.addValue("http://synxis.com/OTA2004AService/CheckAvailability", forHTTPHeaderField: "SOAPAction")
        lobj_Request.httpBody=String(format: "%@%@", soapHeader,"<n1:OTA_HotelAvailRQ xmlns:n1=\"http://www.opentravel.org/OTA/2003/05\" AvailRatesOnly=\"false\" BestOnly=\"false\" EchoToken=\"JAZ-Android_QkPvCUzmFr\" ExactMatchOnly=\"false\" HotelStayOnly=\"false\" MaxResponses=\"0\" PrimaryLangID=\"en-US\" SummaryOnly=\"false\"><n1:POS><n1:Source><n1:RequestorID ID=\"10\" ID_Context=\"Synxis\"><n1:CompanyName Code=\"MobileGC\"></n1:CompanyName></n1:RequestorID></n1:Source></n1:POS><n1:AvailRequestSegments><n1:AvailRequestSegment><n1:StayDateRange End=\"\(endDate)\" Start=\"\(startDate)\" /><n1:RoomStayCandidates><n1:RoomStayCandidate Quantity=\"\(roomsNum)\"><n1:GuestCounts><n1:GuestCount AgeQualifyingCode=\"10\" Count=\"\(adultsNum)\" /><n1:GuestCount AgeQualifyingCode=\"8\" Count=\"\(childNum)\" /></n1:GuestCounts></n1:RoomStayCandidate></n1:RoomStayCandidates><n1:HotelSearchCriteria><n1:Criterion><n1:HotelRef HotelCode=\"\(hotelCode)\" /></n1:Criterion></n1:HotelSearchCriteria></n1:AvailRequestSegment></n1:AvailRequestSegments></n1:OTA_HotelAvailRQ></v:Body></v:Envelope>").data(using: .ascii)
        
        
        let task = session.dataTask(with: lobj_Request, completionHandler: {data, response, error -> Void in
            if error != nil
            {
                print("Error: " + error.debugDescription)
                completion(nil, error! as NSError)
            }
            else{
                let strData = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
                let outputDic = NSDictionary(xmlString: strData as! String)
                let obj  =  JCCheckAvaibility.init(fromDictionary: outputDic as! [String : Any])
                completion(obj, nil)
                
            }
            
        })
        task.resume()
    }
    
    func checkAvailbility(startDate:String, endDate:String ,adultsNum:String , childNum:String, hotelCode:String,roomsNum:String,longitude:String,latitude:String ,completion:  @escaping (_ :JCCheckAvaibility?, _ :NSError?) -> Void)
    {
        
        var lobj_Request = NSMutableURLRequest(url: NSURL(string: getBaseUrl)! as URL) as URLRequest
        let session = URLSession.shared
        var err: NSError?
        
        lobj_Request.httpMethod = "POST"
        lobj_Request.addValue("text/xml; charset=utf-8", forHTTPHeaderField: "Content-Type")
        //lobj_Request.addValue("223", forHTTPHeaderField: "Content-Length")
        lobj_Request.addValue("http://synxis.com/OTA2004AService/CheckAvailability", forHTTPHeaderField: "SOAPAction")
        lobj_Request.httpBody=String(format: "%@%@", soapHeader,"<n1:OTA_HotelAvailRQ xmlns:n1=\"http://www.opentravel.org/OTA/2003/05\" AvailRatesOnly=\"false\" BestOnly=\"false\" EchoToken=\"JAZ-Android_QkPvCUzmFr\" ExactMatchOnly=\"false\" HotelStayOnly=\"false\" MaxResponses=\"0\" PrimaryLangID=\"en-US\" SummaryOnly=\"false\"><n1:POS><n1:Source><n1:RequestorID ID=\"10\" ID_Context=\"Synxis\"><n1:CompanyName Code=\"MobileGC\"></n1:CompanyName></n1:RequestorID></n1:Source></n1:POS><n1:AvailRequestSegments><n1:AvailRequestSegment><n1:StayDateRange End=\"\(endDate)\" Start=\"\(startDate)\" /><n1:RoomStayCandidates><n1:RoomStayCandidate Quantity=\"\(roomsNum)\"><n1:GuestCounts><n1:GuestCount AgeQualifyingCode=\"10\" Count=\"\(adultsNum)\" /><n1:GuestCount AgeQualifyingCode=\"8\" Count=\"\(childNum)\" /></n1:GuestCounts></n1:RoomStayCandidate></n1:RoomStayCandidates><n1:HotelSearchCriteria><n1:Criterion><n1:Position Latitude=\"\(latitude)\" Longitude=\"\(longitude)\" /><n1:Radius Distance=\"250\" DistanceMeasure=\"kilometers\" /></n1:Criterion></n1:HotelSearchCriteria></n1:AvailRequestSegment></n1:AvailRequestSegments></n1:OTA_HotelAvailRQ></v:Body></v:Envelope>").data(using: .ascii)
        
        
        let task = session.dataTask(with: lobj_Request, completionHandler: {data, response, error -> Void in
            if error != nil
            {
                print("Error: " + error.debugDescription)
                completion(nil, error! as NSError)
            }
            else{
                let strData = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
                let outputDic = NSDictionary(xmlString: strData as! String)
                let obj  =  JCCheckAvaibility.init(fromDictionary: outputDic as! [String : Any])
                completion(obj, nil)
                
            }
            
        })
        task.resume()
    }
}
