//
//  MainTabBarController.swift
//  TabBarSolution
//
//  Created by Dejan Skledar on 03/07/2017.
//  Copyright © 2017 FERI. All rights reserved.
//

import UIKit

class MainTabBar: UITabBar {
    
    private var middleButton = UIButton()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupMiddleButton()
    }
    
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        if self.isHidden {
            return super.hitTest(point, with: event)
        }
        
        let from = point
        let to = middleButton.center
        
        return sqrt((from.x - to.x) * (from.x - to.x) + (from.y - to.y) * (from.y - to.y)) <= 39 ? middleButton : super.hitTest(point, with: event)
    }
    
    func setupMiddleButton() {
        middleButton.frame.size = CGSize(width: 100, height: 100)
        middleButton.backgroundColor = .blue
        middleButton.layer.cornerRadius = 50
        middleButton.layer.masksToBounds = true
        middleButton.center = CGPoint(x: UIScreen.main.bounds.width / 2, y:
            UIScreen.main.bounds.height - 40)
        middleButton.addTarget(self, action: #selector(checkAvaibilityAction), for: .touchUpInside)
        middleButton.setBackgroundImage(#imageLiteral(resourceName: "checkAvailableNavHCopy"), for:UIControlState.normal)
        addSubview(middleButton)
        
    }
    
    

    @objc func checkAvaibilityAction() {
        
        let tabBarController = self.window?.rootViewController as! UITabBarController
        tabBarController.selectedIndex = 2;
        
    }
}
