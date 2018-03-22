//
//  AboutView.swift
//  CardManager
//
//  Created by Iago Mordente Rezende Leão Corrêa on 22/03/18.
//  Copyright © 2018 cit. All rights reserved.
//

import Foundation
import UIKit

class AboutView: UIView {
    @IBOutlet weak var aboutNavigationBar: UINavigationBar!
    
    func setupNavigationBar () {
        aboutNavigationBar.barTintColor = UIColor.orangish()
        aboutNavigationBar.backgroundColor = UIColor.orangish()
    }
}
