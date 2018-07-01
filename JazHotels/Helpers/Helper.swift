//
//  Helper.swift
//  JazHotels
//
//  Created by Nada Gamal Mohamed on 7/1/18.
//  Copyright © 2018 Jaz. All rights reserved.
//

import Foundation
import UIKit
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
