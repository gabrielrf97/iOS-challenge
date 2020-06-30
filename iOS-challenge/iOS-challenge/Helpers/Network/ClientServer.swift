//
//  ClientServer.swift
//  iOS-challenge
//
//  Created by Gabriel Faria on 6/27/20.
//  Copyright © 2020 Gabriel Rodrigues. All rights reserved.
//

import Foundation

protocol ClientServer {
    func requestSwiftRepositories(in page: Int, completion: @escaping (NetworkLayer<Repositories>) -> Void)
}

struct AppClientServer: ClientServer {
    func requestSwiftRepositories(in page: Int, completion: @escaping (NetworkLayer<Repositories>) -> Void) {
        let parameters : Parameters = ["q": "language:swift", "sort": "stars", "page": page]
        Network.shared.request(.getRepositories, parameters: parameters, model: Repositories.self, completion: { result in
            switch result {
            case .failure(let errorMessage):
                completion(.failure(error: errorMessage))
            case .success(let repositories):
                completion(.success(repositories))
            }
        })
    }
}

struct MockClientServer: ClientServer {
    
    func requestSwiftRepositories(in page: Int, completion: @escaping (NetworkLayer<Repositories>) -> Void) {
        completion(.success(Repositories(items: Repository.getMockedData())))
    }
}
