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
        let storyboard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let loginViewController = storyboard.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        self.present(loginViewController, animated: true, completion: nil)
    }
    
    func cardDefault () -> Int {
        let defaults = UserDefaults.standard
        return defaults.integer(forKey: "cardDefault")
    }
    
}
