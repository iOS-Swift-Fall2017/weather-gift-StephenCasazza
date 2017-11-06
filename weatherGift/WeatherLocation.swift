//
//  WeatherLocation.swift
//  weatherGift
//
//  Created by Stephen Casazza on 11/5/17.
//  Copyright © 2017 Casazza. All rights reserved.
//

import Foundation

class WeatherLocation: Codable {
    var name: String
    var coordinates: String
    
    init(name: String, coordinates: String) {
        self.name = name
        self.coordinates = coordinates
    }
}
