//
//  LoadingViewController.swift
//  Fit Me
//
//  Created by Santander on 19/05/19.
//  Copyright © 2019 Douglas Taquary. All rights reserved.
//

import UIKit

class LoadingViewController: UIViewController {
    
    private lazy var activityIndicator: UIActivityIndicatorView = {
        let v = UIActivityIndicatorView(style: .gray)
        
        v.translatesAutoresizingMaskIntoConstraints = false
        
        return v
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .background
        
        view.addSubview(activityIndicator)
        activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    private let animationDuration: Double = 0.3
    
    func show(animated: Bool = true) {
        let duration = animated ? animationDuration : 0
        
        activityIndicator.startAnimating()
        
        UIView.animate(withDuration: duration) {
            self.view.alpha = 1
        }
    }
    
    func hide(animated: Bool = true, completion: (() -> Void)? = nil) {
        let duration = animated ? animationDuration : 0
        
        UIView.animate(withDuration: duration, animations: {
            self.view.alpha = 0
        }, completion: { _ in
            self.activityIndicator.stopAnimating()
            self.view.removeFromSuperview()
            self.removeFromParent()
            completion?()
        })
    }
    
}
