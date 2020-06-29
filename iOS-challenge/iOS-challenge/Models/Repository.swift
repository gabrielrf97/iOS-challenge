//
//  Repository.swift
//  iOS-challenge
//
//  Created by Gabriel Faria on 6/27/20.
//  Copyright © 2020 Gabriel Rodrigues. All rights reserved.
//

import Foundation

class Repositories: Decodable {
    var items: [Repository]
}

struct Repository: Decodable {
    let id: Int
    let name: String
    let author: Author
    let isPrivate: Bool
    let starsCount: Int
    let language: String
    
//    required init(from decoder: Decoder) throws {
//        let items = try decoder.container(keyedBy: CodingKeys.self)
//        //        author = try items.decode(Author.self, forKey: .author)
//        id = try items.decode(Int.self, forKey: .id)
//        //        name = try items.decode(String.self, forKey: .name)
//        //        isPrivate = try items.decode(Bool.self, forKey: .isPrivate)
//        //        starsCount = try items.decode(Int.self, forKey: .starsCount)
//        //        language = try items.decode(String.self, forKey: .language)
//    }
    
    enum CodingKeys: String, CodingKey {
        case author = "owner"
        case starsCount = "stargazers_count"
        case isPrivate = "private"
        case id
        case name
        case language
//        case items = "items"
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
