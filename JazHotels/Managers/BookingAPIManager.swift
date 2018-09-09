//
//  BookingAPIManager.swift
//  JazHotels
//
//  Created by Nada Gamal Mohamed on 9/8/18.
//  Copyright © 2018 Jaz. All rights reserved.
//

import Foundation
var getBaseUrl:String {
    get{
        return "https://interface.synxis.com/channelconnect.asmx"
    }
}
var soapHeader: String = "<v:Envelope xmlns:v=\"http://www.w3.org/2003/05/soap-envelope\"><v:Header><n0:HTNGHeader xmlns:n0=\"http://htng.org/1.1/Header/\"><n0:From><n0:Credential><n0:userName>JAZHTLMCBEPROD</n0:userName><n0:password>1fvnZ$1aUKO</n0:password></n0:Credential></n0:From></n0:HTNGHeader></v:Header><v:Body>"
func checkAvailbility(startDate:String, endDate:String ,adultsNum:String , childNum:String, hotelCodes:[String],roomsNum:String,completion:  @escaping (_ :JBReservation?, _ :NSError?) -> Void)
{
    
    var lobj_Request = NSMutableURLRequest(url: NSURL(string: getBaseUrl)! as URL) as URLRequest
    let session = URLSession.shared
    var err: NSError?
    
    lobj_Request.httpMethod = "POST"
    lobj_Request.addValue("text/xml; charset=utf-8", forHTTPHeaderField: "Content-Type")
    //lobj_Request.addValue("223", forHTTPHeaderField: "Content-Length")
    lobj_Request.addValue("http://synxis.com/OTA2004AService/ReadReservations", forHTTPHeaderField: "SOAPAction")
    lobj_Request.httpBody=String(format: "%@%@", soapHeader,"<OTA_ReadRQ xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" EchoToken=\"JAZ-Android_n9pYjBgNHt\" PrimaryLangID=\"en-US\" ReturnListIndicator=\"True\" PrimaryLangId=\"en-US\" MaxResponses=\"0\" xmlns=\"http://www.opentravel.org/OTA/2003/05\"><ReadRequests><HotelReadRequest ChainCode=\"16401\"><UserID PinNumber=\"FkCOJRoJE5\" ID=\"m.alshazly@gmail.com\"><CompanyName /></UserID></HotelReadRequest></ReadRequests><POS><Source><RequestorID ID=\"10\" ID_Context=\"Synxis\"><CompanyName Code=\"WSBE\" /></RequestorID></Source></POS></OTA_ReadRQ></v:Body></v:Envelope>").data(using: .ascii)
    
    
    let task = session.dataTask(with: lobj_Request, completionHandler: {data, response, error -> Void in
        if error != nil
        {
            print("Error: " + error.debugDescription)
            completion(nil, error! as NSError)
        }
        else{
            let strData = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
            let outputDic = NSDictionary(xmlString: strData as! String)
            let obj  =  JBReservation.init(fromDictionary: outputDic as! [String : Any])
            completion(obj, nil)
            
        }
        
    })
    task.resume()
}
