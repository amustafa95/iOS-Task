//
//  UserByIdCell.swift
//  JSON Task
//
//  Created by Ahmad Mustafa on 9/8/19.
//  Copyright © 2019 Ahmad Mustafa. All rights reserved.
//

import UIKit

class UserByIdCell: UITableViewCell {

    @IBOutlet weak var lblUser: UILabel!
    @IBOutlet weak var lblId: UILabel!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblBody: UILabel!
    
    // MARK: - Access Control the data
    func dataModel(forModel data: Post){
        lblUser.text = "Section Number: \(data.userId)"
    }
    
    // MARK: - Display all section attributes
    func displayAllSection(for data: Post){
        lblId.text = "ID: \(data.id)"
        lblTitle.text = data.title
        lblBody.text = data.title
    }
}
