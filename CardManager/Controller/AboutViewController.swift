//
//  AboutViewController.swift
//  CardManager
//
//  Created by Iago Mordente Rezende Leão Corrêa on 21/03/18.
//  Copyright © 2018 cit. All rights reserved.
//

import UIKit

class AboutViewController: UIViewController {

    @IBOutlet var aboutView: AboutView!
    override func viewDidLoad() {
        super.viewDidLoad()
        aboutView.setupNavigationBar()
    }

}
