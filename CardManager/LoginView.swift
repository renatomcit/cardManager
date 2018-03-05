//
//  LoginView.swift
//  CardManager
//
//  Created by cit on 05/03/18.
//  Copyright © 2018 cit. All rights reserved.
//

import UIKit

extension UITextField {
    func setBottomBorder() {
//        self.borderStyle = .
//        //self.layer.backgroundColor = UIColor.white.cgColor
//
//        self.layer.masksToBounds = false
//        self.layer.shadowColor = UIColor.gray.cgColor
//        self.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
//        self.layer.shadowOpacity = 1.0
//        self.layer.shadowRadius = 0.0
        let border = CALayer()
        let width = CGFloat(1.0)
        border.borderColor = UIColor.white.cgColor
        border.frame = CGRect(x: 0, y: self.frame.size.height - width, width: self.frame.size.width, height: self.frame.size.height)
        self.layer.addSublayer(border)
        self.layer.masksToBounds = true
    }
    
    func changePlaceHolderColor (_ placeholderText: String){
        self.attributedPlaceholder = NSAttributedString(string: placeholderText, attributes:[NSAttributedStringKey.foregroundColor: UIColor.white])
    }
}

class LoginView: UIView {
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func awakeFromNib() {
        emailTextField.setBottomBorder()
        emailTextField.changePlaceHolderColor("E-MAIL")
        passwordTextField.changePlaceHolderColor("SENHA")
    }
    
    
    
    
}
