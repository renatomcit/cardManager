//
//  RegisterView.swift
//  CardManager
//
//  Created by cit on 06/03/18.
//  Copyright © 2018 cit. All rights reserved.
//

import UIKit

class RegisterView: UIView {
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var celularTextField: UITextField!
    
    @IBOutlet weak var cartaoTextField: UITextField!
    
    override func awakeFromNib() {
        //        nameTextField.underline(UIColor.Colors.greyishBrown)
        //        emailTextField.underline(UIColor.Colors.greyishBrown)
        //        celularTextField.underline(UIColor.Colors.greyishBrown)
        //        cartaoTextField.underline(UIColor.Colors.greyishBrown)
        nameTextField.setBottomBorder(UIColor.Colors.greyishBrown)
        emailTextField.setBottomBorder(UIColor.Colors.greyishBrown)
        celularTextField.setBottomBorder(UIColor.Colors.greyishBrown)
        cartaoTextField.setBottomBorder(UIColor.Colors.greyishBrown)
        nameTextField.changePlaceHolderColor(forText: "NOME", withColor: UIColor.black)
        emailTextField.changePlaceHolderColor(forText: "E-MAIL", withColor: UIColor.black)
        celularTextField.changePlaceHolderColor(forText: "NÚMERO DO TELEFONE", withColor: UIColor.black)
        cartaoTextField.changePlaceHolderColor(forText: "NÚMERO DO CARTÃO", withColor: UIColor.black)
        
    }
    
}
