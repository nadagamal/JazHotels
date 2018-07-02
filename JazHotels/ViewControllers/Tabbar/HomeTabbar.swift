//
//  File.swift
//  JazHotels
//
//  Created by Zeinab Reda on 6/21/18.
//  Copyright © 2018 Jaz. All rights reserved.
//

import UIKit
import ESTabBarController_swift

class  HomeTabbar: ESTabBarController , UITabBarControllerDelegate {
    
    override func viewDidLoad() {
        
//        self.delegate = self
//        self.title = "Irregularity"
//        self.tabBar.shadowImage = UIImage(named: "transparent")
//        self.tabBar.backgroundImage = UIImage(named: "background_dark")
//        self.shouldHijackHandler = {
//            tabbarController, viewController, index in
//            if index == 2 {
//                return true
//            }
//            return false
//        }
       
        var tabFind = self.tabBar.items?[0] as? ESTabBarItem

        tabFind =  ESTabBarItem.init(ExampleIrregularityBasicContentView(), title: "Find", image: UIImage(named: "find"), selectedImage: UIImage(named: "find_1"))

        var tabHome =  self.tabBar.items?[1] as? ESTabBarItem
        tabHome = ESTabBarItem.init(ExampleIrregularityBasicContentView(), title: "Home", image: UIImage(named: "home"), selectedImage: UIImage(named: "home_1"))


        var tabCamera = self.tabBar.items?[2] as? ESTabBarItem

        tabCamera =  ESTabBarItem.init(ExampleIrregularityBasicContentView(), title: "Camera", image: UIImage(named: "photo_verybig"), selectedImage: UIImage(named: "photo_verybig_1"))


        var tabFavor = self.tabBar.items?[3] as? ESTabBarItem

        tabFavor =  ESTabBarItem.init(ExampleIrregularityBasicContentView(), title: "Fav", image: UIImage(named: "favor"), selectedImage: UIImage(named: "favor_1"))


        var tabME = self.tabBar.items?[4] as? ESTabBarItem

        tabME =  ESTabBarItem.init(ExampleIrregularityBasicContentView(), title: "ME", image: UIImage(named: "me"), selectedImage: UIImage(named: "me_1"))


        self.tabBar.items = [tabFind,tabHome,tabCamera,tabFavor,tabME] as? [UITabBarItem]

        
        
//        let v1 = HomeViewController()
//        let v2 = HomeViewController()
//        let v3 = HomeViewController()
//        let v4 = HomeViewController()
//        let v5 = HomeViewController()
//        
//        v1.tabBarItem = ESTabBarItem.init(ExampleIrregularityBasicContentView(), title: "Home", image: UIImage(named: "home"), selectedImage: UIImage(named: "home_1"))
//        v2.tabBarItem = ESTabBarItem.init(ExampleIrregularityBasicContentView(), title: "Find", image: UIImage(named: "find"), selectedImage: UIImage(named: "find_1"))
//        v3.tabBarItem = ESTabBarItem.init(ExampleIrregularityContentView(), title: nil, image: UIImage(named: "photo_verybig"), selectedImage: UIImage(named: "photo_verybig"))
//        v4.tabBarItem = ESTabBarItem.init(ExampleIrregularityBasicContentView(), title: "Favor", image: UIImage(named: "favor"), selectedImage: UIImage(named: "favor_1"))
//        v5.tabBarItem = ESTabBarItem.init(ExampleIrregularityBasicContentView(), title: "Me", image: UIImage(named: "me"), selectedImage: UIImage(named: "me_1"))
//        
//        self.viewControllers = [v1, v2, v3, v4, v5]
        
        
        
    }
}

