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
    @IBOutlet weak var registerLoading: UIActivityIndicatorView!
    var manager = RegisterManager()
    @IBAction func requestRegistration(_ sender: Any) {
        registerLoading.startAnimating()
        let alert1: UIAlertController = UIAlertController(title: "Campos inválidos", message: "Verifique e tente novamente", preferredStyle: UIAlertControllerStyle.alert)
        alert1.addAction(UIAlertAction(title: "OK", style: .default, handler: { (handler) in
            self.nameTextField.becomeFirstResponder()
        }))
        let alert2: UIAlertController = UIAlertController(title: "", message: "", preferredStyle: UIAlertControllerStyle.alert)
        if let name = nameTextField.text,
            let email = emailTextField.text,
            let cell = cellTextField.text,
            let card = cardTextField.text  {
            
            manager.registerBusiness.result = manager.register(name: name, email: email, cell: cell, card: card, callBack: { (result) in
                if result {
                    alert2.title = "Registro feito com sucesso."
                    alert2.addAction(UIAlertAction(title: "OK", style: .default, handler: { (handler) in
                        self.navigationController?.isNavigationBarHidden = true
                        self.navigationController?.popViewController(animated: true)
                        self.registerLoading.stopAnimating()
                    }))
                    self.present(alert2, animated: true, completion: nil)
                } else {
                    alert2.title = "Erro."
                    alert2.addAction(UIAlertAction(title: "OK", style: .default, handler: {(handler) in
                        self.nameTextField.becomeFirstResponder()
                        self.registerLoading.stopAnimating()
                    }))
                    self.present(alert2, animated: true, completion: nil)
                }
                
            })
        }
        if manager.registerBusiness.result.0 == RegisterBusiness.Validation.nameEmpty {
            alert1.title = "Nome vazio."
            alert1.message = manager.registerBusiness.result.1.rawValue
            self.present(alert2, animated: true, completion: nil)
            self.nameTextField.becomeFirstResponder()
        } else if manager.registerBusiness.result.0 == RegisterBusiness.Validation.nameInvalid {
            alert1.title = "Nome inválido."
            alert1.message = manager.registerBusiness.result.1.rawValue
            self.present(alert2, animated: true, completion: nil)
            self.nameTextField.becomeFirstResponder()
        } else if manager.registerBusiness.result.0 == RegisterBusiness.Validation.emailInvalid {
            alert1.title = "Email inválido."
            alert1.message = manager.registerBusiness.result.1.rawValue
            self.present(alert2, animated: true, completion: nil)
            self.emailTextField.becomeFirstResponder()
        } else if manager.registerBusiness.result.0 == RegisterBusiness.Validation.emailEmpty {
            alert1.title = "Email vazio."
            alert1.message = manager.registerBusiness.result.1.rawValue
            self.present(alert2, animated: true, completion: nil)
            self.emailTextField.becomeFirstResponder()
        } else if manager.registerBusiness.result.0 == RegisterBusiness.Validation.cellEmpty {
            alert1.title = "Número de celular vazio."
            alert1.message = manager.registerBusiness.result.1.rawValue
            self.present(alert2, animated: true, completion: nil)
            self.cellTextField.becomeFirstResponder()
        } else if manager.registerBusiness.result.0 == RegisterBusiness.Validation.cellInvalid {
            alert1.title = "Número de celular inválido."
            alert1.message = manager.registerBusiness.result.1.rawValue
            self.present(alert2, animated: true, completion: nil)
            self.cellTextField.becomeFirstResponder()
        } else if manager.registerBusiness.result.0 == RegisterBusiness.Validation.cardEmpty {
            alert1.title = "Número do cartão vazio."
            alert1.message = manager.registerBusiness.result.1.rawValue
            self.present(alert2, animated: true, completion: nil)
            self.cellTextField.becomeFirstResponder()
        } else if manager.registerBusiness.result.0 == RegisterBusiness.Validation.cardInvalid {
            alert1.title = "Número do cartão inválido."
            alert1.message = manager.registerBusiness.result.1.rawValue
            self.present(alert2, animated: true, completion: nil)
            self.cellTextField.becomeFirstResponder()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameTextField.delegate = self
        emailTextField.delegate = self
        cellTextField.delegate = self
        cardTextField.delegate = self
        registerLoading.hidesWhenStopped = true
        self.navigationController?.isNavigationBarHidden = false
        self.navigationItem.hidesBackButton = true
        let newBackButton = UIBarButtonItem(title: "<Back", style: UIBarButtonItemStyle.plain, target: self, action: #selector(RegisterViewController.back(sender:)))
        self.navigationItem.leftBarButtonItem = newBackButton
    }
    
    @objc func back (sender: UIBarButtonItem) {
        self.navigationController?.isNavigationBarHidden = true;
        _ = navigationController?.popViewController(animated: true)
    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let text = textField.text else { return true }
        let newLength = text.count + string.count - range.length
        
        if textField == emailTextField || textField == nameTextField {
            return newLength <= 100 // Bool
        } else if textField == cellTextField {
            mask(cellTextField: cellTextField, replacementString: string)
            return newLength <= 15
        }
        
        return newLength <= 20
    }
    
    func mask(cellTextField: UITextField, replacementString: String) {
        let parenthesis: String = "("
        if cellTextField.text?.count == 0 {
            cellTextField.text? = parenthesis
        } else if cellTextField.text?.count == 2 && replacementString.count == 0 {
            cellTextField.text? = ""
        } else if cellTextField.text?.count == 3 && replacementString.count != 0 {
            cellTextField.text?.append(") ")
        } else if cellTextField.text?.count == 5 && replacementString.count == 0 {
            guard let index = cellTextField.text?.endIndex else { return }
            let range = (cellTextField.text?.index(index, offsetBy: -2))!..<index
            cellTextField.text?.removeSubrange(range)
        } else if cellTextField.text?.count == 10 && replacementString.count != 0 {
            cellTextField.text?.append("-")
        } else if cellTextField.text?.count == 11 && replacementString.count == 0 {
            guard let index = cellTextField.text?.endIndex else { return }
            let range = (cellTextField.text?.index(index, offsetBy: -1))!..<index
            cellTextField.text?.removeSubrange(range)
        }
    }
}
