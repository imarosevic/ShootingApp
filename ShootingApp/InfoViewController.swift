//
//  InfoViewController.swift
//  ShootingApp
//
//  Created by Ivan Marosevic on 15/09/2019.
//  Copyright © 2019 Marosevic d.o.o. All rights reserved.
//

import UIKit
import MapKit

class InfoViewController: UIViewController {


    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var mapView: MKMapView!
    
    var myString1: String = ""
    var myString2: String = ""
    var myString3: String = ""
    var locationManager: CLLocationManager!
    var regionalRadius: CLLocationDistance = 5000
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        let lat = Double(myString2)
        let long = Double(myString3)
        
        if let url = NSURL(string: myString1) {
            if let data = NSData(contentsOf: url as URL){
                imageView.contentMode = UIView.ContentMode.scaleAspectFit
                imageView.image = UIImage(data: data as Data)
            }
        }

    
        
        let resultLocation = CLLocation(latitude: lat!, longitude: long!)
        
        centerMapOnLocation(location: resultLocation)
        
        let homePin = MKPointAnnotation()
        homePin.coordinate = CLLocationCoordinate2D(latitude: resultLocation.coordinate.latitude, longitude: resultLocation.coordinate.longitude)
        
        self.mapView.addAnnotation(homePin)
        
        locationManager = CLLocationManager()
        
    }
    

    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: regionalRadius, longitudinalMeters: regionalRadius)
        mapView.setRegion(coordinateRegion, animated: true)
    }
    
    
}

extension InfoViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        
        if (annotation is MKUserLocation){
            return nil
        }else {
            
            let an: MKAnnotationView = MKAnnotationView()
            an.image = UIImage(named: "blabla")
            return an
        }
    }
}
