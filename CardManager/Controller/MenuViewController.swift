//
//  MenuViewController.swift
//  CardManager
//
//  Created by Iago Mordente Rezende Leão Corrêa on 20/03/18.
//  Copyright © 2018 cit. All rights reserved.
//

import Foundation
import UIKit

class MenuViewController: UIViewController {
    @IBOutlet var menuView: MenuView!
    public var user: User?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        if let safeUser = user {
            menuView.setupLabel(safeUser)
        }
        menuView.setupButtons()
        
    }
}

