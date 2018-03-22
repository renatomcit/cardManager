//
//  MenuView.swift
//  CardManager
//
//  Created by Iago Mordente Rezende Leão Corrêa on 20/03/18.
//  Copyright © 2018 cit. All rights reserved.
//

import Foundation
import UIKit

class MenuView: UIView {
    
    @IBOutlet weak var menuUserNameLabel: UILabel!
    @IBOutlet weak var menuCardsButton: UIButton!
    @IBOutlet weak var menuExtractButton: UIButton!
    @IBOutlet weak var menuBookButton: UIButton!
    @IBOutlet weak var menuAboutButton: UIButton!
    
    func setupLabel (_ user: User) {
        menuUserNameLabel.text = user.name
    }
    
    func setupButtons () {
        menuCardsButton.titleLabel?.textAlignment = NSTextAlignment.left
        menuExtractButton.titleLabel?.textAlignment = NSTextAlignment.left
        menuBookButton.titleLabel?.textAlignment = NSTextAlignment.left
        menuAboutButton.titleLabel?.textAlignment = NSTextAlignment.left
        
        menuCardsButton.backgroundColor = UIColor.orangish()
        menuExtractButton.backgroundColor = UIColor.orangish()
        menuBookButton.backgroundColor = UIColor.orangish()
        menuAboutButton.backgroundColor = UIColor.orangish()
    }
}
