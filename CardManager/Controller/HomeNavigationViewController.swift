//
//  HomeNavigationViewController.swift
//  CardManager
//
//  Created by Iago Mordente Rezende Leão Corrêa on 20/03/18.
//  Copyright © 2018 cit. All rights reserved.
//

import UIKit

class HomeNavigationViewController: UINavigationController {
    
    var user: User?
    
    override func viewDidLoad() {
        let storyboard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let homeViewController = storyboard.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
        homeViewController.user = user
        super.viewDidLoad()
        self.pushViewController(homeViewController, animated: true)
    }
    
}
