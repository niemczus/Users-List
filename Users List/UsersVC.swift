//
//  UsersVC.swift
//  Users List
//
//  Created by Kamil Niemczyk on 10/02/2022.
//

import UIKit

class UsersVC: UITableViewController {
    
    let temporaryUsers = ["Jannie", "Jessica", "Kyle", "Kam", "Steven"]
    var users = [User]()

    override func viewDidLoad() {
        super.viewDidLoad()
        getUsers()
    }
    
    func getUsers() {
        
        guard let url = URL(string: "https:jsonplaceholder.typicode.com/users") else { return }
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: url) { data, response, error in
            if let httpResponse = response as? HTTPURLResponse {
                print(httpResponse.statusCode)
            }
            if let error = error {
                print(error)
            } else if let data = data {
//                print(data)
                
//                let dataString = String(data: data, encoding: .utf8)
//                print(dataString ?? "no data")
                
                do {
                    guard let json = try JSONSerialization.jsonObject(with: data, options: []) as? [[String : Any]] else { return }
                    
                   
        
                    for userDictionary in json {
                        
                        guard
                            let name = userDictionary["name"] as? String,
                            let address = userDictionary["address"] as? [String : Any],
                            let city = address["city"] as? String
//                            let geo = address["geo"] as? [String : Any],
//                            let lat = geo["lat"] as? String,
//                            let lng = geo["lng"]
                        else { return }
                        
                        let user = User(name: name, city: city)
                        self.users.append(user)
                        
                        DispatchQueue.main.async {
                            self.tableView.reloadData()
                        }
                    }
                    
                } catch let err {
                    print(err)
                }
            }
        }
        
        dataTask.resume()
                      
        
    }
    
    
    
    
    
    

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: nil)
        let user = users[indexPath.row]
//        Old way...
//        cell.textLabel?.text = user.name
//        cell.detailTextLabel?.text = user.city
        
        var content = cell.defaultContentConfiguration()
        content.text = user.name
        content.secondaryText = user.city
        content.image = UIImage.init(systemName: "\(indexPath.row + 1).circle")
        cell.contentConfiguration = content
        
        return cell
    }
    
    
    
    
    

}
