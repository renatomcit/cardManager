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
    func loginRequest (email: String, password: String, callBack: @escaping(User)-> Void) {
        
        let parameters: Parameters = [ "email": email, "password":  password ]
        Alamofire.request("http://cardmanagerserver.herokuapp.com/login", method: .post, parameters: parameters, encoding: JSONEncoding.default).responseJSON { (response) in
            
            if let dataParse = response.data {
                guard let userParse = try? JSONDecoder().decode(Response.self, from: dataParse) else{return}
                let user = User(name: userParse.user.name, imageProfile: userParse.user.imageProfile, cards: userParse.cards)
                callBack(user)
            }
        }
    }
}

