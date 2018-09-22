//
//  Helper.swift
//  JazHotels
//
//  Created by Nada Gamal Mohamed on 7/1/18.
//  Copyright © 2018 Jaz. All rights reserved.
//

import Foundation
import UIKit

public struct JazHotels {
    static var hotels: [JHotelDescriptiveContent]!
    static var hotelsImages: Dictionary<String,[String]>?
    static var hotelsCoords: Dictionary<String,[String]>?
    static var hotelsURLs: Dictionary<String,String>?
    static var hotelsName: [String]?
    static var hotelsCode: [Int]?
    
    
}
enum LINE_POSITION {
    case LINE_POSITION_TOP
    case LINE_POSITION_BOTTOM
}
extension UISegmentedControl {
    func removeBorders() {
        setBackgroundImage(imageWithColor(color: backgroundColor!), for: .normal, barMetrics: .default)
        setBackgroundImage(imageWithColor(color: tintColor!), for: .selected, barMetrics: .default)
        setDividerImage(imageWithColor(color: UIColor.clear), forLeftSegmentState: .normal, rightSegmentState: .normal, barMetrics: .default)
    }
    
    // create a 1x1 image with this color
    private func imageWithColor(color: UIColor) -> UIImage {
        let rect = CGRect(x: 0.0, y: 0.0, width:  1.0, height: 1.0)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        context!.setFillColor(color.cgColor);
        context!.fill(rect);
        let image = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        return image!
    }
}
extension UIFont {
    class func cairoFontExtraLightOfSize(size: CGFloat) -> UIFont {
        return UIFont(name: "MontserratAlternates-ExtraLight", size: size)!
    }
    
    class func cairoFontLightOfSize(size: CGFloat) -> UIFont {
        return UIFont(name: "Montserrat-Light", size: size)!
    }
    
    class func cairoFontRegularOfSize(size: CGFloat) -> UIFont {
        return UIFont(name: "Montserrat-Regular", size: size)!
    }
    
    class func cairoFontSemiBlodOfSize(size: CGFloat) -> UIFont {
        return UIFont(name: "Montserrat-SemiBold", size: size)!
    }
    
    class func cairoFontBlodOfSize(size: CGFloat) -> UIFont {
        return UIFont(name: "Montserrat-Bold", size: size)!
    }
    
    class func cairoFontSemiBlackOfSize(size: CGFloat) -> UIFont {
        return UIFont(name: "Montserrat-Bold", size: size)!
    }
}



extension UserDefaults
{
    static let userDef = UserDefaults.standard
    
    static func saveUserDefault(key: String, value: Any) {
        userDef.set(value, forKey: key)
    }
    static func getUserDefault(key: String)->Any {
        return userDef.object(forKey: key) as Any
    }
    static func removeKeyUserDefault(key: String) {
        return userDef.removeObject(forKey: key)
    }
    
    static func isKeyPresentInUserDefaults(key: String) -> Bool {
        return userDef.object(forKey: key) != nil
    }
    
    static func saveObjectDefault(key: String, value: Any) {
        let userDataEncoded = NSKeyedArchiver.archivedData(withRootObject: value)
        userDef.set(userDataEncoded, forKey: key)
        userDef.synchronize()
    }
    
    static func getObjectDefault(key: String)->Any {
        
        if let decodedNSData = UserDefaults.standard.object(forKey: key) as? NSData,
            let Data = NSKeyedUnarchiver.unarchiveObject(with: decodedNSData as Data) {
            
            return Data
        } else {
            debugPrint("Failed")
            
            return ""
        }
    }
}
class  Helper  {
    
  
    static func hexStringToUIColor (hex: String) -> UIColor {
        var cString: String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        
        if ((cString.characters.count) != 6) {
            return UIColor.gray
        }
        
        var rgbValue: UInt32 = 0
        Scanner(string: cString).scanHexInt32(&rgbValue)
        
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    static func convertDateFormatter(date: String,formate:String = "dd MMM, yyyy",toFormate:String = "yyy-MM-dd") -> String
    {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = formate//this your string date format
        
        let date = dateFormatter.date(from: date)
        dateFormatter.dateFormat = toFormate///this is what you want to convert format
        let timeStamp = dateFormatter.string(from: date!)
        
        
        return timeStamp
    }
    
    static func nightsBetweenDates(startDate: Date, endDate: Date) -> Int {
        let calendar = Calendar.current
        let components = calendar.dateComponents([Calendar.Component.day], from: startDate, to: endDate)
        if let nigths = components.day {
            
            return nigths < 0 ? 0 : nigths
        }
        return 0
        
    }
    
    static func getHotelNamesAndIds(hotelArray:[JHotelDescriptiveContent]) ->([String]?,[Int]?)
    {
        var hotelsName:[String] = []
        var hotelsCode:[Int] = []
        
        for (_,item) in hotelArray.enumerated() {
            hotelsName.append(item.hotelName)
            hotelsCode.append(Int(item.hotelCode ?? "")!)
            
        }
        
        
        var cities = [String]()
        for hotel in hotelArray {
            if  hotel.contactInfos.contactInfo.addresses.address.cityName != nil &&
                !(cities.contains(hotel.contactInfos.contactInfo.addresses.address.cityName)){
                cities.append(hotel.contactInfos.contactInfo.addresses.address.cityName)
                hotelsName.append(hotel.contactInfos.contactInfo.addresses.address.cityName)
                hotelsCode.append(0)
                
            }
        }
        
        return (hotelsName,hotelsCode)
        
    }
    static func getCities() -> [String] {
        var cities = [String]()
        for hotel in JazHotels.hotels {
            if  hotel.contactInfos.contactInfo.addresses.address.cityName != nil &&
                !(cities .contains(hotel.contactInfos.contactInfo.addresses.address.cityName)){
                cities.append(hotel.contactInfos.contactInfo.addresses.address.cityName)
            }
        }
        return cities
    }

  static  func addLineToView(view : UIView, position : LINE_POSITION, color: UIColor, width: Double) {
        let lineView = UIView()
        lineView.backgroundColor = color
        lineView.translatesAutoresizingMaskIntoConstraints = false // This is important!
        view.addSubview(lineView)
        
        let metrics = ["width" : NSNumber(value: width)]
        let views = ["lineView" : lineView]
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[lineView]|", options:NSLayoutFormatOptions(rawValue: 0), metrics:metrics, views:views))
        
        switch position {
        case .LINE_POSITION_TOP:
            view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[lineView(width)]", options:NSLayoutFormatOptions(rawValue: 0), metrics:metrics, views:views))
            break
        case .LINE_POSITION_BOTTOM:
            view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[lineView(width)]|", options:NSLayoutFormatOptions(rawValue: 0), metrics:metrics, views:views))
            break
        default:
            break
        }
    }
}
