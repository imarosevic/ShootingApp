//
//  NewScoreController.swift
//  ShootingApp
//
//  Created by Ivan Marosevic on 10/09/2019.
//  Copyright © 2019 Marosevic d.o.o. All rights reserved.
//

import UIKit
import FirebaseDatabase
import Firebase

class NewScoreController: UIViewController {

    @IBOutlet weak var round1: UITextField!
    @IBOutlet weak var round2: UITextField!
    @IBOutlet weak var round3: UITextField!
    @IBOutlet weak var add: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let ref: DatabaseReference
        ref = Database.database().reference()
        
    }

     @IBAction func addTouched(_ sender: Any) {
        let userid = Auth.auth().currentUser
        self.ref.child("users").child(userid).setValue(["username": round1.text])
    

    }
}
