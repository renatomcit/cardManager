//
//  API.swift
//  CardManager
//
//  Created by cit on 06/03/18.
//  Copyright © 2018 cit. All rights reserved.
//

import Foundation
import Alamofire

class API{
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
    
    func registerRequest(name: String, email: String, cell: String, cardNumber: String, callBack: @escaping(Bool)-> Void){
        let parameters: Parameters = [ "name": name, "email":  email, "phone_number": cell, "card_number": cardNumber ]
        Alamofire.request("http://cardmanagerserver.herokuapp.com/signup", method: .post, parameters: parameters, encoding: JSONEncoding.default).responseJSON
            { (response) in
                let result = response.result.value as! Dictionary<String,String>
                callBack(result["result"] == "success")
            }
        
    }
}


