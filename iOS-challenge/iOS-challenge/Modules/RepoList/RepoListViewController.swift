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
    var refreshControl = UIRefreshControl()
    @IBOutlet weak var tableView: UITableView!
    let cellIdentifier = "repositoryCell"
    let loadingCellIndentifier = "loadingCell"
    var viewLabel: UILabel!
    var isLoading = false
    let viewModel = RepoListViewModel()
    var repositories: Repositories?

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.viewDelegate = self
        setupViewComponents()
        fetchInfo()
        refreshControl.addTarget(self, action: #selector(self.refresh(_:)), for: .valueChanged)
        tableView.addSubview(refreshControl)
    }
    
    @objc func refresh(_ sender: AnyObject) {
       viewModel.fecthData()
    }
    
    func createComponents() {
//        tableView = UITableView()
//        view.addSubview(tableView)
//        tableView.delegate = self
//        tableView.dataSource = self
        tableView.showsVerticalScrollIndicator = false
        tableView.register(RepositoryCell.self, forCellReuseIdentifier: cellIdentifier)
        tableView.register(LoadingCell.self, forCellReuseIdentifier: loadingCellIndentifier)
        
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
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return repositories?.items.count ?? 0
        } else {
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! RepositoryCell
            guard let name = repositories?.items[indexPath.row].name,
                let author = repositories?.items[indexPath.row].author.name,
                let stars = repositories?.items[indexPath.row].starsCount,
                let pictureUrl = repositories?.items[indexPath.row].author.pictureUrl
                else { return cell}
            cell.configure(repo: name, author: author, stars: stars, pictureUrl: pictureUrl)
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: loadingCellIndentifier, for: indexPath) as! LoadingCell
            cell.activityIndicator.startAnimating()
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return 100
        default:
            return 60
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height

        if (offsetY > contentHeight - scrollView.frame.height * 1.5) && !isLoading {
//            isLoading = true
//            fetchInfo()
        }
    }
}

extension RepoListViewController: RepoListViewDelegate {
    func show(repositories: Repositories) {
//        UIViewController.activityIndicator.stopAnimating()
//        self.repositories.removeAll()
        isLoading = false
        self.refreshControl.endRefreshing()
        if let items = self.repositories?.items {
            self.repositories?.items.append(contentsOf: repositories.items)
        } else {
            self.repositories = repositories
        }
        self.tableView.reloadData()
    }
    
    func show(errorMessage: String) {
//        UIViewController.activityIndicator.stopAnimating()
        isLoading = false
        self.refreshControl.endRefreshing()
        self.present(message: "Something went wrong", withTitle: "Ops" , option: "Try again!")
    }
}
