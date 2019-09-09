//
//  dataModel.swift
//  JSON Task
//
//  Created by Ahmad Mustafa on 9/5/19.
//  Copyright © 2019 Ahmad Mustafa. All rights reserved.
//

import UIKit

class DataModel{
    private(set) public var id: String
    private(set) public var title: String
    
    init(id: String, title: String) {
        self.id = id
        self.title = title
    }
}
