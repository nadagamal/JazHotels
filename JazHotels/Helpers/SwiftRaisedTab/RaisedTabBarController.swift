//
//  RaisedTabBarController.swift
//  SwiftRaisedTabDemo
//
//  Created by Kaynine on 9/23/2015.
//  Copyright (c) 2015 Kaynine. All rights reserved.
//

import UIKit

open class RaisedTabBarController: UITabBarController {
    
    override open func viewDidLoad() {
        super.viewDidLoad()
      //  self.insertEmptyTabItem("", atIndex: 2)
        let img = #imageLiteral(resourceName: "checkAvailableNav")
        self.addRaisedButton(img, highlightImage: #imageLiteral(resourceName: "checkAvailableNavHCopy"), offset: -5.0)
    }
    
    open func addRaisedButton(_ buttonImage: UIImage?, highlightImage: UIImage?, offset:CGFloat? = nil) {
        if let buttonImage = buttonImage {
            let button = UIButton(type: UIButtonType.custom)
            button.autoresizingMask = [UIViewAutoresizing.flexibleRightMargin, UIViewAutoresizing.flexibleLeftMargin, UIViewAutoresizing.flexibleBottomMargin, UIViewAutoresizing.flexibleTopMargin]
            
            button.frame = CGRect(x: 0.0, y: 0.0, width: buttonImage.size.width, height: buttonImage.size.height)
            button.setBackgroundImage(buttonImage, for: UIControlState())
            button.setBackgroundImage(highlightImage, for: UIControlState.selected)

            let heightDifference = buttonImage.size.height - self.tabBar.frame.size.height
            
            if (heightDifference < 0) {
                button.center = self.tabBar.center
            }
            else {
                var center = self.tabBar.center
                center.y -= heightDifference / 2.0
                
                button.center = center
            }
            
            if offset != nil
            {
                //Add offset
                var center = button.center
                center.y = center.y + offset!
                button.center = center
            }
            
            button.addTarget(self, action: #selector(RaisedTabBarController.onRaisedButton(_:)), for: UIControlEvents.touchUpInside)
            self.view.addSubview(button)
        }
    }
    
    @objc open func onRaisedButton(_ sender: UIButton!) {
        DispatchQueue.main.async {
            sender.setBackgroundImage(#imageLiteral(resourceName: "checkAvailableNavHCopy"), for: .normal)
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            let tabBarController = appDelegate.window?.rootViewController as! UITabBarController
            tabBarController.selectedIndex = 2;
        }

    }
    open override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        if self.view.subviews.last is UIButton{
            var button = self.view.subviews.last as! UIButton
            button.setBackgroundImage(#imageLiteral(resourceName: "checkAvailableNav"), for: .normal)

        }
    }
}
