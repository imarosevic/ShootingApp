//
//  ScoreboardController.swift
//  ShootingApp
//
//  Created by Ivan Marosevic on 10/09/2019.
//  Copyright © 2019 Marosevic d.o.o. All rights reserved.
//

import UIKit
import Firebase

struct result {
    let sum: String!
    let long: String!
    
}

class ScoreboardController: UITableViewController {
    
    var results = [result]()
    


    override func viewDidLoad() {
        super.viewDidLoad()
        
        let databaseRef = Database.database().reference()
        
        databaseRef.child("leaderboards").queryOrderedByKey().observe(.value, with: {
            snapshot in
            
            let value = snapshot.value as! [String:AnyObject]
            let sum = value["sum"] as! String
            let long = value["long"] as! String
            
            self.results.insert(result(sum: sum, long: long), at: 0)
            self.tableView.reloadData()
        })
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return results.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        let label1 = cell?.viewWithTag(1) as! UILabel
        label1.text = results[indexPath.row].sum
        let label2 = cell?.viewWithTag(2) as! UILabel
        label2.text = results[indexPath.row].long
        return cell!
    }
}
