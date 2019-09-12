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

class NewScoreController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var round1: UITextField!
    @IBOutlet weak var round2: UITextField!
    @IBOutlet weak var round3: UITextField!
    @IBOutlet weak var round4: UITextField!
    @IBOutlet weak var round5: UITextField!
    @IBOutlet weak var round6: UITextField!
    @IBOutlet weak var addImage: UIButton!
    @IBOutlet weak var selectedImage: UIImageView!
    
    @IBOutlet weak var add: UIButton!

    
    var ref: DatabaseReference?
    let imagePicker =  UIImagePickerController()
   
    
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
    
    func calculate() -> String{
        let round1Int = Int(round1.text!) ?? 0
        let round2Int = Int(round2.text!) ?? 0
        let round3Int = Int(round3.text!) ?? 0
        let round4Int = Int(round4.text!) ?? 0
        let round5Int = Int(round5.text!) ?? 0
        let round6Int = Int(round6.text!) ?? 0

        let convert = round1Int + round2Int + round3Int + round4Int + round5Int + round6Int
        let convertText = String(convert)

        return convertText
    }
    
    // UITextFieldDelegate Methods
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        hidekeyboard()
        return true
    }
    @IBAction func addImageTouched(_ sender: Any) {
        
    
        let alert = UIAlertController(title: "Choose Image", message: nil, preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Camera", style: .default, handler: { _ in
            self.openCamera()
        }))
        
        alert.addAction(UIAlertAction(title: "Gallery", style: .default, handler: { _ in
            self.openGallary()
        }))
        
        alert.addAction(UIAlertAction.init(title: "Cancel", style: .cancel, handler: nil))
        
        
        self.present(alert, animated: true, completion: nil)
    }
    
    func openCamera()
    {
         imagePicker.delegate = self

        if(UIImagePickerController .isSourceTypeAvailable(UIImagePickerController.SourceType.camera))
        {
            imagePicker.sourceType = UIImagePickerController.SourceType.camera
            imagePicker.allowsEditing = true
            self.present(imagePicker, animated: true, completion: nil)
        }
        else
        {
            let alert  = UIAlertController(title: "Warning", message: "You don't have camera", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    func openGallary()
    {
        imagePicker.delegate = self
        
        imagePicker.sourceType = UIImagePickerController.SourceType.photoLibrary
        imagePicker.allowsEditing = true
        self.present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        

        if let image = info[UIImagePickerController] as? UIImage {
            selectedImage.image = image
    }
    }
    
     @IBAction func addTouched(_ sender: Any) {
        
        let sum = calculate()
       
        if round1.text?.isEmpty ?? true || round2.text?.isEmpty ?? true || round3.text?.isEmpty ?? true || round4.text?.isEmpty ?? true || round5.text?.isEmpty ?? true || round6.text?.isEmpty ?? true {
            print("error")
        } else {
            self.ref?.childByAutoId().setValue(["round1": round1.text!,
                                                  "round2": round2.text!,
                                                  "round3": round3.text!,
                                                  "round4": round4.text!,
                                                  "round5": round5.text!,
                                                  "round6": round6.text!,
                                                  "sum": sum])
            
            self.performSegue(withIdentifier: "newToScoreboard", sender: self)
//        sumResult.text = Int(round1.text!)
        }

    }
}

