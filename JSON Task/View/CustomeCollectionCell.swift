//
//  CustomeCollectionCell.swift
//  JSON Task
//
//  Created by Ahmad Mustafa on 9/12/19.
//  Copyright © 2019 Ahmad Mustafa. All rights reserved.
//

import UIKit

class CustomeCollectionCell: UICollectionViewCell {
    @IBOutlet weak var lblID: UILabel!
//    @IBOutlet weak var lblUser: UILabel!
    
    // MARK: - Configure Cellection Cell
    func configure(with data: Post){
//        lblUser.text = "Section Number \(data.userId)"
        lblID.text = "ID Number \(data.id)"
    }
}
