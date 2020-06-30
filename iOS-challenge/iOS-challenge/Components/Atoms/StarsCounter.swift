//
//  StarsCounter.swift
//  iOS-challenge
//
//  Created by Gabriel Faria on 6/30/20.
//  Copyright © 2020 Gabriel Rodrigues. All rights reserved.
//

import Foundation
import UIKit

class StarsCounter: UIView, ViewCode {
    
    var counter: Int!
    var counterLabel: UILabel!
    var starsImage: UIImageView!
    
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("There's no XIB available for component.")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupViewComponents()
    }
    
    func createComponents() {
        counterLabel = UILabel()
        addSubview(counterLabel)
        
        starsImage = UIImageView(image: UIImage(systemName: "star"))
        addSubview(starsImage)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            starsImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            starsImage.widthAnchor.constraint(equalToConstant: 20),
            starsImage.heightAnchor.constraint(equalToConstant: 20),
            starsImage.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            counterLabel.leadingAnchor.constraint(equalTo: starsImage.trailingAnchor, constant: 12),
            counterLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 12),
            counterLabel.heightAnchor.constraint(equalToConstant: 40),
            counterLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
       ])
    }
    
    func additionalSetup() {
        self.backgroundColor = .gray
        self.layer.cornerRadius = 12
        self.layer.masksToBounds = true
    }
    
}
