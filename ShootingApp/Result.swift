//
//  Result.swift
//  ShootingApp
//
//  Created by Ivan Marosevic on 14/09/2019.
//  Copyright © 2019 Marosevic d.o.o. All rights reserved.
//

import Foundation

class Result {
    
    var id: String?
    var name: String?
    var imageURL: String?
    var sumResult: String?
    var long: String?
    var lat: String?
    
    init(id: String?, name: String?, imageURL: String?, sumResult: String?, long: String?, lat: String?) {
        self.id = id
        self.name = name
        self.imageURL = imageURL
        self.sumResult = sumResult
        self.long = long
        self.lat = lat
        
    }

}
