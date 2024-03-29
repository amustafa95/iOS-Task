//
//  UserByIdVC.swift
//  JSON Task
//
//  Created by Ahmad Mustafa on 9/4/19.
//  Copyright © 2019 Ahmad Mustafa. All rights reserved.
//

import UIKit

class UserByIdVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var users: [Post] = [] {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    var userBySectionNumber = [(key: Int, value: [Post])]()
    var userById = [(key: Int, value: [Post])]()
    
    var selectedTilteById: String?
    var selectedBodyById: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        
    }
    // MARK: - ConfigureView
    private func configureView() {
        tableView.delegate = self
        tableView.dataSource = self
        let url = "https://jsonplaceholder.typicode.com/posts"
        fetchUsers(using: url)
    }
    @IBAction func backToMain(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: "back", sender: nil)
    }
    
}

//MARK: Delegate & Data srouce
extension UserByIdVC: UITableViewDelegate,UITableViewDataSource {
    // MARK: Load data to the user
     func load(with users: [Post]) -> Void{
        userBySectionNumber = Dictionary(grouping: users, by: { user in
            user.userId}).sorted(by: { $0.0 < $1.0})
        print(userBySectionNumber)
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return userBySectionNumber.count
        }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userBySectionNumber[section].value.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Section Number \(userBySectionNumber[section].key)"
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "users",for: indexPath) as? customeCellTableViewCell{
            let user = userBySectionNumber[indexPath.section].value[indexPath.row]
            cell.dataModel(forModel: user)
         return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 99.95
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let path = tableView.indexPathForSelectedRow
        let cell = userBySectionNumber[indexPath.section].value[indexPath.row]
        tableView.reloadData()
        print(cell)
        printValue(with: cell)
        performSegue(withIdentifier: "viewAllDetails", sender: path)
    }
    
    // MARK: - Prepare for Segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let nextViewController = segue.destination as? UserVC {
            nextViewController.delegate = self
            nextViewController.userBody = selectedBodyById
            nextViewController.userTitle = selectedTilteById
        }
    }
    
    
    
    func printValue(with value: Post) -> Void{
        selectedTilteById = value.title
        selectedBodyById = value.body
    }
    

}
// MARK: APIS
extension UserByIdVC {
    func fetchUsers(using url: String){
        let url = URL(string: url)!
        let _ = URLSession.shared.dataTask(with: url){ (data,response,error)
            in
            guard let data = data else {return}
            do{
                let userFetch = try JSONDecoder().decode([Post].self, from: data)  // decode * ( Codable )
                self.users = userFetch
                self.load(with: userFetch)
            } catch{
                print("error loading data cause: \(error)")
                }
            }.resume()
    }
    
}

// MARK: - Change View Color
extension UserByIdVC: BackgroundDelegate{
    func changeBackgroundColor(withColor color: UIColor) {
        view.backgroundColor = color
    }
}
