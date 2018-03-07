//
//  API.swift
//  CardManager
//
//  Created by cit on 06/03/18.
//  Copyright © 2018 cit. All rights reserved.
//

import Foundation
import Alamofire

class APILogin{
    func loginRequest (email: String, password: String) {
        let parameters: Parameters = [ "email": email, "password":  password ]
        Alamofire.request("http://cardmanagerserver.herokuapp.com/login", method: .post, parameters: parameters).responseJSON { (response) in
                let result = response
        }
    }
}

