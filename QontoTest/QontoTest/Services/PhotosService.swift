//
//  PhotosService.swift
//  QontoTest
//
//  Created by Yacine on 21/03/2017.
//  Copyright © 2017 Yacine YAZMAN. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

protocol PhotoGettable {
    static func photos(with albumId: String, completion: @escaping (Result<[Photo]?>) -> Void)
}

class PhotosService: PhotoGettable {
    
    static let urlString = "https://jsonplaceholder.typicode.com/albums/"
    static let endPoint = "/photos"
    
    static func photos(with albumId: String, completion: @escaping (Result<[Photo]?>) -> Void) {
        var photos: [Photo]? = nil
        Alamofire.request(urlString + albumId + endPoint).responseJSON { response in
            if let responseJSON = response.result.value {
                let photosJSON = JSON(responseJSON)
                photos = [Photo]()
                for _ in photosJSON.arrayValue {
                    let photo = Photo(albumId: photosJSON[ModelConstants.Photo.albumId].stringValue,
                                      id: photosJSON[ModelConstants.Photo.id].stringValue,
                                      title: photosJSON[ModelConstants.Photo.title].stringValue,
                                      url: photosJSON[ModelConstants.Photo.url].stringValue,
                                      thumbnailUrl: photosJSON[ModelConstants.Photo.thumbnailUrl].stringValue)
                    photos?.append(photo)
                }
            }
            completion(Result.Success(photos))
        }
    }
}
