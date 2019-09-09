//
//  Model.swift
//  JSON Task
//
//  Created by Ahmad Mustafa on 9/4/19.
//  Copyright © 2019 Ahmad Mustafa. All rights reserved.
//

import Foundation

struct User: Codable {
    var userId: Int
    var id: Int
    var title: String
    var body: String
//
//    enum codingKeys: String, CodingKey {
//        case userID = "userId" //userId
//    }
}
