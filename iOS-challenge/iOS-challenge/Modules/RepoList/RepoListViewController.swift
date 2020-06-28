//
//  RepoListViewController.swift
//  iOS-challenge
//
//  Created by Gabriel Faria on 6/27/20.
//  Copyright © 2020 Gabriel Rodrigues. All rights reserved.
//

import UIKit
import Stevia

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
    
//    var tableView: UITableView!
    @IBOutlet weak var tableView: UITableView!
    let cellIdentifier = "repositoryCell"
    var viewLabel: UILabel!
    
    let viewModel = RepoListViewModel()
    var repositories: Repositories?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewComponents()
        fetchInfo()
    }
    
    func createComponents() {
        tableView.register(RepositoryCell.self, forCellReuseIdentifier: cellIdentifier)
//        tableView = UITableView()
//        tableView.delegate = self
//        tableView.dataSource = self
//        view.addSubview(tableView)
        
//        viewLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 160, height: 40))
//        view.addSubview(viewLabel)
    }
    
    func setupConstraints() {
//        tableView.left(0).top(0).right(0).bottom(0)
//        viewLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
//        viewLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
//        viewLabel.heightAnchor.constraint(equalToConstant: 60).isActive = true
//        viewLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
//        viewLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
//        viewLabel.backgroundColor = .red
    }
    
    func fetchInfo() {
        UIViewController.activityIndicator.startAnimating()
        viewModel.fecthData()
    }
    
}

extension RepoListViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return repositories?.items.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! RepositoryCell
        cell.nameLabel.text = repositories?.items[indexPath.row].name
        return cell
    }
}

extension RepoListViewController: RepoListViewDelegate {
    func show(repositories: Repositories) {
//        UIViewController.activityIndicator.stopAnimating()
//        self.repositories.removeAll()
        self.repositories = repositories
        self.tableView.reloadData()
    }
    
    func show(errorMessage: String) {
//        UIViewController.activityIndicator.stopAnimating()
        self.present(message: "Something went wrong", withTitle: "Ops" , option: "Try again!")
    }
}
