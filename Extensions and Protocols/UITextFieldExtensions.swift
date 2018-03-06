//
//  UITextFieldExtensions.swift
//  CardManager
//
//  Created by cit on 06/03/18.
//  Copyright © 2018 cit. All rights reserved.
//

import Foundation
import UIKit

extension UITextField {
    
    func changePlaceHolderColor (forText placeholderText: String, withColor color: UIColor){
        self.attributedPlaceholder = NSAttributedString(string: placeholderText, attributes:[NSAttributedStringKey.foregroundColor: color])
    }
    
    func underline (_ color: UIColor.Colors){
        let border = CALayer()
        let width = CGFloat(1.0)
        border.borderColor = UIColor().getColor(color: color).cgColor
        border.frame = CGRect(x: 0, y: self.frame.size.height - width, width:  self.frame.size.width+1, height: self.frame.size.height+1)
        border.borderWidth = width
        self.layer.addSublayer(border)
        self.layer.masksToBounds = true
    }
    
    func setBottomBorder(_ color: UIColor.Colors)
    {
        self.borderStyle = UITextBorderStyle.none
        self.backgroundColor = UIColor.clear
        let width = 1.0
        
        let borderLine = UIView()
        borderLine.frame = CGRect(x: 0, y: Double(self.frame.height) - width, width: Double(self.frame.width), height: width)
            borderLine.backgroundColor = UIColor().getColor(color: color)
        self.addSubview(borderLine)
    }
}

extension UIColor {
    enum Colors {
        case greyishBrown
        case white
        case defaultColor
    }
    
    func getColor(color: Colors) -> UIColor {
        let resultColor: UIColor
        switch color {
        case .greyishBrown:
            resultColor = UIColor(displayP3Red: 74/255, green: 74/255, blue: 74/255, alpha: CGFloat(1.0))
        case .white:
            resultColor = UIColor.white
        default:
            resultColor = UIColor.black
        }
        return resultColor
    }
    
}
