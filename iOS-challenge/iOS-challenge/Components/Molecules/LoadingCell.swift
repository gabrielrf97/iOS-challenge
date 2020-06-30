//
//  LoadingView.swift
//  iOS-challenge
//
//  Created by Gabriel Faria on 6/29/20.
//  Copyright © 2020 Gabriel Rodrigues. All rights reserved.
//

import Foundation
import UIKit
import NVActivityIndicatorView

class LoadingCell: UITableViewCell, ViewCode {
    
    var activityIndicator: NVActivityIndicatorView!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("There's no XIB available for component.")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupViewComponents()
    }
    
    func createComponents() {
        activityIndicator = NVActivityIndicatorView(frame: self.frame, type: .lineScaleParty, color: .black)
        self.addSubview(activityIndicator)
        activityIndicator.startAnimating()
    }
    
    func setupConstraints() {
        activityIndicator.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        activityIndicator.topAnchor.constraint(equalTo: topAnchor).isActive = true
        activityIndicator.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        activityIndicator.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
    }
}
