//
//  LoginManager.swift
//  CardManager
//
//  Created by cit on 06/03/18.
//  Copyright © 2018 cit. All rights reserved.
//

import UIKit

class LoginManager: OperationQueue {
    private var loginBusiness = LoginBusiness()
    
    func login(email: String, password: String) {
        loginBusiness.loginManager(email: email, password: password)
    }
}
