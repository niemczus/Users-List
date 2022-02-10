//
//  UsersVC.swift
//  Users List
//
//  Created by Kamil Niemczyk on 10/02/2022.
//

import UIKit

class UsersVC: UITableViewController {
    
    let temporaryUsers = ["Jannie", "Jessica", "Kyle", "Kam", "Steven"]

    override func viewDidLoad() {
        super.viewDidLoad()
        getUsers()
    }
    
    func getUsers() {
        // https://jsonplaceholder.typicode.com
        
        guard let url = URL(string: "https:jsonplaceholder.typicode.com/users") else { return }
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: url) { data, response, error in
            if let httpResponse = response as? HTTPURLResponse {
                print(httpResponse.statusCode)
            }
            if let error = error {
                print(error)
            } else if let data = data {
                print(data)
                
//                let dataString = String(data: data, encoding: .utf8)
//                print(dataString ?? "no data")
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: [])
                    print(json)
                    
                } catch let err {
                    print(err)
                }
                
                
            }
        }
        
        dataTask.resume()
                      
        
    }
    
    
    
    
    
    

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return temporaryUsers.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell()
        let user = temporaryUsers[indexPath.row]
       
        var content = cell.defaultContentConfiguration()
        content.text = user
        cell.contentConfiguration = content
        
        return cell
    }
    
    
    
    
    

}
