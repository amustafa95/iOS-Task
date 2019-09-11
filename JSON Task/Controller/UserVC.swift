//
//  UserVC.swift
//  JSON Task
//
//  Created by Ahmad Mustafa on 9/7/19.
//  Copyright © 2019 Ahmad Mustafa. All rights reserved.
//

import UIKit
protocol BackgroundDelegate {
    func changeBackgroundColor(withColor color: UIColor)
}


class UserVC: UIViewController {

    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblBody: UILabel!
    
    var delegate: BackgroundDelegate?
    var userTitle: String?
    var userBody: String?
    var randomColor: UIColor?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblTitle.text = userTitle
        lblBody.text = userBody
        randomColor = UIColor.red
    }
    
    @IBAction func randomColorBTN(_ sender: UIButton){
        delegate?.changeBackgroundColor(withColor: .red)
        navigationController?.popToRootViewController(animated: true)
    }
}
