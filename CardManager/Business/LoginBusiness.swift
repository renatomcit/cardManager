//
//  File.swift
//  CardManager
//
//  Created by cit on 06/03/18.
//  Copyright © 2018 cit. All rights reserved.
//

import Foundation

class LoginBusiness {
    private var apiLogin = API()
    func loginManager(email: String, password: String, callBack: @escaping(User)-> Void){

        apiLogin.loginRequest(email: email, password: password, callBack: {(user) in
            callBack(user)
            
        })
        

    }
}
