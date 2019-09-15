//
//  InfoViewController.swift
//  ShootingApp
//
//  Created by Ivan Marosevic on 15/09/2019.
//  Copyright © 2019 Marosevic d.o.o. All rights reserved.
//

import UIKit

class InfoViewController: UIViewController {

    @IBOutlet weak var infoUrlLabel: UILabel!
    @IBOutlet weak var infoLatLabel: UILabel!
    @IBOutlet weak var infoLongLabel: UILabel!
    
    var myString1: String = ""
    var myString2: String = ""
    var myString3: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        infoUrlLabel.text = myString1
        infoLatLabel.text = myString2
        infoLongLabel.text = myString3
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
