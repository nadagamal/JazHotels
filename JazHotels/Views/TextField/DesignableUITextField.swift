//
//  DesignableUITextField.swift
//  AlgazeeraPaint
//
//  Created by Zeinab Reda on 3/27/17.
//  Copyright © 2017 Zeinab Reda. All rights reserved.
//

import UIKit

@IBDesignable

class DesignableUITextField: UITextField {

    private var kAssociationKeyMaxLength: Int = 0

    
    // Provides left padding for images
    override func leftViewRect(forBounds bounds: CGRect) -> CGRect {
        var textRect = super.leftViewRect(forBounds: bounds)
        textRect.origin.x += leftPadding

        return textRect
    }

    @IBInspectable var leftImage: UIImage? {
        didSet {
            width = (leftImage?.size.width)!
            height =  (leftImage?.size.height)!
            updateView()

        }
    }

    @IBInspectable var rightImage: UIImage? {
        didSet {
            width = (rightImage?.size.width)!
            height =  (rightImage?.size.height)!
            updateView()

        }
    }

    @IBInspectable var leftPadding: CGFloat = 0
    @IBInspectable var paddingRight: CGFloat = 0
    @IBInspectable var leftPlaceholdlerPadding: CGFloat = 0
    @IBInspectable var rightPlaceholdlerPadding: CGFloat = 0

    @IBInspectable var leftTextPadding: CGFloat = 0
    @IBInspectable var rightTextPadding: CGFloat = 0

    @IBInspectable var width: CGFloat = 0
    @IBInspectable var height: CGFloat = 0

    override func textRect(forBounds bounds: CGRect) -> CGRect {
        let padding = UIEdgeInsets(top: 0, left: self.leftTextPadding, bottom: 0, right: self.rightTextPadding)

        return UIEdgeInsetsInsetRect(bounds, padding)
    }

    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        let padding = UIEdgeInsets(top: 0, left: leftPlaceholdlerPadding, bottom: 0, right: rightPlaceholdlerPadding)

        return UIEdgeInsetsInsetRect(bounds, padding)
    }

    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        let padding = UIEdgeInsets(top: 0, left: self.leftTextPadding, bottom: 0, right: self.rightTextPadding)

        return UIEdgeInsetsInsetRect(bounds, padding)
    }

    @IBInspectable var maxLength: Int {
        get {
            if let length = objc_getAssociatedObject(self, &kAssociationKeyMaxLength) as? Int {
                return length
            } else {
                return Int.max
            }
        }
        set {
            objc_setAssociatedObject(self, &kAssociationKeyMaxLength, newValue, .OBJC_ASSOCIATION_RETAIN)
            addTarget(self, action: #selector(checkMaxLength), for: .editingChanged)
            checkMaxLength()
        }
    }

    @objc func checkMaxLength() {
        if let textCurrent = self.text, textCurrent.characters.count > maxLength {
            let cursorPosition = selectedTextRange
            let index = textCurrent.index(textCurrent.startIndex, offsetBy: 1)
            self.text = textCurrent.substring(to: index)
            selectedTextRange = cursorPosition
        }
    }

    @IBInspectable var color: UIColor = UIColor.lightGray {
        didSet {
            updateView()
        }
    }

    func updateView() {
        if let image = leftImage {
            leftViewMode = UITextFieldViewMode.always

            let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: width, height: height))
            imageView.image = image

            imageView.tintColor = color
            leftView = imageView
        } else {
            leftViewMode = UITextFieldViewMode.never
            leftView = nil
        }

        if let image = rightImage {
            rightViewMode = UITextFieldViewMode.always

            let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: width, height: height))
            imageView.image = image

            imageView.tintColor = color
            rightView = imageView
        } else {
            rightViewMode = UITextFieldViewMode.never
            rightView = nil
        }

        // Placeholder text color
        attributedPlaceholder = NSAttributedString(string: placeholder != nil ?  placeholder! : "", attributes: [kCTForegroundColorAttributeName as NSAttributedStringKey: color])
    }

    var topBorder: UIView?
    var bottomBorder: UIView?
    var leftBorder: UIView?
    var rightBorder: UIView?

    @IBInspectable var borderColor: UIColor = UIColor.clear {
        didSet {
            layer.borderColor = borderColor.cgColor
        }
    }

    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }

    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRadius
        }
    }

    @IBInspectable var placeHolderColor: UIColor = UIColor.lightGray {
        didSet {
            setValue(placeHolderColor, forKeyPath: "_placeholderLabel.textColor")
        }
    }

    @IBInspectable var bottomLineWidth: CGFloat = 1 {
        didSet {
            let border: CALayer = CALayer()
            border.borderColor = UIColor.darkGray.cgColor
            self.frame = CGRect(x: 0, y: self.frame.size.height - bottomLineWidth, width: self.frame.size.width, height: self.frame.size.height)

            border.borderWidth = borderWidth
            self.layer.addSublayer(border)
            self.layer.masksToBounds = true
        }
    }

    @IBInspectable var bottomLineColor: UIColor = UIColor.lightGray {
        didSet {
            let border: CALayer = CALayer()
            border.borderColor = bottomLineColor.cgColor
        }
    }

