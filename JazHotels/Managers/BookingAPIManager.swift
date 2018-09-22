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
    func reserveRoom(numberOfAdults:Int,numberOfChild:Int,numberOfRooms:Int,roomTypeCode:String,ratePlanCode:String,checkInDate:String,checkOutDate:String,hotelCode:String,chainCode:String,creditCardNum:String,creditCardExpireDate:String,cardNameHolder:String,state:String,completion:  @escaping (_ :CBReservation?, _ :NSError?) -> Void) {
        let userData = UserDefaults.getObjectDefault(key: HotelJazConstants.userDefault.userData) as? UserProfile

        var lobj_Request = NSMutableURLRequest(url: NSURL(string: getBaseUrl)! as URL) as URLRequest
        let session = URLSession.shared
        var err: NSError?
        
        lobj_Request.httpMethod = "POST"
        lobj_Request.addValue("text/xml; charset=utf-8", forHTTPHeaderField: "Content-Type")
        //lobj_Request.addValue("223", forHTTPHeaderField: "Content-Length")
        lobj_Request.addValue("http://synxis.com/OTA2004AService/ReadReservations", forHTTPHeaderField: "SOAPAction")
        lobj_Request.httpBody=String(format: "%@%@", soapHeader,"<OTA_HotelResRQ xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" EchoToken=\"JAZ-Android_M6cAzah7Za\" PrimaryLangID=\"en-US\" ResStatus=\(state) xmlns=\"http://www.opentravel.org/OTA/2003/05\"><POS><Source><RequestorId ID=\"10\" ID_Context=\"Synxis\"><CompanyName Code=\"WSBE\" /></RequestorId><RequestorID ID=\"10\" ID_Context=\"Synxis\"><CompanyName Code=\"WSBE\" /></RequestorID></Source></POS><HotelReservations><HotelReservation RoomStayReservation=\"true\"><RoomStays><RoomStay><RoomTypes><RoomType RoomTypeCode=\"CC2T\" NumberOfUnits=\"3\" /></RoomTypes><RatePlans><RatePlan RatePlanCode=\"BARAQUA\" /></RatePlans><GuestCounts><GuestCount AgeQualifyingCode=\"10\" Count=\(numberOfAdults) /><GuestCount AgeQualifyingCode=\"8\" Count=\(numberOfChild) /></GuestCounts><TimeSpan Start=\(checkInDate) End=\(checkOutDate) /><BasicPropertyInfo HotelCode=\(hotelCode) ChainCode=\(chainCode) /></RoomStay></RoomStays><ResGuests><ResGuest PrimaryIndicator=\"true\"><Profiles><ProfileInfo><Profile ShareAllMarketInd=\"Yes\"><Customer BirthDate=\"0001-01-01\"><PersonName><NamePrefix>Mrs.</NamePrefix><GivenName>Nada</GivenName><MiddleName>Gamal</MiddleName><Surname>Mohamed</Surname></PersonName><Telephone PhoneTechType=\"5\" PhoneNumber=\(userData?.userContact?.mobilePhone) DefaultInd=\"false\" /><Email>\(userData?.userContact?.emailAddress)</Email></Customer><UserID PinNumber=\(userData?.userSynXisInfo?.synXisPassword)ID=(userData?.userSynXisInfo?.synXisUserID)><CompanyName /></UserID></Profile></ProfileInfo></Profiles><ResGuest><ResGuests><ResGlobalInfo><Guarantee><GuaranteesAccepted><GuaranteeAccepted><PaymentCard CardCode=\"VI\" CardNumber=\(userData?.userCardPayment?.cardNumber) SeriesCode=\"co\" ExpireDate=\(userData?.userCardPayment?.expireDate)><CardHolderName>\(userData?.userCardPayment?.cardHolderName)</CardHolderName></PaymentCard></GuaranteeAccepted></GuaranteesAccepted></Guarantee></ResGlobalInfo><WrittenConfInst><SupplementalData Name=\"Guestconf\" Language=\"en-us\"><Text /></SupplementalData></WrittenConfInst><Services /></HotelReservation></HotelReservations></OTA_HotelResRQ></v:Body></v:Envelope>").data(using: .ascii)
        
        
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
}
