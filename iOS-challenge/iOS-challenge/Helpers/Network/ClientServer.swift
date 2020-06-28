//
//  ClientServer.swift
//  iOS-challenge
//
//  Created by Gabriel Faria on 6/27/20.
//  Copyright © 2020 Gabriel Rodrigues. All rights reserved.
//

import Foundation

protocol ClientServer {
    func requestSwiftRepositories(completion: @escaping (NetworkLayer<Repositories>) -> Void)
}

struct AppClientServer: ClientServer {
    func requestSwiftRepositories(completion: @escaping (NetworkLayer<Repositories>) -> Void) {
        let parameters = ["q": "language:swift", "sort": "stars"]
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

//struct MockClientServer: ClientServer {
//
//    func requestSwiftRepositories(completion: @escaping (NetworkLayer<Repositories>) -> Void) {
//        completion(.success(Repository.getMockedData()))
//    }
//}
