//
//  Helper.swift
//  JazHotels
//
//  Created by Nada Gamal Mohamed on 7/1/18.
//  Copyright © 2018 Jaz. All rights reserved.
//

import Foundation
import UIKit
import ESTabBarController_swift

public struct JazHotels {
    static var hotels: JHotelDescriptiveContent!

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
    
    static func customIrregularityStyle(delegate: UITabBarControllerDelegate?) -> UINavigationController {
        let tabBarController = ESTabBarController()
//        tabBarController.delegate = self
        tabBarController.title = "Irregularity"
        tabBarController.tabBar.shadowImage = UIImage(named: "transparent")
        tabBarController.tabBar.backgroundImage = UIImage(named: "background_dark")
        tabBarController.shouldHijackHandler = {
            tabbarController, viewController, index in
            if index == 2 {
                return true
            }
            return false
        }
        tabBarController.didHijackHandler = {
            [weak tabBarController] tabbarController, viewController, index in
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                let alertController = UIAlertController.init(title: nil, message: nil, preferredStyle: .actionSheet)
                let takePhotoAction = UIAlertAction(title: "Take a photo", style: .default, handler: nil)
                alertController.addAction(takePhotoAction)
                let selectFromAlbumAction = UIAlertAction(title: "Select from album", style: .default, handler: nil)
                alertController.addAction(selectFromAlbumAction)
                let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
                alertController.addAction(cancelAction)
                tabBarController?.present(alertController, animated: true, completion: nil)
            }
        }
        
        let v1 = HomeViewController()
        let v2 = HomeViewController()
        let v3 = HomeViewController()
        let v4 = HomeViewController()
        let v5 = HomeViewController()
        
        v1.tabBarItem = ESTabBarItem.init(ExampleIrregularityBasicContentView(), title: "Home", image: UIImage(named: "home"), selectedImage: UIImage(named: "home_1"))
        v2.tabBarItem = ESTabBarItem.init(ExampleIrregularityBasicContentView(), title: "Find", image: UIImage(named: "find"), selectedImage: UIImage(named: "find_1"))
        v3.tabBarItem = ESTabBarItem.init(ExampleIrregularityContentView(), title: nil, image: UIImage(named: "photo_verybig"), selectedImage: UIImage(named: "photo_verybig"))
        v4.tabBarItem = ESTabBarItem.init(ExampleIrregularityBasicContentView(), title: "Favor", image: UIImage(named: "favor"), selectedImage: UIImage(named: "favor_1"))
        v5.tabBarItem = ESTabBarItem.init(ExampleIrregularityBasicContentView(), title: "Me", image: UIImage(named: "me"), selectedImage: UIImage(named: "me_1"))
        
        tabBarController.viewControllers = [v1, v2, v3, v4, v5]
        
        let navigationController = UINavigationController(rootViewController: tabBarController)
        tabBarController.title = "Example"
        return navigationController
    }
}
