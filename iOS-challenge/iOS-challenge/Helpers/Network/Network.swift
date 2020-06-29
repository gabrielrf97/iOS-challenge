//
//  Network.swift
//  iOS-challenge
//
//  Created by Gabriel Faria on 6/27/20.
//  Copyright © 2020 Gabriel Rodrigues. All rights reserved.
//

import Foundation
import Alamofire

typealias Parameters = [String : Any]

enum NetworkLayer<Model> {
    case failure(error: String)
    case success(Model)
}

class Network {
    
    static let shared = Network()
    
    private init() {}
    
    func request<Model:Decodable>(_ router: Router, parameters: Parameters? = nil, model: Model.Type, completion: @escaping (NetworkLayer<Model>) -> Void) {
        
        URLCache.shared.removeAllCachedResponses()
        
        AF.request(router.url, method: router.method , parameters: parameters, headers: router.headers)
            .validate()
            .response { response in
                
            do {
                
                var object: Model?
                
                if let error = response.error as NSError? {
                    
                    switch error.code {
                    case -1009:
                        completion(.failure(error: "No internet connection"))
                    case -1004:
                        completion(.failure(error: "We could not connect to the server"))
                    default:
                        let errorMessage = String(data: response.data!, encoding: .utf8)
                        completion(.failure(error: errorMessage ?? ""))
                    }
                    
                    return
                }
                
                if response.data?.count != 0 {
                    object = try JSONDecoder().decode(model, from: response.data!)
                    if let _object = object {
                        completion(.success(_object))
                    }
                }
                
            } catch {
                completion(.failure(error: "Sorry, something went wrong"))
            }
        }
        
    }
    
}
