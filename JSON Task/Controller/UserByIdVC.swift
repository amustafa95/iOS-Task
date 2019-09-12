//
//  UserByIdVC.swift
//  JSON Task
//
//  Created by Ahmad Mustafa on 9/4/19.
//  Copyright © 2019 Ahmad Mustafa. All rights reserved.
//

import UIKit

class UserByIdVC: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    var userBySectionNumber = [(key: Int, value: [Post])]()
    var userById = [(key: Int, value: [Post])]()
    var userCollection: [Post] = [] {
        didSet{
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
    
    var selectedTilteById: String?
    var selectedBodyById: String?
    var switchBTN = true
    var sizeWidth,sizeHeight: CGFloat?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        collectionView.reloadData()
    }
    
    // MARK: - ConfigureView
    private func configureView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        sizeWidth = collectionView.frame.width
        sizeHeight = collectionView.frame.height/4
        let url = "https://jsonplaceholder.typicode.com/posts"
        fetchUsers(using: url)
    }
    @IBAction func backToMain(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: "back", sender: nil)
    }
    
    // MARK: - Switch Button
    @IBAction func switchBTN(_ sender: UIBarButtonItem) {
        switchBTN = !switchBTN
        collectionView.reloadData()
        if switchBTN == false{
            sizeWidth = (collectionView.frame.width - 15)/2
            sizeHeight = (collectionView.frame.width - 15)/2
        }else{
            sizeWidth = collectionView.frame.width
            sizeHeight = collectionView.frame.height/4
        }
    }
}

//MARK: Delegate & Data srouce for CollectionView
extension UserByIdVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return userCollection.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "fetchUserId", for: indexPath) as? CustomeCollectionCell{
            let user = userCollection[indexPath.row]
            print(user)
            cell.configure(with: user)
            return cell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let path = collectionView.indexPathsForSelectedItems
        let cell = userCollection[indexPath.row]
        configureValues(with: cell)
        performSegue(withIdentifier: "viewAllDetails", sender: path)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: sizeWidth!, height: sizeHeight!)
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
                self.userCollection = userFetch
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
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

// MARK: - Configure and Prepare for Segue
extension UserByIdVC{
    // MARK: - Prepare for Segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let nextViewController = segue.destination as? UserVC {
            nextViewController.delegate = self
            nextViewController.userBody = selectedBodyById
            nextViewController.userTitle = selectedTilteById
        }
    }
    
    // MARK: - Configure Values
    func configureValues(with value: Post) -> Void{
        selectedTilteById = value.title
        selectedBodyById = value.body
    }
}
