//
//  AlertView.swift
//  Predictions
//
//  Created by Nada Gamal Mohamed on 4/11/18.
//  Copyright © 2018 Sarmady. All rights reserved.
//

import Foundation
import SCLAlertView
import SIAlertView
extension SCLAlertView{
    
    class func showRetryCustomAlertWithMessage(message:String, completion: @escaping (Bool) -> ()){
        DispatchQueue.main.async {
            let alertView=SIAlertView(title: "", andMessage: message)
            // alertView?.backgroundColor = #colorLiteral(red: 0.1294117647, green: 0.1294117647, blue: 0.1450980392, alpha: 1)
            alertView?.viewBackgroundColor = #colorLiteral(red: 0.1294117647, green: 0.1294117647, blue: 0.1450980392, alpha: 1)
            alertView?.buttonFont = UIFont.cairoFontSemiBlodOfSize(size: 14)
            alertView?.buttonColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            alertView?.titleColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            alertView?.messageColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            alertView?.cornerRadius = 4
            alertView?.messageFont = UIFont.cairoFontSemiBlodOfSize(size: 16)

            alertView?.addButton(withTitle: "OK", type: .default, handler: { (alert) in
                completion(true)
            })
            alertView?.show()

        }
    }
    
    class func showCustomAlertWithMessage(message:String, completion: @escaping (Bool) -> ()){
        DispatchQueue.main.async {
            let alertView=SIAlertView(title: "", andMessage: message)
            // alertView?.backgroundColor = #colorLiteral(red: 0.1294117647, green: 0.1294117647, blue: 0.1450980392, alpha: 1)
            alertView?.viewBackgroundColor = #colorLiteral(red: 0.1294117647, green: 0.1294117647, blue: 0.1450980392, alpha: 1)
            alertView?.buttonFont = UIFont.cairoFontSemiBlodOfSize(size: 14)
            alertView?.buttonColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            alertView?.titleColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            alertView?.messageColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            alertView?.cornerRadius = 4.0;
            alertView?.messageFont = UIFont.cairoFontSemiBlodOfSize(size: 16)
            alertView?.addButton(withTitle: "Cancel", type: .default, handler: { (alert) in
                alertView?.dismiss(animated: true)
            })
            alertView?.show()

        }
    }
    
    class func showSuccessAlertWithMessage(message: String, completion: @escaping (Bool) -> ()) {
        DispatchQueue.main.async {
            let alertView=SIAlertView(title: "", andMessage: message)
            // alertView?.backgroundColor = #colorLiteral(red: 0.1294117647, green: 0.1294117647, blue: 0.1450980392, alpha: 1)
            alertView?.viewBackgroundColor = #colorLiteral(red: 0.1294117647, green: 0.1294117647, blue: 0.1450980392, alpha: 1)
            alertView?.buttonFont = UIFont.cairoFontSemiBlodOfSize(size: 14)
            alertView?.buttonColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            alertView?.titleColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            alertView?.messageColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            alertView?.cornerRadius = 4.0;
            alertView?.messageFont = UIFont.cairoFontSemiBlodOfSize(size: 16)

            alertView?.addButton(withTitle: "OK", type: .default, handler: { (alert) in
                alertView?.dismiss(animated: true)
            })
            alertView?.show()

    }
}
}
