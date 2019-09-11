//
//  Model.swift
//  JSON Task
//
//  Created by Ahmad Mustafa on 9/4/19.
//  Copyright © 2019 Ahmad Mustafa. All rights reserved.
//

import Foundation

struct Post: Codable {
    var userId: Int
    var id: Int
    var title: String
    var body: String
}
