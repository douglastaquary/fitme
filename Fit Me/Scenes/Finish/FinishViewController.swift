//
//  FinishViewController.swift
//  Fit Me
//
//  Created by resource on 26/05/19.
//  Copyright © 2019 Douglas Taquary. All rights reserved.
//

import UIKit

class FinishViewController: UIViewController {
    
    let finishView = WelcomeView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    public func show() {
        view.backgroundColor = .background
        
        view.addSubview(finishView)
        finishView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            finishView.topAnchor.constraint(equalTo: view.topAnchor),
            finishView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            finishView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            finishView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
}

