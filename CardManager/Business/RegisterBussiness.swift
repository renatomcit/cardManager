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
    
    func registerBusiness(name: String, email: String, cell: String, card: String,  callBack: @escaping(Bool)-> Void){
        let removal: [Character] = ["(", ")", "-"]
        let filteredCell = cell.filter { !removal.contains($0) }
        
        apiRegister.registerRequest(name: name, email: email, cell: filteredCell, cardNumber: card,  callBack: {(user) in
            callBack(user)
            
        })
        
        
    }
}
