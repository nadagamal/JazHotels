//
//  UINavigationController+GradientColor.swift
//  JazHotels
//
//  Created by Zeinab Reda on 7/13/18.
//  Copyright © 2018 Jaz. All rights reserved.
//

import UIKit

extension UINavigationBar {
    
    func setGradientBackground() {
        
        var updatedFrame = bounds
        updatedFrame.size.height += self.frame.origin.y
        var colors = [UIColor]()
        colors.append(UIColor(red: 94/255, green: 14/255, blue: 139/255, alpha: 1))
        colors.append(UIColor(red: 126/255, green: 14/255, blue: 139/255, alpha: 1))
        colors.append(UIColor(red: 223/255, green: 27/255, blue: 142/255, alpha: 1))

        let gradientLayer = CAGradientLayer(frame: updatedFrame, colors: colors)
        
        setBackgroundImage(gradientLayer.createGradientImage(), for: UIBarMetrics.default)
    }
   
}
