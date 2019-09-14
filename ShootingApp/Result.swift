//
//  Result.swift
//  ShootingApp
//
//  Created by Ivan Marosevic on 14/09/2019.
//  Copyright © 2019 Marosevic d.o.o. All rights reserved.
//

import Foundation

class Result {
    var key: String
    var sumResult: Int
    var lat: String
    var long: String
    var profileImageURL: String
    
    init(dictionary: [String: AnyObject], key: String) {
        self.key = key
        self.sumResult = dictionary["sumResult"] as! Int
        self.lat = dictionary["lat"] as! String
        self.long = dictionary["long"] as! String
        self.profileImageURL = dictionary["profileImageURL"] as! String
    }

}
