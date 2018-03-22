//
//  UISideMenuNavigationController.swift
//  CardManager
//
//  Created by Iago Mordente Rezende Leão Corrêa on 20/03/18.
//  Copyright © 2018 cit. All rights reserved.
//

import Foundation
import SideMenu

class UISideMenuNavigationControler: UISideMenuNavigationController {
    public var user: User?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        SideMenuManager.default.menuPresentMode = .menuSlideIn
        SideMenuManager.default.menuWidth = max(round(min((UIScreen.main.bounds.width), (UIScreen.main.bounds.height)) * 0.80), 240)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let navigationController = segue.destination as? UINavigationController
        let menuViewController = navigationController?.viewControllers.first as! MenuViewController
        menuViewController.user = user
    }
}
