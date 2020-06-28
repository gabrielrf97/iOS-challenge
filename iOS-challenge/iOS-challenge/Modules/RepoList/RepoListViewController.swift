//
//  RepoListViewController.swift
//  iOS-challenge
//
//  Created by Gabriel Faria on 6/27/20.
//  Copyright © 2020 Gabriel Rodrigues. All rights reserved.
//

import UIKit

protocol ViewCode {
    func createComponents()
    func setupConstraints()
    func additionalSetup()
    func setupViewComponents()
}

extension ViewCode {
    
    func setupViewComponents() {
        createComponents()
        setupConstraints()
        additionalSetup()
    }
    
    func additionalSetup() {}
}

class RepoListViewController: UIViewController, ViewCode {
    
    var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewComponents()
        // Do any additional setup after loading the view.
    }
    
    func createComponents() {
        tableView = UITableView()
        self.view.addSubview(tableView)
    }
    
    func setupConstraints() {
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor)
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor)
    }
    
}
