//
//  File.swift
//  CardManager
//
//  Created by cit on 06/03/18.
//  Copyright © 2018 cit. All rights reserved.
//

import Foundation

class LoginBusiness {
    private var apiLogin = APILogin()
    func loginManager(email: String, password: String){
        apiLogin.loginRequest(email: email, password: password)
    }
}
