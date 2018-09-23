//
//  BookingAPIManager.swift
//  JazHotels
//
//  Created by Nada Gamal Mohamed on 9/8/18.
//  Copyright © 2018 Jaz. All rights reserved.
//

import Foundation
class BookingAPIManager: NSObject {
var getBaseUrl:String {
    get{
        return "https://interface.synxis.com/channelconnect.asmx"
    }
}
var soapHeader: String = "<v:Envelope xmlns:v=\"http://www.w3.org/2003/05/soap-envelope\"><v:Header><n0:HTNGHeader xmlns:n0=\"http://htng.org/1.1/Header/\"><n0:From><n0:Credential><n0:userName>JAZHTLMCBEPROD</n0:userName><n0:password>1fvnZ$1aUKO</n0:password></n0:Credential></n0:From></n0:HTNGHeader></v:Header><v:Body>"
func getReservation(userName:String, pinNumber:String,completion:  @escaping (_ :JBReservations?, _ :NSError?) -> Void)
{
    
    var lobj_Request = NSMutableURLRequest(url: NSURL(string: getBaseUrl)! as URL) as URLRequest
    let session = URLSession.shared
    var err: NSError?
    
    lobj_Request.httpMethod = "POST"
    lobj_Request.addValue("text/xml; charset=utf-8", forHTTPHeaderField: "Content-Type")
    //lobj_Request.addValue("223", forHTTPHeaderField: "Content-Length")
    lobj_Request.addValue("http://synxis.com/OTA2004AService/ReadReservations", forHTTPHeaderField: "SOAPAction")
    lobj_Request.httpBody=String(format: "%@%@", soapHeader,"<OTA_ReadRQ xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" EchoToken=\"JAZ-Android_n9pYjBgNHt\" PrimaryLangID=\"en-US\" ReturnListIndicator=\"True\" PrimaryLangId=\"en-US\" MaxResponses=\"0\" xmlns=\"http://www.opentravel.org/OTA/2003/05\"><ReadRequests><HotelReadRequest ChainCode=\"16401\"><UserID PinNumber=\"\(pinNumber)\" ID=\"\(userName)\"><CompanyName /></UserID></HotelReadRequest></ReadRequests><POS><Source><RequestorID ID=\"10\" ID_Context=\"Synxis\"><CompanyName Code=\"WSBE\" /></RequestorID></Source></POS></OTA_ReadRQ></v:Body></v:Envelope>").data(using: .ascii)
    
    
    let task = session.dataTask(with: lobj_Request, completionHandler: {data, response, error -> Void in
        if error != nil
        {
            print("Error: " + error.debugDescription)
            completion(nil, error! as NSError)
        }
        else{
            let strData = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
            let outputDic = NSDictionary(xmlString: strData as! String)
            let obj  =  JBReservations.init(fromDictionary: outputDic as! [String : Any])
            completion(obj, nil)
            
        }
        
    })
    task.resume()
}
    // states are "Initiate" or "commit"
    func reserveRoom(numberOfAdults:String,numberOfChild:String,numberOfRooms:String,roomTypeCode:String,ratePlanCode:String,checkInDate:String,checkOutDate:String,hotelCode:String,chainCode:String,creditCardNum:String,creditCardExpireDate:String,cardNameHolder:String,state:String,completion:  @escaping (_ :CBReservation?, _ :NSError?) -> Void) {
        let userData = UserDefaults.getObjectDefault(key: HotelJazConstants.userDefault.userData) as? UserProfile

        var lobj_Request = NSMutableURLRequest(url: NSURL(string: getBaseUrl)! as URL) as URLRequest
        let session = URLSession.shared
        var err: NSError?
        
        lobj_Request.httpMethod = "POST"
        lobj_Request.addValue("text/xml; charset=utf-8", forHTTPHeaderField: "Content-Type")
        //lobj_Request.addValue("223", forHTTPHeaderField: "Content-Length")
        lobj_Request.addValue("http://synxis.com/OTA2004AService/CreateReservations", forHTTPHeaderField: "SOAPAction")
        lobj_Request.httpBody=String(format: "%@%@", soapHeader,"<OTA_HotelResRQ xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" EchoToken=\"JAZ-Android_M6cAzah7Za\" PrimaryLangID=\"en-US\" ResStatus=\"\(state)\" xmlns=\"http://www.opentravel.org/OTA/2003/05\"><POS><Source><RequestorId ID=\"10\" ID_Context=\"Synxis\"><CompanyName Code=\"WSBE\" /></RequestorId><RequestorID ID=\"10\" ID_Context=\"Synxis\"><CompanyName Code=\"WSBE\" /></RequestorID></Source></POS><HotelReservations><HotelReservation RoomStayReservation=\"true\"><RoomStays><RoomStay><RoomTypes><RoomType RoomTypeCode=\"\(roomTypeCode)\" NumberOfUnits=\"\(numberOfRooms)\" /></RoomTypes><RatePlans><RatePlan RatePlanCode=\"\(ratePlanCode)\" /></RatePlans><GuestCounts><GuestCount AgeQualifyingCode=\"10\" Count=\"\(numberOfAdults)\" /><GuestCount AgeQualifyingCode=\"8\" Count=\"\(numberOfChild)\" /></GuestCounts><TimeSpan Start=\"\(checkInDate)\" End=\"\(checkOutDate)\" /><BasicPropertyInfo HotelCode=\"\(hotelCode)\" ChainCode=\"\(chainCode)\" /></RoomStay></RoomStays><ResGuests><ResGuest PrimaryIndicator=\"true\"><Profiles><ProfileInfo><Profile ShareAllMarketInd=\"Yes\"><Customer BirthDate=\"0001-01-01\"><PersonName><NamePrefix>\(userData?.title ?? "Mrs")</NamePrefix><GivenName>\(userData?.userName?.firstName ?? "")</GivenName><MiddleName>Gamal</MiddleName><Surname>Mohamed</Surname></PersonName><Telephone PhoneTechType=\"5\" PhoneNumber=\"\(userData?.userContact?.mobilePhone ?? "")\" DefaultInd=\"false\" /><Telephone PhoneTechType=\"1\" PhoneNumber=\"\(userData?.userContact?.mobilePhone ?? "")\" DefaultInd=\"false\" /><Email>\(userData?.userContact?.emailAddress ?? "")</Email></Customer><UserID PinNumber=\"\(userData?.userSynXisInfo?.synXisPassword ?? "")\" ID=\"\(userData?.userSynXisInfo?.synXisUserID ?? "")\"><CompanyName /></UserID></Profile></ProfileInfo></Profiles></ResGuest></ResGuests><ResGlobalInfo><Guarantee><GuaranteesAccepted><GuaranteeAccepted><PaymentCard CardCode=\"VI\" CardNumber=\"\(creditCardNum)\" SeriesCode=\"\" ExpireDate=\"\(userData?.userCardPayment?.expireDate ?? "")\"><CardHolderName>\(userData?.userCardPayment?.cardHolderName ?? "")</CardHolderName></PaymentCard></GuaranteeAccepted></GuaranteesAccepted></Guarantee></ResGlobalInfo><WrittenConfInst><SupplementalData Name=\"Guestconf\" Language=\"en-us\"><Text /></SupplementalData></WrittenConfInst><Services /></HotelReservation></HotelReservations></OTA_HotelResRQ></v:Body></v:Envelope>").data(using: .ascii)
        
        print(String(format: "%@%@", soapHeader,"<OTA_HotelResRQ xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" EchoToken=\"JAZ-Android_M6cAzah7Za\" PrimaryLangID=\"en-US\" ResStatus=\"\(state)\" xmlns=\"http://www.opentravel.org/OTA/2003/05\"><POS><Source><RequestorId ID=\"10\" ID_Context=\"Synxis\"><CompanyName Code=\"WSBE\" /></RequestorId><RequestorID ID=\"10\" ID_Context=\"Synxis\"><CompanyName Code=\"WSBE\" /></RequestorID></Source></POS><HotelReservations><HotelReservation RoomStayReservation=\"true\"><RoomStays><RoomStay><RoomTypes><RoomType RoomTypeCode=\"\(roomTypeCode)\" NumberOfUnits=\"\(numberOfRooms)\" /></RoomTypes><RatePlans><RatePlan RatePlanCode=\"\(ratePlanCode)\" /></RatePlans><GuestCounts><GuestCount AgeQualifyingCode=\"10\" Count=\"\(numberOfAdults)\" /><GuestCount AgeQualifyingCode=\"8\" Count=\"\(numberOfChild)\" /></GuestCounts><TimeSpan Start=\"\(checkInDate)\" End=\"\(checkOutDate)\" /><BasicPropertyInfo HotelCode=\"\(hotelCode)\" ChainCode=\"\(chainCode)\" /></RoomStay></RoomStays><ResGuests><ResGuest PrimaryIndicator=\"true\"><Profiles><ProfileInfo><Profile ShareAllMarketInd=\"Yes\"><Customer BirthDate=\"0001-01-01\"><PersonName><NamePrefix>\(userData?.title ?? "Mrs")</NamePrefix><GivenName>\(userData?.userName?.firstName ?? "")</GivenName><MiddleName>Gamal</MiddleName><Surname>Mohamed</Surname></PersonName><Telephone PhoneTechType=\"5\" PhoneNumber=\"\(userData?.userContact?.mobilePhone ?? "")\" DefaultInd=\"false\" /><Telephone PhoneTechType=\"1\" PhoneNumber=\"\(userData?.userContact?.mobilePhone ?? "")\" DefaultInd=\"false\" /><Email>\(userData?.userContact?.emailAddress ?? "")</Email></Customer><UserID PinNumber=\"\(userData?.userSynXisInfo?.synXisPassword ?? "")\" ID=\"\(userData?.userSynXisInfo?.synXisUserID ?? "")\"><CompanyName /></UserID></Profile></ProfileInfo></Profiles></ResGuest></ResGuests><ResGlobalInfo><Guarantee><GuaranteesAccepted><GuaranteeAccepted><PaymentCard CardCode=\"VI\" CardNumber=\"\(creditCardNum)\" SeriesCode=\"\" ExpireDate=\"\(userData?.userCardPayment?.expireDate ?? "")\"><CardHolderName>\(userData?.userCardPayment?.cardHolderName ?? "")</CardHolderName></PaymentCard></GuaranteeAccepted></GuaranteesAccepted></Guarantee></ResGlobalInfo><WrittenConfInst><SupplementalData Name=\"Guestconf\" Language=\"en-us\"><Text /></SupplementalData></WrittenConfInst><Services /></HotelReservation></HotelReservations></OTA_HotelResRQ></v:Body></v:Envelope>"))
        let task = session.dataTask(with: lobj_Request, completionHandler: {data, response, error -> Void in
            if error != nil
            {
                print("Error: " + error.debugDescription)
                completion(nil, error! as NSError)
            }
            else{
                let strData = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
                let outputDic = NSDictionary(xmlString: strData as! String)
                let obj  =  CBReservation.init(fromDictionary: outputDic as! [String : Any])
                completion(obj, nil)
                
            }
            
        })
        task.resume()
        
        
    }
    
