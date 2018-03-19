//
//  HomeView.swift
//  CardManager
//
//  Created by cit on 07/03/18.
//  Copyright © 2018 cit. All rights reserved.
//

import Foundation
import UIKit

class HomeView: UIView {
    let defaultCard = 1
    
    @IBOutlet weak var dueDate: UILabel!
    @IBOutlet weak var limitAvailable: UILabel!
    @IBOutlet weak var invoiceAmount: UILabel!
    @IBOutlet weak var imagesCard: UIImageView!
    
    func setup ( user: User, cardNumber: Int) {
        dueDate.text = user.cards[cardNumber].dueDate
        limitAvailable.text = user.cards[cardNumber].limitAvailable
        invoiceAmount.text = user.cards[cardNumber].invoiceAmount
        switch user.cards[cardNumber].colorCard {
        case "red":
            imagesCard.image = UIImage.init(named: "vermelho")
        case "green":
            imagesCard.image = UIImage.init(named: "verde")
        case "purple":
            imagesCard.image = UIImage.init(named: "roxo")
        default:
            imagesCard.image = UIImage.init(named: "vermelho")
        }
        
    }
//    enum setCard {
//        case purple
//        case green
//        case red
//    }
    
    
    override func awakeFromNib() {
        
    }
}
