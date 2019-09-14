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
import CoreLocation

class NewScoreController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate,  CLLocationManagerDelegate{

    @IBOutlet weak var round1: UITextField!
    @IBOutlet weak var round2: UITextField!
    @IBOutlet weak var round3: UITextField!
    @IBOutlet weak var round4: UITextField!
    @IBOutlet weak var round5: UITextField!
    @IBOutlet weak var round6: UITextField!
    @IBOutlet weak var addImage: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var add: UIButton!

    
    var ref: DatabaseReference?
    var imagePicker: UIImagePickerController!
    var locManager = CLLocationManager()
   
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
        round1.delegate = self
        round2.delegate = self
        round3.delegate = self
        round4.delegate = self
        round5.delegate = self
        round6.delegate = self
        
        ref = Database.database().reference().child("results")
        locManager.requestWhenInUseAuthorization()
        
      
        
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
    
    func imagePickerController(_ picker: UIImagePickerController, didfinishpickingImage info: [UIImagePickerController.InfoKey : Any]) {
        
        imagePicker.dismiss(animated: true, completion: nil)
        imageView.image = info[.originalImage] as? UIImage
        
    }
    
    @IBAction func addImageTouched(_ sender: Any) {
        
        imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .camera
        
        present(imagePicker, animated: true, completion: nil)
        
    

    }
    

 
     @IBAction func addTouched(_ sender: Any) {
        
        let key = (ref?.childByAutoId().key)!
        let sum = calculate()
        let userN = NSFullUserName()
        var currentLocation: CLLocation!
        let imageName = NSUUID().uuidString
        let storageRef = Storage.storage().reference().child("\(imageName).png")
        
        if let uploadData = self.imageView.image?.jpegData(compressionQuality: 0.1){
            print("UPLOAD DATA: ")
            print(uploadData)
            storageRef.putData(uploadData, metadata: nil, completion: { (metadata, error) in
    
            
                if error != nil {
                print(error!)
                return
            }
                storageRef.downloadURL(completion: {(url, error) in
                    if error != nil {
                        print("Failed to download url:", error!)
                        return
                    }
                    
                    let imageURL = url?.absoluteString
                    
            if (CLLocationManager.authorizationStatus() == .authorizedWhenInUse || CLLocationManager.authorizationStatus() == .authorizedAlways ){
                currentLocation = self.locManager.location
            }
            
            let long = "\(currentLocation.coordinate.longitude)"
            let lat = "\(currentLocation.coordinate.latitude)"
        
        
            
            if self.round1.text?.isEmpty ?? true || self.round2.text?.isEmpty ?? true || self.round3.text?.isEmpty ?? true || self.round4.text?.isEmpty ?? true || self.round5.text?.isEmpty ?? true || self.round6.text?.isEmpty ?? true {
                print("error")
            } else {
                self.ref?.child(key).setValue(["sum": sum,
                                                "long": long,
                                                "lat": lat,
                                                "photoURL": imageURL,
                                                "name": userN,
                                                "id": key])
                
                
            }
        })
        
        self.performSegue(withIdentifier: "newToScoreboard", sender: self)


    })
}
}
}


