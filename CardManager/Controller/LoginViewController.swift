//
//  ViewController.swift
//  CardManager
//
//  Created by cit on 05/03/18.
//  Copyright © 2018 cit. All rights reserved.
//

import UIKit
import Foundation
import Alamofire

class LoginViewController: UIViewController, UITextFieldDelegate {
    var user: User?
    var loginManager = LoginManager()
    
    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var loginBackground: UIImageView!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView! {
        didSet{
            loadingIndicator.hidesWhenStopped = true
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emailTextfield.delegate = self
        passwordTextField.delegate = self
        self.navigationController?.isNavigationBarHidden = true
    }
    
    @IBAction func botaoEntrar(_ sender: Any) {
        let alert: UIAlertController = UIAlertController(title: "Campos inválidos", message: "Verifique e tente novamente", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (handler) in
            self.emailTextfield.becomeFirstResponder()
        }))
        if let email = emailTextfield.text,
            let password = passwordTextField.text{
            if !email.isValidEmail() {
                self.present(alert, animated: true, completion: nil)
            }
            else if !NetworkReachabilityManager()!.isReachable {
                alert.title = "Não há conexão com a internet"
                alert.message = "Por favor tente mais tarde."
                self.present(alert, animated: true, completion: nil)
            } else {
                loadingIndicator.isHidden = false
                loadingIndicator.startAnimating()
                loginManager.login(email: email, password: password, callBack: {(user) in
                    self.user = user
                    self.loadingIndicator.stopAnimating()
                    let storyboard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                    let homeViewController = storyboard.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
                    homeViewController.user = user
                    self.present(homeViewController, animated: true, completion: nil)
                })
            }
        }
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let text = textField.text else { return true }
        let newLength = text.count + string.count - range.length
        
        if textField == emailTextfield {
            return newLength <= 100 // Bool
        }
        
        return newLength <= 6
    }
    
    func isValidEmail(testStr:String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: testStr)
    }
    
}