//    override func editingRect(forBounds bounds: CGRect) -> CGRect {
//        return textRect(forBounds: bounds)
//    }
    @IBInspectable var topBorderColor: UIColor = UIColor.clear
    @IBInspectable var topBorderHeight: CGFloat = 0 {
        didSet {
            if topBorder == nil {
                topBorder = UIView()
                topBorder?.backgroundColor = topBorderColor
                topBorder?.frame = CGRect(x: 0, y: 0, width: self.frame.size.width, height: topBorderHeight)
                addSubview(topBorder!)
            }
        }
    }
    @IBInspectable var bottomBorderColor: UIColor = UIColor.clear
    @IBInspectable var bottomBorderHeight: CGFloat = 0 {
        didSet {
            if bottomBorder == nil {
                bottomBorder = UIView()
                bottomBorder?.backgroundColor=bottomBorderColor
                bottomBorder?.frame = CGRect(x: 0, y: self.frame.size.height - bottomBorderHeight, width: self.frame.size.width, height: bottomBorderHeight)
                addSubview(bottomBorder!)
            }
        }
    }
    @IBInspectable var leftBorderColor: UIColor = UIColor.clear
    @IBInspectable var leftBorderHeight: CGFloat = 0 {
        didSet {
            if leftBorder == nil {
                leftBorder = UIView()
                leftBorder?.backgroundColor=leftBorderColor
                leftBorder?.frame = CGRect(x: 0, y: 0, width: leftBorderHeight, height: self.frame.size.height)
                addSubview(leftBorder!)
            }
        }
    }
    @IBInspectable var rightBorderColor: UIColor = UIColor.clear
    @IBInspectable var rightBorderHeight: CGFloat = 0 {
        didSet {
            if rightBorder == nil {
                rightBorder = UIView()
                rightBorder?.backgroundColor=topBorderColor
                rightBorder?.frame = CGRect(x: self.frame.size.width - rightBorderHeight, y: 0, width: rightBorderHeight, height: self.frame.size.height)
                addSubview(rightBorder!)
            }
        }
    }
    func useUnderline() {
        self.borderStyle = UITextBorderStyle.none
        let border = CALayer()
        let borderWidth = CGFloat(1.0)
        border.borderColor = UIColor.lightGray.cgColor
        border.frame = CGRect(origin: CGPoint(x: 0, y: self.frame.size.height - 0.5), size: CGSize(width: self.frame.size.width, height: self.frame.size.height))
        border.borderWidth = borderWidth
        self.layer.addSublayer(border)
        self.layer.masksToBounds = true
    }
}
