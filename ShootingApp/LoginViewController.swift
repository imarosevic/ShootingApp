//
//  LoginViewController.swift
//  ShootingApp
//
//  Created by Ivan Marosevic on 20/08/2019.
//  Copyright © 2019 Marosevic d.o.o. All rights reserved.
//

import UIKit
import Firebase

class LoginViewController: UIViewController, UITextFieldDelegate {

    // MARK: - Outlets
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var passwordLabel: UILabel!
    @IBOutlet weak var emailLoginText: UITextField!
    @IBOutlet weak var passwordLoginText: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        emailLabel.text = "E-mail"
        passwordLabel.text = "Password"
        
        emailLoginText.delegate = self
        passwordLoginText.delegate = self
        
        // Do any additional setup after loading the view.
    }
    
    // MARK: - Actions
    @IBAction func loginButtonTouched(_ sender: Any) {
        
        Auth.auth().signIn(withEmail: emailLoginText.text!, password: passwordLoginText.text!) { (user, error) in
            
            if error == nil {
                self.performSegue(withIdentifier: "loginToHome", sender: self)
                print("Congrats")
            } else {
                let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                
                alertController.addAction(defaultAction)
                self.present(alertController, animated: true, completion: nil)
            }
        }
        
    }
    

    // Functions or methods
    func hidekeyboard() {
        emailLoginText.resignFirstResponder()
        passwordLoginText.resignFirstResponder()
        
    }
    
    
    // UITextFieldDelegate Methods
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        hidekeyboard()
        return true
    }

}
