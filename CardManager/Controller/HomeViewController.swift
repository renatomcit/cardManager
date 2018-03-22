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
    
    @IBAction func homeMenuButton(_ sender: Any) {
        let storyboard: UIStoryboard = UIStoryboard (name: "Main", bundle: nil)
        let menuViewController = storyboard.instantiateViewController(withIdentifier: "SideMenuNavigationController") as! UISideMenuNavigationControler
        menuViewController.user = user
        self.present(menuViewController, animated: true)
        
    }
    
    
    func cardDefault () -> Int {
        let defaults = UserDefaults.standard
        return defaults.integer(forKey: "cardDefault")
    }
    
}
