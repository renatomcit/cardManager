//
//  RegisterViewController.swift
//  CardManager
//
//  Created by cit on 06/03/18.
//  Copyright © 2018 cit. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var cellTextField: UITextField!
    @IBOutlet weak var cardTextField: UITextField!
    var manager = RegisterManager()
    @IBAction func requestRegistration(_ sender: Any) {
        let alert1: UIAlertController = UIAlertController(title: "Campos inválidos", message: "Verifique e tente novamente", preferredStyle: UIAlertControllerStyle.alert)
        alert1.addAction(UIAlertAction(title: "OK", style: .default, handler: { (handler) in
            self.nameTextField.becomeFirstResponder()
        }))
        let alert2: UIAlertController = UIAlertController(title: "", message: "", preferredStyle: UIAlertControllerStyle.alert)
        if let name = nameTextField.text,
            let email = emailTextField.text,
            let cell = cellTextField.text,
            let card = cardTextField.text  {
            
            manager.register(name: name, email: email, cell: cell, card: card, callBack: { (result) in
                if result {
                    alert2.title = "Registro feito com sucesso."
                    alert2.addAction(UIAlertAction(title: "OK", style: .default, handler: { (handler) in
//                        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
//                        let loginViewController = storyboard.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
//                        self.present(loginViewController, animated: true, completion: nil)
                        self.dismiss(animated: true, completion: {})
                    }))
                    self.present(alert2, animated: true, completion: nil)
                } else {
                    alert2.title = "Erro."
                    alert2.addAction(UIAlertAction(title: "OK", style: .default, handler: {(handler) in
                        self.nameTextField.becomeFirstResponder()
                    }))
                    self.present(alert2, animated: true, completion: nil)
                }
                
            })
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameTextField.delegate = self
        emailTextField.delegate = self
        cellTextField.delegate = self
        cardTextField.delegate = self
        
        
        // Do any additional setup after loading the view.
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let text = textField.text else { return true }
        let newLength = text.count + string.count - range.length
        
        if textField == emailTextField || textField == nameTextField {
            return newLength <= 100 // Bool
        }
            
        else if textField == cellTextField {
            mask(cellTextField: cellTextField)
            return newLength <= 15
        }
        
        return newLength <= 20
    }
    
    func mask(cellTextField: UITextField) {
        let parenthesis: String = "("
        if cellTextField.text?.count == 0 {
            cellTextField.text? = parenthesis
        } else if cellTextField.text?.count == 3 {
            cellTextField.text?.append(") ")
        } else if cellTextField.text?.count == 10 {
            cellTextField.text?.append("-")
        }
    }
}
