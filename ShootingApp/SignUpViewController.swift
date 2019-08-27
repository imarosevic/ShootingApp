
//
//  SignUpViewController.swift
//  ShootingApp
//
//  Created by Ivan Marosevic on 20/08/2019.
//  Copyright © 2019 Marosevic d.o.o. All rights reserved.
//

import UIKit
import Firebase

class SignUpViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var emailSignUpLabel: UILabel!
    @IBOutlet weak var passwordSignUpLabel: UILabel!
    @IBOutlet weak var rePassSignUpLabel: UILabel!
    @IBOutlet weak var emailSignUpTextField: UITextField!
    @IBOutlet weak var passwordSignUpTextField: UITextField!
    @IBOutlet weak var rePasswordSignUpTextField: UITextField!
    @IBOutlet weak var signUpButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        emailSignUpLabel.text = "E-mail"
        passwordSignUpLabel.text = "Password"
        rePassSignUpLabel.text = "Retype password"
        
        emailSignUpTextField.delegate = self
        passwordSignUpTextField.delegate = self
        rePasswordSignUpTextField.delegate = self

        // Do any additional setup after loading the view.
    }
    
    // MARK: - Actions
    @IBAction func signUpTouched(_ sender: Any) {
        if passwordSignUpTextField.text != rePasswordSignUpTextField.text {
            
            let alertController = UIAlertController(title: "Password incorrect", message: "Please retype your password", preferredStyle: .alert)
            
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            
            alertController.addAction(defaultAction)
            self.present(alertController, animated: true, completion: nil)
        } else {
            
            Auth.auth().createUser(withEmail: emailSignUpTextField.text!, password: passwordSignUpTextField.text!) { (user, error) in
                
                if error == nil {
                    
                    self.performSegue(withIdentifier: "signUpToHome", sender: self)
                    print("Succesfull signup")
                } else {
                    
                    let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                    
                    let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    
                    alertController.addAction(defaultAction)
                    self.present(alertController, animated: true, completion: nil)
                }
                
            
            }
         }
    }
    
    // Functions or methods
    func hidekeyboard() {
        emailSignUpTextField.resignFirstResponder()
        passwordSignUpTextField.resignFirstResponder()
        rePasswordSignUpTextField.resignFirstResponder()
        
    }
    

    // UITextFieldDelegate Methods
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        hidekeyboard()
        return true
    }

}
