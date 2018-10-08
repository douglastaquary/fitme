//
//  WelcomeViewController.swift
//  Fit Me
//
//  Created by Douglas Taquary on 06/10/18.
//  Copyright © 2018 Douglas Taquary. All rights reserved.
//

import UIKit

protocol WelcomeViewControllerDelegate: class {
    func welcomeViewController(_ controller: WelcomeViewController)
}

final class WelcomeViewController: UIViewController {
    
    weak var delegate: WelcomeViewControllerDelegate?
    
    let viewModel: WelcomeViewModel = WelcomeViewModel()
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private lazy var imageView: UIImageView = {
       let v = UIImageView()
        
        v.heightAnchor.constraint(equalToConstant: Metrics.iconWelcomeSizeHeight).isActive = true
        v.translatesAutoresizingMaskIntoConstraints = false
        
        return v
    }()
    
    private lazy var titleLabel: UILabel = {
       let l = UILabel()
        
        l.font = UIFont.systemFont(ofSize: Metrics.largeTitleFontSize, weight: Metrics.buttonTitleFontWeight)
        l.numberOfLines = 1
        l.lineBreakMode = .byTruncatingTail
        
        return l
    }()
    
    private lazy var descriptionLabel: UILabel = {
       let l = UILabel()
       
        l.font = UIFont.systemFont(ofSize: Metrics.welcomeDescriptionFontSize, weight: Metrics.welcomeDescriptionFontWeight)
        l.numberOfLines = 0
        l.lineBreakMode = .byWordWrapping
        l.translatesAutoresizingMaskIntoConstraints = false
        
        return l
    }()
    
    private lazy var contentStack: UIStackView = {
       let v = UIStackView(arrangedSubviews: [
            titleLabel,
            descriptionLabel
        ])
        
        v.axis = .vertical
        v.alignment = .center
        v.spacing = Metrics.padding
        v.translatesAutoresizingMaskIntoConstraints = false
        
        return v
    }()
    
    
    private lazy var welcomeButton: FitmeButton = {
       let b = FitmeButton()
        
        b.addTarget(self, action: #selector(goTrainingList), for: .touchUpInside)
        b.translatesAutoresizingMaskIntoConstraints = false
        b.heightAnchor.constraint(equalToConstant: Metrics.buttonHeight).isActive = true
        
        return b
    }()
    
    @objc private func goTrainingList() {
        delegate?.welcomeViewController(self)
    }
    
    override func viewDidLoad() {
        view.backgroundColor = .background
        
        view.addSubview(imageView)
        imageView.topAnchor.constraint(equalTo: view.topAnchor, constant: Metrics.paddingTopImageView).isActive = true
        imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        view.addSubview(contentStack)
        contentStack.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: -Metrics.paddingTopTitleToImage).isActive = true
        contentStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Metrics.padding).isActive = true
        contentStack.leadingAnchor.constraint(equalTo: view.trailingAnchor, constant: Metrics.padding).isActive = true
        
        view.addSubview(welcomeButton)
        welcomeButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Metrics.padding).isActive = true
        welcomeButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Metrics.padding).isActive = true
        welcomeButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -Metrics.padding).isActive = true
        
        updateUI()

    }
    
    private func updateUI() {
        imageView.image = viewModel.image
        titleLabel.text = viewModel.title
        descriptionLabel.text = viewModel.description
        welcomeButton.setTitle(viewModel.buttonTitle, for: .normal)
    }
}
