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
        middleButton.layer.cornerRadius = 15
        middleButton.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        middleButton.setBackgroundImage(UIImage(named: "checkAvailable-icon"), for:UIControlState.normal)
        middleButton.layer.masksToBounds = true
        middleButton.center = CGPoint(x: UIScreen.main.bounds.width / 2, y: 15)
        middleButton.addTarget(self, action: #selector(checkAvaibilityAction), for: .touchUpInside)
        addSubview(middleButton)
    }
    
    

    @objc func checkAvaibilityAction() {
        
        let tabBarController = self.window?.rootViewController as! UITabBarController
        tabBarController.selectedIndex = 2;
        
    }
}
