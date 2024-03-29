//
//  CustomeView.swift
//  JSON Task
//
//  Created by Ahmad Mustafa on 9/9/19.
//  Copyright © 2019 Ahmad Mustafa. All rights reserved.
//

import UIKit

protocol CustomeDeleagate: class{
    func changeView()
}
class CustomeView: UIView{
    var delegate: CustomeDeleagate?
    override func awakeFromNib() {
        changeView()
    }
    
    // MARK: - Change View
    @IBAction private func change(_ sender: AnyObject){
        delegate?.changeView()
    }
    func changeView(){
        layer.cornerRadius = 25
        layer.backgroundColor = #colorLiteral(red: 0.9532599507, green: 0.9532599507, blue: 0.9532599507, alpha: 1)
        layer.shadowColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        layer.shadowOpacity = 0.5
        layer.shadowOffset = CGSize(width: -1, height: 1)
        layer.masksToBounds = false
    }
}

class CustomeBTN: UIButton{
    var view: CustomeView?
    
    override func awakeFromNib() {
        view = CustomeView()
        view?.delegate = self as? CustomeDeleagate
        changeView()
    }
    
    func changeView(){
        layer.cornerRadius = 25
        layer.shadowColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        layer.shadowOpacity = 0.5
        layer.masksToBounds = false
    }
}