    func cancelReservation(confirmationId:String,hotelCode:String,chainCode:String,completion:  @escaping (_ :CRCancelBookingModel?, _ :NSError?) -> Void) {
        var lobj_Request = NSMutableURLRequest(url: NSURL(string: getBaseUrl)! as URL) as URLRequest
        let session = URLSession.shared
        
        lobj_Request.httpMethod = "POST"
        lobj_Request.addValue("text/xml; charset=utf-8", forHTTPHeaderField: "Content-Type")
        //lobj_Request.addValue("223", forHTTPHeaderField: "Content-Length")
        lobj_Request.addValue("http://synxis.com/OTA2004AService/CancelReservations", forHTTPHeaderField: "SOAPAction")
        lobj_Request.httpBody = String(format: "%@%@", soapHeader,"<OTA_CancelRQ xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" EchoToken=\"JAZ-Android_Vg4Gy7y5OU\" PrimaryLangID=\"en-US\" xmlns=\"http://www.opentravel.org/OTA/2003/05\"><TPA_Extensions><WrittenConfInst><SupplementalData Name=\"CancelConf\" Language=\"en-us\"><Text /></SupplementalData></WrittenConfInst></TPA_Extensions><UniqueID Type=\"14\" ID=\"\(confirmationId)\" ID_Context=\"CrsConfirmNumber\" /><Verification><TPA_Extensions><BasicPropertyInfo ChainCode=\"\(chainCode)\" HotelCode=\"\(hotelCode)\" /></TPA_Extensions></Verification><POS><Source><RequestorId ID=\"10\" ID_Context=\"Synxis\"><CompanyName Code=\"WSBE\" /></RequestorId><RequestorID ID=\"10\" ID_Context=\"Synxis\"><CompanyName Code=\"WSBE\" /></RequestorID></Source></POS></OTA_CancelRQ></v:Body></v:Envelope>").data(using: .ascii)
      print(String(format: "%@%@", soapHeader,"<OTA_CancelRQ xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" EchoToken=\"JAZ-Android_Vg4Gy7y5OU\" PrimaryLangID=\"en-US\" xmlns=\"http://www.opentravel.org/OTA/2003/05\"><TPA_Extensions><WrittenConfInst><SupplementalData Name=\"CancelConf\" Language=\"en-us\"><Text /></SupplementalData></WrittenConfInst></TPA_Extensions><UniqueID Type=\"14\" ID=\"\(confirmationId)\" ID_Context=\"CrsConfirmNumber\" /><Verification><TPA_Extensions><BasicPropertyInfo ChainCode=\"\(chainCode)\" HotelCode=\"\(hotelCode)\" /></TPA_Extensions></Verification><POS><Source><RequestorId ID=\"10\" ID_Context=\"Synxis\"><CompanyName Code=\"WSBE\" /></RequestorId><RequestorID ID=\"10\" ID_Context=\"Synxis\"><CompanyName Code=\"WSBE\" /></RequestorID></Source></POS></v:Body></v:Envelope>"))
        
        let task = session.dataTask(with: lobj_Request, completionHandler: {data, response, error -> Void in
            if error != nil
            {
                print("Error: " + error.debugDescription)
                completion(nil, error! as NSError)
            }
            else{
                let strData = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
                let outputDic = NSDictionary(xmlString: strData as! String)
                let obj  =  CRCancelBookingModel.init(fromDictionary: outputDic as! [String : Any])
                completion(obj, nil)
                
            }
            
        })
        task.resume()
        
        
    }
    
