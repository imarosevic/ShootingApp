//
//  StartViewController.swift
//  ShootingApp
//
//  Created by Ivan Marosevic on 20/08/2019.
//  Copyright © 2019 Marosevic d.o.o. All rights reserved.
//

import UIKit

class StartViewController: UIViewController {

    // MARK: - Outlets

    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated:true);
    }
    
    // MARK: - Actions
    
    @IBAction func signUpTouched(_ sender: Any) {
    }
    
    
    @IBAction func loginTouched(_ sender: Any) {
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
