//
//  User.swift
//  CardManager
//
//  Created by cit on 07/03/18.
//  Copyright © 2018 cit. All rights reserved.
//

import Foundation

struct User: Codable {
    var name: String
    var imageProfile: String
    var cards: [Card]
    
    enum CodingKeys: String, CodingKey {
        case name
        case imageProfile = "image_profile"
        case cards
    }
}
