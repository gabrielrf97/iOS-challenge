//
//  Repository.swift
//  iOS-challenge
//
//  Created by Gabriel Faria on 6/27/20.
//  Copyright © 2020 Gabriel Rodrigues. All rights reserved.
//

import Foundation

struct Repository: Decodable {
    let id: Int
    let name: String
    let author: Author
    let isPrivate: Bool
    let starsCount: Int
    let language: String
    
    enum CodingKeys: String, CodingKey {
        case author = "author"
        case starsCount = "stargazers_count"
        case isPrivate = "private"
        case id
        case name
        case language
    }
    
    static func getMockedData() -> [Repository] {
        let repositories = [Repository]()
        return repositories
    }
}

struct Author: Decodable {
    let id: Int
    let name: String
    let pictureUrl: String
    
    enum CodingKeys: String, CodingKey {
        case name = "login"
        case pictureUrl = "avatar_url"
        case id
    }
}
