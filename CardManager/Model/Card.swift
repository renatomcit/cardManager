//
//  Card.swift
//  CardManager
//
//  Created by cit on 07/03/18.
//  Copyright © 2018 cit. All rights reserved.
//

import Foundation

struct Card: Codable {
    var cardNumber: Int
    var imageFlag: String
    var imageCard: String
    var colorCard: String
    var dueDate: Date
    var limitAvailable: Double
    var invoiceAmount: Double
    var extract: [Extract]
    
    enum CodingKeys: String, CodingKey {
        case cardNumber = "card_number"
        case imageFlag = "image_flag"
        case imageCard = "image_card"
        case colorCard = "color_card"
        case dueDate = "due_date"
        case limitAvailable = "limit_available"
        case invoiceAmount = "invoice_amount"
        case extract
    }
}
