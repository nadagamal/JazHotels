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
    
  
}
