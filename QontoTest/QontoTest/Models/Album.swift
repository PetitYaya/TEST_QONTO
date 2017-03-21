//
//  Album.swift
//  QontoTest
//
//  Created by Yacine on 21/03/2017.
//  Copyright © 2017 Yacine YAZMAN. All rights reserved.
//

import Foundation

struct Album {
    
    let userId: String
    let id: String
    let title: String
    
    init(userId: String, id: String, title: String) {
        self.userId = userId
        self.id = id
        self.title = title
    }
}
