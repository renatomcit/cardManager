//
//  ViewController.swift
//  CardManager
//
//  Created by cit on 05/03/18.
//  Copyright © 2018 cit. All rights reserved.
//

import UIKit
import Foundation

class LoginViewController: UIViewController, UITextFieldDelegate {
    
    
    
    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var loginBackground: UIImageView!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBAction func botaoEntrar(_ sender: Any) {
        let alert: UIAlertController = UIAlertController(title: "Campos inválidos", message: "Verifique e tente novamente", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (handler) in
            self.emailTextfield.becomeFirstResponder()
        }))
        if let text = emailTextfield.text {
            if !isValidEmail(testStr: text) {
                self.present(alert, animated: true, completion: nil)
            }
            else {
                loadingIndicator.isHidden = false
                loadingIndicator.startAnimating()
            }
        }
    }
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emailTextfield.delegate = self
        passwordTextField.delegate = self
        loadingIndicator.isHidden = true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let text = textField.text else { return true }
        let newLength = text.count + string.count - range.length
        
        if textField == emailTextfield {
            return newLength <= 100 // Bool
        }
        
        return newLength <= 6
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func isValidEmail(testStr:String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: testStr)
    }
}

