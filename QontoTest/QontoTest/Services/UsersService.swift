//
//  UsersService.swift
//  QontoTest
//
//  Created by Yacine on 21/03/2017.
//  Copyright © 2017 Yacine YAZMAN. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

enum Result<T> {
    case Success(T)
}

protocol UserGettable {
    static func users(with completion: @escaping (Result<[User]?>) -> Void)
}

class UsersService: UserGettable {
    
    static let urlString = "https://jsonplaceholder.typicode.com/users/"
    
    static func users(with completion: @escaping (Result<[User]?>) -> Void) {
        var users: [User]? = nil
        Alamofire.request(urlString).responseJSON { response in
            if let responseJSON = response.result.value {
                let usersJSON = JSON(responseJSON)
                users = [User]()
                for userJSON in usersJSON.arrayValue {
                    
                    let addressJSON = userJSON[ModelConstants.User.address]
                    let address = Address(street: addressJSON[ModelConstants.Address.street].stringValue,
                                          streetSuite: addressJSON[ModelConstants.Address.streetSuite].stringValue,
                                          city: addressJSON[ModelConstants.Address.city].stringValue,
                                          zipcode: addressJSON[ModelConstants.Address.zipcode].stringValue,
                                          latitude: addressJSON[ModelConstants.Address.lat].doubleValue,
                                          longitude: addressJSON[ModelConstants.Address.lng].doubleValue)
                    
                    let companyJSON = userJSON[ModelConstants.User.company]
                    let company = Company(name: companyJSON[ModelConstants.Company.name].stringValue,
                                          catchPhrase: companyJSON[ModelConstants.Company.catchPhrase].stringValue,
                                          bs: companyJSON[ModelConstants.Company.bs].stringValue)
                    
                    let user = User(id: userJSON[ModelConstants.User.id].stringValue,
                                    name: userJSON[ModelConstants.User.name].stringValue,
                                    username: userJSON[ModelConstants.User.username].stringValue,
                                    email: userJSON[ModelConstants.User.email].stringValue,
                                    address: address,
                                    phone: userJSON[ModelConstants.User.phone].stringValue,
                                    website: userJSON[ModelConstants.User.website].stringValue,
                                    company: company)
                    users?.append(user)
                }
            }
            completion(Result.Success(users))
        }
    }
}
