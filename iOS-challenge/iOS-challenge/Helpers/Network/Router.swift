//
//  Router.swift
//  iOS-challenge
//
//  Created by Gabriel Faria on 6/27/20.
//  Copyright © 2020 Gabriel Rodrigues. All rights reserved.
//

import Foundation
import Alamofire

enum Router {
    
    case getRepositories
    
    static var domain = "https://api.github.com/"
    
    static var version = ""
    
    static var emptyUrl: String {
        return "\(Router.domain)\(Router.version)"
    }
    
    var url: String {
        return "\(Router.domain)\(Router.version)\(self.path)"
    }
    
    var path: String {
        switch self {
        case .getRepositories: return "search/repositories"
        }
    }
    
    var method: HTTPMethod {
        switch self {
            case .getRepositories: return .get
        }
    }
    
    var headers: HTTPHeaders? {
        return nil
    }
}
