//
//  AlbumsService.swift
//  QontoTest
//
//  Created by Yacine on 21/03/2017.
//  Copyright © 2017 Yacine YAZMAN. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

protocol AlbumGettable {
    static func albums(with userId: String, completion: @escaping (Result<[Album]?>) -> Void)
}

class AlbumsService: AlbumGettable {
    
    static let endPoint = "/albums"
    
    static func albums(with userId: String, completion: @escaping (Result<[Album]?>) -> Void) {
        var albums: [Album]? = nil
        Alamofire.request(UsersService.urlString + userId + endPoint).responseJSON { response in
            if let responseJSON = response.result.value {
                let albumsJSON = JSON(responseJSON)
                albums = [Album]()
                for albumJSON in albumsJSON.arrayValue {
                    let album = Album(userId: albumJSON[ModelConstants.Album.userId].stringValue,
                                      id: albumJSON[ModelConstants.Album.id].stringValue,
                                      title: albumJSON[ModelConstants.Album.title].stringValue)
                    albums?.append(album)
                }
            }
            completion(Result.Success(albums))
        }
    }
}
