//
//  Photo.swift
//  QontoTest
//
//  Created by Yacine on 21/03/2017.
//  Copyright © 2017 Yacine YAZMAN. All rights reserved.
//

import Foundation

struct Photo {
    
    let albumId: String
    let id: String
    let title: String
    let url: String
    let thumbnailUrl: String
    
    init(albumId: String, id: String, title: String, url: String, thumbnailUrl: String) {
        self.albumId = albumId
        self.id = id
        self.title = title
        self.url = url
        self.thumbnailUrl = thumbnailUrl
    }
}
