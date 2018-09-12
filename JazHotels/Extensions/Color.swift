//
//  Color.swift
//  JazHotels
//
//  Created by Zeinab Reda on 9/11/18.
//  Copyright © 2018 Jaz. All rights reserved.
//

import UIKit

extension UIColor {
   
    class func appColor() -> CAGradientLayer
    {
        var gl:CAGradientLayer!
        var colors = [UIColor]()
        colors.append(UIColor(red: 94/255, green: 14/255, blue: 139/255, alpha: 1))
        colors.append(UIColor(red: 126/255, green: 14/255, blue: 139/255, alpha: 1))
        colors.append(UIColor(red: 223/255, green: 27/255, blue: 142/255, alpha: 1))
        gl = CAGradientLayer()
        gl.colors = colors
        gl.locations = [0.0, 1.0]
        
        return gl
    }
    
  
}
