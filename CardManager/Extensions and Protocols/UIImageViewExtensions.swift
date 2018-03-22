//
//  UIImageViewExtensions.swift
//  CardManager
//
//  Created by Iago Mordente Rezende Leão Corrêa on 20/03/18.
//  Copyright © 2018 cit. All rights reserved.
//

import Foundation
import UIKit

extension UIImageView {
    
    func roundImageView () {
        self.layer.borderWidth = 1
        self.layer.masksToBounds = false
        self.layer.borderColor = UIColor.black.cgColor
        self.layer.cornerRadius = self.frame.height/2
        self.clipsToBounds = true
    }
}
