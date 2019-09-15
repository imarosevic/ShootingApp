//
//  ScoreboardViewController.swift
//  ShootingApp
//
//  Created by Ivan Marosevic on 15/09/2019.
//  Copyright © 2019 Marosevic d.o.o. All rights reserved.
//

import UIKit
import Firebase

class ScoreboardViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    var value1: String = ""
    var value2: String = ""
    var value3: String = ""
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return resultsList.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ViewControllerTableViewCell
        let result: Result
        
        result = resultsList[indexPath.row]
        cell.emailLabel.text = result.name
        cell.sumResultLabel.text = result.sumResult
        cell.latLabel.text = result.lat
        cell.longLabel.text = result.long
        cell.imageUrlLabel.text = result.imageURL
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedCell = tableView.cellForRow(at: indexPath) as! ViewControllerTableViewCell
        value1 = selectedCell.imageUrlLabel.text!
        value2 = selectedCell.latLabel.text!
        value3 = selectedCell.longLabel.text!
        self.performSegue(withIdentifier: "infoView", sender: nil)

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let info = segue.destination as! InfoViewController
        info.myString1 = value1
        info.myString2 = value2
        info.myString3 = value3
        
    }
    

    
    
    var ref:DatabaseReference?
    @IBOutlet weak var tableResults: UITableView!
    
    var resultsList = [Result]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ref = Database.database().reference().child("results")

        ref?.observe(DataEventType.value, with: {(snapshot) in
            
            if snapshot.childrenCount > 0 {
                self.resultsList.removeAll()
                
                for results in snapshot.children.allObjects as![DataSnapshot]{
                    let resultObject = results.value as? [String : AnyObject]
                    let resultID = resultObject?["id"]
                    let resultName = resultObject?["name"]
                    let resultURL = resultObject?["photoURL"]
                    let resultSum = resultObject?["sum"]
                    let resultLong = resultObject?["long"]
                    let resultLat = resultObject?["lat"]
                    
                  
                    
                    let result = Result(id: resultID as! String?,
                                        name: resultName as! String?,
                                        imageURL: resultURL as! String?,
                                        sumResult: resultSum as! String?,
                                        long: resultLong as! String?,
                                        lat: resultLat as! String?)
                    
                    self.resultsList.append(result)
                }
                
                self.tableResults.reloadData()
            }
            
        })
    }
    


}
