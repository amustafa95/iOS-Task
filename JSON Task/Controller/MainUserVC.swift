//
//  MainUserVC.swift
//  JSON Task
//
//  Created by Ahmad Mustafa on 9/8/19.
//  Copyright © 2019 Ahmad Mustafa. All rights reserved.
//

import UIKit

class MainUserVC: UIViewController {
    @IBOutlet weak var sectionTableView: UITableView!
    
    var users: [User] = [] {
        didSet {
            DispatchQueue.main.async {
                self.sectionTableView.reloadData()
            }
        }
    }
    var userBySectionNumber = [(key: Int, value: [User])]()
    var userById = [User]()
    var user = [User]()
    var selectedTilteById: [String?] = []
    var selectedBodyById: [String?] = []
    var indexSections: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }
    
    // MARK: - ConfigureView
    private func configureView() {
        sectionTableView.delegate = self
        sectionTableView.dataSource = self
        let url = "https://jsonplaceholder.typicode.com/posts"
        fetchUsers(using: url)
    }
    
    @IBAction func backToMain(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: "back", sender: nil)
    }
}

//MARK: Delegate & Data srouce
extension MainUserVC: UITableViewDelegate,UITableViewDataSource {
    
    //        private func numberOfUsers(in users: [User]) -> Int {
    //            userById = Dictionary(grouping: users, by: {users in users.self})
    //            return 1
    //        }
    // MARK: Load data to the user
    func load(with users: [User]){
        DispatchQueue.main.async {
            self.userBySectionNumber = Dictionary(grouping: users, by: { user in
                user.userId }).sorted(by: { $0.0 < $1.0})
            self.sectionTableView.reloadData()
        }
    }
    
//    func numberOfSections(in tableView: UITableView) -> Int {
//        // proccessing .
//        print(userBySectionNumber)
//        return userBySectionNumber.count
//
//    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(userBySectionNumber.count)
        return userBySectionNumber.count
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "sectionUser",for: indexPath) as? UserByIdCell{
            let cellUser = userBySectionNumber[indexPath.row].value[indexPath.section]
            cell.dataModel(forModel: cellUser)
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 99.95
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        user = userBySectionNumber[indexPath.section].value
        indexSections = indexPath.section
        tableView.reloadData()
        performSegue(withIdentifier: "viewAllDetail", sender: nil)
    }
    
    
    
    // MARK: - Prepare for Segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let nextViewController = segue.destination as? UserSectionsVC {
            nextViewController.indexSection = indexSections
            nextViewController.users =  user
            nextViewController.navigationItem.title = "Section Number"
        }
    }
}
// MARK: APIS
extension MainUserVC {
    func fetchUsers(using url: String){
        let url = URL(string: url)!
        let _ = URLSession.shared.dataTask(with: url){ (data,response,error)
            in
            guard let data = data else {return}
            do{
                let userFetch = try JSONDecoder().decode([User].self, from: data)  // decode * ( Codable )
                self.users = userFetch
                self.load(with: userFetch)
                self.user = userFetch
            } catch{
                print("error loading data cause: \(error)")
            }
            }.resume()
    }
}
