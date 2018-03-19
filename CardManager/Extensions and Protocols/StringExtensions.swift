//
//  StringExtensions.swift
//  CardManager
//
//  Created by Iago Mordente Rezende Leão Corrêa on 19/03/18.
//  Copyright © 2018 cit. All rights reserved.
//

import Foundation

extension String {
    
    func isValidEmail() -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: self)
    }
}
