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
  //  @IBOutlet weak var lblTitle: UILabel!
    
    // MARK: - Access Control the data
    func dataModel(forModel data: User){
        lblId.text = "ID Number: \(data.id)"
     //   lblTitle.text = data.title
    }
}