    func modifyReservation(numberOfAdults:String,numberOfChild:String,numberOfRooms:String,roomTypeCode:String,ratePlanCode:String,checkInDate:String,checkOutDate:String,hotelCode:String,chainCode:String,confirmationId:String,comments:String,completion:  @escaping (_ :MRModifyBookingModel?, _ :NSError?) -> Void) {
        var lobj_Request = NSMutableURLRequest(url: NSURL(string: getBaseUrl)! as URL) as URLRequest
        let session = URLSession.shared
        let userData = UserDefaults.getObjectDefault(key: HotelJazConstants.userDefault.userData) as? UserProfile

        lobj_Request.httpMethod = "POST"
        lobj_Request.addValue("text/xml; charset=utf-8", forHTTPHeaderField: "Content-Type")
        //lobj_Request.addValue("223", forHTTPHeaderField: "Content-Length")
        lobj_Request.addValue("http://synxis.com/OTA2004AService/ModifyReservations", forHTTPHeaderField: "SOAPAction")
        lobj_Request.httpBody = String(format: "%@%@", soapHeader,"<OTA_HotelResModifyRQ xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" EchoToken=\"JAZ-Android_LEVIb9h7QC\" PrimaryLangID=\"en-US\" xmlns=\"http://www.opentravel.org/OTA/2003/05\"><POS><Source><RequestorId ID=\"10\" ID_Context=\"Synxis\"><CompanyName Code=\"WSBE\" /></RequestorId></Source></POS><HotelResModifies><HotelResModify RoomStayReservation=\"true\"><UniqueID Type=\"14\" ID=\"\(confirmationId)\" ID_Context=\"CrsConfirmNumber\" /><RoomStays><RoomStay><RoomTypes><RoomType RoomTypeCode=\"\(roomTypeCode)\" NumberOfUnits=\"\(numberOfRooms)\" /></RoomTypes><RatePlans><RatePlan RatePlanCode=\"\(roomTypeCode)\" /></RatePlans><GuestCounts><GuestCount AgeQualifyingCode=\"10\" Count=\"\(numberOfAdults)\" /><GuestCount AgeQualifyingCode=\"8\" Count=\"\(numberOfChild)\" /></GuestCounts><TimeSpan Start=\"\(checkInDate)\" End=\"\(checkOutDate)\" /><BasicPropertyInfo HotelCode=\"\(hotelCode)\" ChainCode=\"\(chainCode)\" /></RoomStay></RoomStays><ResGuests><ResGuest PrimaryIndicator=\"true\"><Profiles><ProfileInfo><Profile ShareAllMarketInd=\"Yes\"><Customer BirthDate=\"0001-01-01\"><PersonName><NamePrefix /><GivenName>\"\(userData?.userName?.firstName ?? "")\"</GivenName><MiddleName /><Surname>\"\(userData?.title ?? "")\"</Surname></PersonName><Telephone PhoneTechType=\"5\" PhoneNumber=\"\(userData?.userContact?.mobilePhone ?? "")\" DefaultInd=\"false\" /><Email>\"\(userData?.userContact?.mobilePhone ?? "")\"</Email><Address FormattedInd=\"false\" DefaultInd=\"true\"><AddressLine /><AddressLine /><AddressLine /><CityName /><PostalCode /><CountryName Code=\"EG\" /></Address></Customer><UserID PinNumber=\"\(userData?.userSynXisInfo?.synXisPassword ?? "")\" ID=\"\(userData?.userSynXisInfo?.synXisUserID ?? "")\" /></Profile></ProfileInfo></Profiles></ResGuest></ResGuests><ResGlobalInfo><Comments><Comment><Text>\"\(comments)\"</Text></Comment></Comments></ResGlobalInfo><WrittenConfInst><SupplementalData Name=\"Guestconf\" Language=\"en-us\"><Text></Text></SupplementalData></WrittenConfInst></HotelResModify></HotelResModifies></OTA_HotelResModifyRQ></v:Body></v:Envelope>").data(using: .ascii)
    
        print(String(format: "%@%@", soapHeader,"<OTA_HotelResModifyRQ xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" EchoToken=\"JAZ-Android_LEVIb9h7QC\" PrimaryLangID=\"en-US\" xmlns=\"http://www.opentravel.org/OTA/2003/05\"><POS><Source><RequestorId ID=\"10\" ID_Context=\"Synxis\"><CompanyName Code=\"WSBE\" /></RequestorId></Source></POS><HotelResModifies><HotelResModify RoomStayReservation=\"true\"><UniqueID Type=\"14\" ID=\"\(confirmationId)\" ID_Context=\"CrsConfirmNumber\" /><RoomStays><RoomStay><RoomTypes><RoomType RoomTypeCode=\"\(roomTypeCode)\" NumberOfUnits=\"\(numberOfRooms)\" /></RoomTypes><RatePlans><RatePlan RatePlanCode=\"\(roomTypeCode)\" /></RatePlans><GuestCounts><GuestCount AgeQualifyingCode=\"10\" Count=\"\(numberOfAdults)\" /><GuestCount AgeQualifyingCode=\"8\" Count=\"\(numberOfChild)\" /></GuestCounts><TimeSpan Start=\"\(checkInDate)\" End=\"\(checkOutDate)\" /><BasicPropertyInfo HotelCode=\"\(hotelCode)\" ChainCode=\"\(chainCode)\" /></RoomStay></RoomStays><ResGuests><ResGuest PrimaryIndicator=\"true\"><Profiles><ProfileInfo><Profile ShareAllMarketInd=\"Yes\"><Customer BirthDate=\"0001-01-01\"><PersonName><NamePrefix /><GivenName>\"\(userData?.userName?.firstName ?? "")\"</GivenName><MiddleName /><Surname>\"\(userData?.title ?? "")\"</Surname></PersonName><Telephone PhoneTechType=\"5\" PhoneNumber=\"\(userData?.userContact?.mobilePhone ?? "")\" DefaultInd=\"false\" /><Email>\"\(userData?.userContact?.mobilePhone ?? "")\"</Email><Address FormattedInd=\"false\" DefaultInd=\"true\"><AddressLine /><AddressLine /><AddressLine /><CityName /><PostalCode /><CountryName Code=\"EG\" /></Address></Customer><UserID PinNumber=\"\(userData?.userSynXisInfo?.synXisPassword ?? "")\" ID=\"\(userData?.userSynXisInfo?.synXisUserID ?? "")\" /></Profile></ProfileInfo></Profiles></ResGuest></ResGuests><WrittenConfInst><SupplementalData Name=\"Guestconf\" Language=\"en-us\"><Text></Text></SupplementalData></WrittenConfInst></HotelResModify></HotelResModifies></OTA_HotelResModifyRQ></v:Body></v:Envelope>"))
        let task = session.dataTask(with: lobj_Request, completionHandler: {data, response, error -> Void in
            if error != nil
            {
                print("Error: " + error.debugDescription)
                completion(nil, error! as NSError)
            }
            else{
                let strData = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
                let outputDic = NSDictionary(xmlString: strData as! String)
                let obj  =  MRModifyBookingModel.init(fromDictionary: outputDic as! [String : Any])
                completion(obj, nil)
                
            }
            
        })
        task.resume()
        
        
    }
    
}
