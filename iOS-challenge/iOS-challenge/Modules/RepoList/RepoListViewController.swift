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
        viewModel.viewDelegate = self
        setupViewComponents()
        fetchInfo()
    }
    
    func createComponents() {
//        tableView = UITableView()
//        view.addSubview(tableView)
//        tableView.delegate = self
//        tableView.dataSource = self
        tableView.register(RepositoryCell.self, forCellReuseIdentifier: cellIdentifier)
        
//        viewLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 160, height: 40))
//        view.addSubview(viewLabel)
    }
    
    func setupConstraints() {
//        tableView.translatesAutoresizingMaskIntoConstraints = false
//        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
//        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
//        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
//        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
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
        guard let name = repositories?.items[indexPath.row].name,
            let author = repositories?.items[indexPath.row].author.name,
            let stars = repositories?.items[indexPath.row].starsCount,
            let pictureUrl = repositories?.items[indexPath.row].author.pictureUrl
            else { return cell}
        cell.configure(repo: name, author: author, stars: stars, pictureUrl: pictureUrl)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
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
