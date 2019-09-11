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

class NewScoreController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var round1: UITextField!
    @IBOutlet weak var round2: UITextField!
    @IBOutlet weak var round3: UITextField!
    @IBOutlet weak var round4: UITextField!
    @IBOutlet weak var round5: UITextField!
    @IBOutlet weak var round6: UITextField!
    @IBOutlet weak var sumResult: UILabel!
    @IBOutlet weak var imagePicker: UIImageView!
    
    @IBOutlet weak var add: UIButton!

    
    var ref: DatabaseReference?
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        round1.keyboardType = .numberPad
        
        round1.delegate = self
        round2.delegate = self
        round3.delegate = self
        round4.delegate = self
        round5.delegate = self
        round6.delegate = self
        
        ref = Database.database().reference(fromURL: "https://ioshootingapp.firebaseio.com/leaderboards")
        
    }

    // Functions or methods
    func hidekeyboard() {
        round1.resignFirstResponder()
        round2.resignFirstResponder()
        round3.resignFirstResponder()
        round4.resignFirstResponder()
        round5.resignFirstResponder()
        round6.resignFirstResponder()
    }
    
//    func calculate(_ sender: AnyObject) -> String{
//        let round1Int: Int? = Int(round1.text!)
//        let round2Int: Int? = Int(round2.text!)
//        let round3Int: Int? = Int(round3.text!)
//        let round4Int: Int? = Int(round4.text!)
//        let round5Int: Int? = Int(round5.text!)
//        let round6Int: Int? = Int(round6.text!)
//
//        let convert = round1Int + round2Int + round3Int + round4Int + round5Int + round6Int
//        let convertText = String(convert)
//
//        return convert
//    }
    
    // UITextFieldDelegate Methods
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        hidekeyboard()
        return true
    }
    
     @IBAction func addTouched(_ sender: Any) {
       
        if round1.text?.isEmpty ?? true || round2.text?.isEmpty ?? true || round3.text?.isEmpty ?? true || round4.text?.isEmpty ?? true || round5.text?.isEmpty ?? true || round6.text?.isEmpty ?? true {
            print("error")
        } else {
            self.ref?.child("leaderboards").setValue(["round1": round1.text!,
                                                  "round2": round2.text!,
                                                  "round3": round3.text!,
                                                  "round4": round4.text!,
                                                  "round5": round5.text!,
                                                  "round6": round6.text!,
                                                  "sum": sumResult.text!,
                                                  "timestamp": Date()])
            
            self.performSegue(withIdentifier: "newToScoreboard", sender: self)
//        sumResult.text = Int(round1.text!)
        }

    }
}
