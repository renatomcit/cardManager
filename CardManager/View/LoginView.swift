//
//  LoginView.swift
//  CardManager
//
//  Created by cit on 05/03/18.
//  Copyright © 2018 cit. All rights reserved.
//

import UIKit

class LoginView: UIView {
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func awakeFromNib() {
        emailTextField.changePlaceHolderColor(forText: "E-MAIL", withColor:UIColor.white)
        passwordTextField.changePlaceHolderColor(forText: "SENHA", withColor:UIColor.white)
//        emailTextField.underline(UIColor.Colors.white)
//        passwordTextField.underline(UIColor.Colors.white)
        emailTextField.setBottomBorder(UIColor.Colors.white)
        passwordTextField.setBottomBorder(UIColor.Colors.white)
        passwordTextField.accessibilityLabel = "Achou que não ia ter acessibilidade? Achou errado otário!"
        
    }
    
    
    
    
}
