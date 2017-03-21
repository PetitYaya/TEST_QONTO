//
//  ModelConstants.swift
//  QontoTest
//
//  Created by Yacine on 21/03/2017.
//  Copyright © 2017 Yacine YAZMAN. All rights reserved.
//

import Foundation

struct ModelConstants {
    
    struct User {
        static let id = "id"
        static let name = "name"
        static let username = "username"
        static let email = "email"
        static let address = "address"
        static let phone = "phone"
        static let website = "website"
        static let company = "company"
    }
    
    struct Company {
        static let name = "name"
        static let catchPhrase = "catchPhrase"
        static let bs = "bs"
    }
    
    struct Address {
        static let street = "street"
        static let streetSuite = "streetSuite"
        static let city = "city"
        static let zipcode = "zipcode"
        static let lat = "lat"
        static let lng = "lng"
    }
    
    struct Album {
        static let userId = "userId"
        static let id = "id"
        static let title = "title"
    }
    
    struct Photo {
        static let albumId = "albumId"
        static let id = "id"
        static let title = "title"
        static let url = "url"
        static let thumbnailUrl = "thumbnailUrl"
    }
}
