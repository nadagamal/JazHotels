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
    static var hotelsURLs: Dictionary<String,String>?
    static var hotelsName: [String]?
    static var hotelsCode: [Int]?


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
        return UIFont(name: "Cairo-ExtraLight", size: size)!
    }
    
    class func cairoFontLightOfSize(size: CGFloat) -> UIFont {
        return UIFont(name: "Cairo-Light", size: size)!
    }
    
    class func cairoFontRegularOfSize(size: CGFloat) -> UIFont {
        return UIFont(name: "Cairo-Regular", size: size)!
    }
    
    class func cairoFontSemiBlodOfSize(size: CGFloat) -> UIFont {
        return UIFont(name: "Cairo-SemiBold", size: size)!
    }
    
    class func cairoFontBlodOfSize(size: CGFloat) -> UIFont {
        return UIFont(name: "Cairo-Bold", size: size)!
    }
    
    class func cairoFontSemiBlackOfSize(size: CGFloat) -> UIFont {
        return UIFont(name: "Cairo-Black", size: size)!
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
        
        return (hotelsName,hotelsCode)
        
    }
  
}
