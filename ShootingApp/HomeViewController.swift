//
//  HomeViewController.swift
//  ShootingApp
//
//  Created by Ivan Marosevic on 20/08/2019.
//  Copyright © 2019 Marosevic d.o.o. All rights reserved.
//

import UIKit
import Firebase

class HomeViewController: UIViewController {
    
    @IBOutlet weak var publishNewScore: UIButton!
    @IBOutlet weak var viewScoreboard: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.setHidesBackButton(true, animated:true);
     


        
    }
    
    @IBAction func lookTableTouched(_ sender: Any) {
        self.performSegue(withIdentifier: "homeToScoreboard", sender: self)
    }
    
    @IBAction func signOut(_ sender: Any) {
    
        
        do{
            try Auth.auth().signOut()
            self.performSegue(withIdentifier: "logoutSegue", sender: self)
        }catch{
            print("Error while signing out!")
        }

//        try! Auth.auth().signOut()
//        let alertController = UIAlertController(title: "Are you sure?", message: "Do you really want to sign out?", preferredStyle: .actionSheet)
//
//        let signOutAction = UIAlertAction(title: "Sign out", style: .destructive, handler: nil)
//        let defaultAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
//
//        alertController.addAction(defaultAction)
//        alertController.addAction(signOutAction)
//        self.present(alertController, animated: true, completion: nil)
//
//        let startController = StartViewController()
//
//        self.present(startController, animated: true, completion: nil)

      
        
    }

}
