//
//  Response.swift
//  CardManager
//
//  Created by cit on 07/03/18.
//  Copyright © 2018 cit. All rights reserved.
//

import Foundation

struct Response: Codable {
    var user: UserParse
    var cards: [Card]
}
