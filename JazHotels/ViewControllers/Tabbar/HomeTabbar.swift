//
//  File.swift
//  JazHotels
//
//  Created by Zeinab Reda on 6/21/18.
//  Copyright © 2018 Jaz. All rights reserved.
//

import UIKit

class  HomeTabbar: ESTabBarController , UITabBarControllerDelegate {
    
    override func viewDidLoad() {
        
        self.delegate = self
        self.title = "Irregularity"
        self.tabBar.shadowImage = UIImage(named: "transparent")
        self.tabBar.backgroundImage = UIImage(named: "background_dark")
        self.shouldHijackHandler = {
            tabbarController, viewController, index in
            if index == 2 {
                return true
            }
            return false
        }
       
        var tabHome =  self.tabBar.items?[0] as? ESTabBarItem
        tabHome = ESTabBarItem.init(ExampleIrregularityBasicContentView(), title: "Home", image: UIImage(named: "home"), selectedImage: UIImage(named: "home_1"))
        
        var tabFind = self.tabBar.items?[1] as? ESTabBarItem
            
           tabFind =  ESTabBarItem.init(ExampleIrregularityBasicContentView(), title: "Find", image: UIImage(named: "find"), selectedImage: UIImage(named: "find_1"))
        
        
       
        
        self.tabBar.items = [tabHome,tabFind] as? [UITabBarItem]
    }
}

