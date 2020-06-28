//
//  RepoListViewModel.swift
//  iOS-challenge
//
//  Created by Gabriel Faria on 6/27/20.
//  Copyright © 2020 Gabriel Rodrigues. All rights reserved.
//

import Foundation

protocol RepoListViewDelegate: class {
    func show(repositories: Repositories)
    func show(errorMessage: String)
}

class RepoListViewModel {
    
    weak var viewDelegate: RepoListViewDelegate?
    var server: ClientServer?
    
    init(network: ClientServer = AppClientServer()) {
        self.server = network
    }
    
    func fecthData() {
        server?.requestSwiftRepositories(completion: { [unowned self] response in
            switch response {
            case .success(let repositories):
                self.viewDelegate?.show(repositories: repositories)
            case .failure(let errorMessage):
                self.viewDelegate?.show(errorMessage: errorMessage)
            }
        })
    }
}
