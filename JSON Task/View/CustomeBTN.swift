//
//  CustomeBTN.swift
//  JSON Task
//
//  Created by Ahmad Mustafa on 9/9/19.
//  Copyright © 2019 Ahmad Mustafa. All rights reserved.
//

import UIKit

@IBDesignable
class CustomeBTN: UIButton{

override func prepareForInterfaceBuilder() {
    changeView()
}

override func awakeFromNib() {
    changeView()
}

// MARK: - Change View
func changeView(){
    layer.cornerRadius = 25
    layer.shadowColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
    layer.shadowOpacity = 0.5
    layer.masksToBounds = false
    }
}
