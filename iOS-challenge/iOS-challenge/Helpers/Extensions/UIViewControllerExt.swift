//
//  UIViewControllerExt.swift
//  iOS-challenge
//
//  Created by Gabriel Faria on 6/27/20.
//  Copyright © 2020 Gabriel Rodrigues. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    
    static var activityIndicator = UIActivityIndicatorView(style: .large)
    
    func present( message: String, withTitle title: String, option: String?) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: option ?? "Try Again", style: .default))
        self.present(alert, animated: true, completion: nil)
    }
    
    func startLoading(with message: String?) {
        UIViewController.activityIndicator.center = self.view.center
        self.view.addSubview(UIViewController.activityIndicator)
        UIViewController.activityIndicator.startAnimating()
    }
    
    func stopLoading() {
        UIViewController.activityIndicator.stopAnimating()
    }
}
