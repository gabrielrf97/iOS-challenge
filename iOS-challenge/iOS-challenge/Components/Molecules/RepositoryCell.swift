//
//  RepositoryCell.swift
//  iOS-challenge
//
//  Created by Gabriel Faria on 6/28/20.
//  Copyright © 2020 Gabriel Rodrigues. All rights reserved.
//

import Foundation
import UIKit
import SDWebImage

class RepositoryCell: UITableViewCell, ViewCode {
    
    var nameLabel: UILabel!
    var authorLabel: UILabel!
    var starsLabel: UILabel!
    var authorImage: UIImageView!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        setupViewComponents()
    }
    
    required init?(coder: NSCoder) {
        fatalError("There's no XIB available for component.")
    }
    
    func createComponents() {
        nameLabel = UILabel()
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(nameLabel)
        
        authorLabel = UILabel()
        authorLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(authorLabel)
        
        starsLabel = UILabel()
        starsLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(starsLabel)
        
        authorImage = UIImageView()
        authorImage.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(authorImage)
    }
    
    func setupConstraints() {
        
        NSLayoutConstraint.activate([
            authorImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 12),
            authorImage.widthAnchor.constraint(equalToConstant: 60.0),
            authorImage.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            authorImage.heightAnchor.constraint(equalToConstant: 60.0)
        ])
        authorImage.layer.cornerRadius = 12
        authorImage.layer.masksToBounds = true
        
        NSLayoutConstraint.activate([
            starsLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -12),
            starsLabel.widthAnchor.constraint(equalToConstant: 80.0),
            starsLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            starsLabel.heightAnchor.constraint(equalToConstant: 80.0)
        ])
        starsLabel.textAlignment = .center
        
        NSLayoutConstraint.activate([
            nameLabel.trailingAnchor.constraint(equalTo: starsLabel.leadingAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: authorImage.trailingAnchor, constant: 18),
            nameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 12),
            nameLabel.heightAnchor.constraint(equalToConstant: 40.0)
        ])
        
        NSLayoutConstraint.activate([
            authorLabel.trailingAnchor.constraint(equalTo: starsLabel.leadingAnchor),
            authorLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            authorLabel.bottomAnchor.constraint(equalTo: authorImage.bottomAnchor),
            authorLabel.heightAnchor.constraint(equalToConstant: 40.0)
        ])
    }
    
    func configure(repo: String, author: String, stars: Int, pictureUrl: String) {
        self.nameLabel.text = repo
        self.authorLabel.text = author
        self.starsLabel.text = String(stars)
        let url = URL(string: pictureUrl)
        self.authorImage.sd_setImage(with: url, completed: .none)
    }
    
}
