//
//  GradientNavigationBar.swift
//  Pods
//
//  Created by Bell App Lab on 11/08/2016.
//
//

import UIKit

/**
 
 */
public class GradientNavigationBar: UINavigationBar
{
    //MARK: Consts
    public static var defaultOpacity: Float = 0.5
    
    //MARK: Gradient
    public private(set) weak var gradientLayer: CAGradientLayer?
    
    @objc public dynamic var colors: [UIColor]? {
        didSet {
            guard let colors = self.colors else { self.gradientLayer?.removeFromSuperlayer(); return }
            
            let layer = CAGradientLayer()
            layer.opacity = self.isTranslucent ? GradientNavigationBar.defaultOpacity : 1.0
            self.layer.insertSublayer(layer, at: 1)
            self.gradientLayer = layer
            
            var cgColors = [CGColor]()
            for color in colors {
                cgColors.append(color.cgColor)
            }
            layer.colors = cgColors
            
            if let locations = self.locations {
                layer.locations = locations as [NSNumber]
            }
            
            layer.startPoint = startPoint
            layer.endPoint = endPoint
        }
    }
    
    @objc public dynamic var locations: [Float]? {
        didSet {
            guard let layer = self.gradientLayer, let locations = self.locations else {
                self.gradientLayer?.locations = nil
                return
            }
            layer.locations = locations as [NSNumber]
        }
    }
    
    @objc public dynamic var startPoint = CGPoint.zero {
        didSet {
            guard let layer = self.gradientLayer else { return }
            layer.startPoint = self.startPoint
        }
    }
    
    @objc public dynamic var endPoint = CGPoint.zero {
        didSet {
            guard let layer = self.gradientLayer else { return }
            layer.endPoint = self.endPoint
        }
    }
    
    //MARK: View Life Cycle
    public override func layoutSubviews() {
        super.layoutSubviews()
        
        guard let layer = self.gradientLayer else { return }
        
        let statusBarHeight = UIApplication.shared.statusBarFrame.size.height
        layer.frame = CGRect(x: 0, y: 0 - statusBarHeight, width: self.bounds.width, height: self.bounds.height + statusBarHeight)
    }
}
