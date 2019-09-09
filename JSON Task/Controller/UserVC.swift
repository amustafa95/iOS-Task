//
//  UserVC.swift
//  JSON Task
//
//  Created by Ahmad Mustafa on 9/7/19.
//  Copyright © 2019 Ahmad Mustafa. All rights reserved.
//

import UIKit

class UserVC: UIViewController {

    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblBody: UILabel!
    
    var userTitle: String?
    var userBody: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblTitle.text = userTitle
        lblBody.text = userBody
        
    }
    
//    func dataModel(with data: User){
//        lblTitle.text = data.title
//        lblBody.text = data.body
//    }
}
