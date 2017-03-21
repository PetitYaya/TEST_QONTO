//
//  Address.swift
//  QontoTest
//
//  Created by Yacine on 21/03/2017.
//  Copyright © 2017 Yacine YAZMAN. All rights reserved.
//

import Foundation

struct Address {
    
    let street: String
    let streetSuite: String
    let city: String
    let zipcode: String
    let lat: Double
    let lng: Double
    
    init(street: String, streetSuite: String,
         city: String, zipcode: String,
         latitude: Double, longitude: Double) {
        self.street = street
        self.streetSuite = streetSuite
        self.city = city
        self.zipcode = zipcode
        lat = latitude
        lng = longitude
    }
}
