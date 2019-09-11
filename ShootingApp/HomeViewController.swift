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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    
    @IBAction func signOutTouched(_ sender: Any) {

        try! Auth.auth().signOut()
        let alertController = UIAlertController(title: "Are you sure?", message: "Do you really want to sign out?", preferredStyle: .actionSheet)
        
        let signOutAction = UIAlertAction(title: "Sign out", style: .destructive, handler: nil)
        let defaultAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            
        alertController.addAction(defaultAction)
        alertController.addAction(signOutAction)
        self.present(alertController, animated: true, completion: nil)
        
        let startController = StartViewController()
            
        self.present(startController, animated: true, completion: nil)

      
        
    }
    
    

}
