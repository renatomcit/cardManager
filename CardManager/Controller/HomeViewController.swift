//
//  HomeViewController.swift
//  CardManager
//
//  Created by cit on 07/03/18.
//  Copyright © 2018 cit. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    var user: User?
    
    @IBOutlet var homeView: HomeView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let safeUser = user{
            homeView.setup( user: safeUser, cardNumber: 0 )
        }
    }
    
    func cardDefault () -> Int {
        let defaults = UserDefaults.standard
        return defaults.integer(forKey: "cardDefault")
    }
    
}
