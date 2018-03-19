//
//  RegisterBussiness.swift
//  CardManager
//
//  Created by cit on 08/03/18.
//  Copyright © 2018 cit. All rights reserved.
//

import Foundation

class RegisterBusiness {
    private var apiRegister = API()
    typealias ValidationResults = (Validation, ValidationMessage)
    public var result: ValidationResults
    
    init() {
       result = ValidationResults(Validation.defaults, ValidationMessage.defaults)
    }
    
    enum Validation {
        case valid
        case nameInvalid
        case nameEmpty
        case emailInvalid
        case emailEmpty
        case cellInvalid
        case cellEmpty
        case cardInvalid
        case cardEmpty
        case defaults
    }
    
    enum ValidationMessage: String {
        case valid = "Validação feita com sucesso."
        case nameInvalid = "Nome inválido."
        case nameEmpty = "Preencha o nome."
        case emailInvalid = "Preencha corretamente o email."
        case emailEmpty = "Preencha o campo de email."
        case cellInvalid = "Preencha corretamente o número do cartão."
        case cellEmpty = "Preencha o número do cartão."
        case cardInvalid = "Preencha corretamente o númmero do cartão"
        case cardEmpty = "Preencha o número do cartão"
        case defaults = ""
    }
    
    func registerBusiness(name: String, email: String, cell: String, card: String,  callBack: @escaping(Bool)-> Void) -> ValidationResults {
        let removal: [Character] = ["(", ")", "-", " "]
        let filteredCell = cell.filter { !removal.contains($0) }
        var result: ValidationResults
        
        if !validateName(name) {
            if name.isEmpty {
                result = (Validation.nameEmpty, ValidationMessage.nameEmpty)
            } else {
                result = (Validation.nameInvalid, ValidationMessage.nameInvalid)
            }
        } else if !validateCell(cell) {
            if cell.isEmpty {
                result = (Validation.cellEmpty, ValidationMessage.cellEmpty)
            } else {
                result = (Validation.cellInvalid, ValidationMessage.cellInvalid)
            }
        } else if !email.isValidEmail() {
            if email.isEmpty {
                result = (Validation.emailEmpty, ValidationMessage.emailEmpty)
            } else {
                result = (Validation.emailInvalid, ValidationMessage.emailInvalid)
            }
        } else if !validateCard(card) {
            if card.isEmpty {
                result = (Validation.cardEmpty, ValidationMessage.cardEmpty)
            } else {
                result = (Validation.cardInvalid, ValidationMessage.cardInvalid)
            }
        } else {
            result = (Validation.valid, ValidationMessage.valid)
            apiRegister.registerRequest(name: name, email: email, cell: filteredCell, cardNumber: card,  callBack: {(user) in
                callBack(user)
            })
        }
        return result
    }
    
    func validateName ( _ name: String ) -> Bool{
        var result: Bool = false
        let names = name.split(separator: " ")
        if name.count >= 7 && names[0].count > 3 && names[1].count > 3 {
            result = true
        }
        return result
    }
    
    func validateCell ( _ cell: String ) -> Bool {
        let digits: Set<Character> = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "0"]
        return cell.count == 11 && Set(cell).isSubset(of: digits)
    }
    
    func validateCard (_ card: String ) -> Bool {
        return card.isEmpty
    }
    
}
