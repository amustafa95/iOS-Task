//
//  UserSectionsVC.swift
//  JSON Task
//
//  Created by Ahmad Mustafa on 9/8/19.
//  Copyright © 2019 Ahmad Mustafa. All rights reserved.
//

import UIKit

class UserSectionsVC: UIViewController {

    @IBOutlet weak var userTableView: UITableView!
    
    var indexSection: Int?
    var users: [User] = [] 
    override func viewDidLoad() {
        super.viewDidLoad()
        userTableView.delegate = self
        userTableView.dataSource = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        userTableView.reloadData()
    }
}

extension UserSectionsVC: UITableViewDelegate, UITableViewDataSource{

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "sectionSelected",for: indexPath) as? UserByIdCell{
            let user = users[indexPath.row]
            cell.displayAllSection(for: user)
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 99.95
    }
    
    
}
