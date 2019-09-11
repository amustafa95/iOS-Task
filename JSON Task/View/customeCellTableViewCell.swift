//
//  customeCellTableViewCell.swift
//  JSON Task
//
//  Created by Ahmad Mustafa on 9/5/19.
//  Copyright © 2019 Ahmad Mustafa. All rights reserved.
//

import UIKit

class customeCellTableViewCell: UITableViewCell {
    @IBOutlet weak var lblId: UILabel!
    
    // MARK: - Access Control the data
    func dataModel(forModel data: Post){
        lblId.text = "ID Number: \(data.id)"
    }
}
