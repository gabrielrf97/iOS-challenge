//
//  LoadingView.swift
//  iOS-challenge
//
//  Created by Gabriel Faria on 6/29/20.
//  Copyright © 2020 Gabriel Rodrigues. All rights reserved.
//

import Foundation
import UIKit

class LoadingCell: UITableViewCell, ViewCode {
    
    var activityIndicator: UIActivityIndicatorView!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        setupViewComponents()
    }
    
    required init?(coder: NSCoder) {
        fatalError("There's no XIB available for component.")
    }
    
    func createComponents() {
        activityIndicator = UIActivityIndicatorView(frame: self.frame)
        activityIndicator.startAnimating()
        self.backgroundColor = .green
        activityIndicator.backgroundColor = .yellow
        self.addSubview(activityIndicator)
    }
    
    func setupConstraints() {
        activityIndicator.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        activityIndicator.topAnchor.constraint(equalTo: topAnchor).isActive = true
        activityIndicator.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        activityIndicator.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
    }
}
