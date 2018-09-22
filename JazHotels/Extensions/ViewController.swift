//
//  ViewController.swift
//  JazHotels
//
//  Created by Zeinab Reda on 7/13/18.
//  Copyright © 2018 Jaz. All rights reserved.
//

import UIKit

private let swizzling: (UIViewController.Type) -> Void =
{
    viewController in
    
    let originalSelector = #selector(viewController.proj_viewWillAppear(animated:))
    let swizzledSelector = #selector(viewController.proj_viewWillAppear(animated:))
    
    let originalMethod = class_getInstanceMethod(viewController, originalSelector)
    let swizzledMethod = class_getInstanceMethod(viewController, swizzledSelector)
    
    method_exchangeImplementations(originalMethod!, swizzledMethod!)
    
}

extension UIViewController
{
    
    func initialize() {
        // make sure this isn't a subclass
        guard self === UIViewController.self else { return }
//       swizzling(self)
    }
    // MARK: - Method Swizzling
    @objc func proj_viewWillAppear(animated: Bool)
    {
        self.navigationController?.navigationBar.setValue(true, forKey: "hidesShadow")

        proj_viewWillAppear(animated: animated)
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)



    }
    
    func hideKeyboard() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
  
}
