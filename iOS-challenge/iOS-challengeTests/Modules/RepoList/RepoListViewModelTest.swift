//
//  RepoListViewModelTest.swift
//  iOS-challengeTests
//
//  Created by Gabriel Faria on 6/30/20.
//  Copyright © 2020 Gabriel Rodrigues. All rights reserved.
//

import XCTest
@testable import iOS_challenge

class RepoListViewModelTest: XCTestCase {
    
    var viewModel: RepoListViewModel!
    var viewController: RepoListViewController!
    var repositories: Repositories!

    override func setUp() {
        viewModel = RepoListViewModel(network: MockClientServer())
        viewController = RepoListViewController()
        viewController.viewModel = viewModel
        viewModel.viewDelegate = self
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testFetchData() {
        viewModel.fecthData()
    }
}

extension RepoListViewModelTest: RepoListViewDelegate {
    
    func show(errorMessage: String) {
        
    }
    
    func show(repositories: Repositories) {
        if let items = self.repositories?.items {
            self.repositories?.items.append(contentsOf: repositories.items)
            XCTAssertNotNil(items)
            XCTAssert(items.isEmpty)
        } else {
            self.repositories = repositories
            XCTAssertNotNil(self.repositories.items)
            XCTAssert(self.repositories.items.isEmpty)
//            assert quantity based on viewModel index
        }
    }

}
