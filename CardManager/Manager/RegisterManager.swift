//
//  RegisterManager.swift
//  CardManager
//
//  Created by cit on 08/03/18.
//  Copyright © 2018 cit. All rights reserved.
//

import Foundation

class RegisterManager: OperationQueue {
    private var registerBusiness = RegisterBusiness()
    
    func register(name: String, email: String, cell: String, card: String,  callBack: @escaping(Bool)-> Void) {
        registerBusiness.registerBusiness(name: name, email: email, cell: cell, card: card, callBack: {(user) in callBack(user)})
    }
}
