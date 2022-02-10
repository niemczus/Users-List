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
        print("ohai")
        
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
