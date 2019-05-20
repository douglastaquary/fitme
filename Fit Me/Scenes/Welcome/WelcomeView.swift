//
//  WelcomeView.swift
//  Fit Me
//
//  Created by Douglas Taquary on 14/10/18.
//  Copyright © 2018 Douglas Taquary. All rights reserved.
//

import UIKit


public class WelcomeView: UIView {
    
    var didTapAddButton: (() -> Void)?
    
    public var viewModel: WelcomeViewModel? {
        didSet {
            buildUI()
        }
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        
        buildUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        buildUI()
    }
    
    private lazy var imageView: UIImageView = {
        let v = UIImageView()
        
        v.heightAnchor.constraint(equalToConstant: Metrics.iconWelcomeSizeHeight).isActive = true
        v.widthAnchor.constraint(equalToConstant: Metrics.iconWelcomeSizeHeight).isActive = true
        v.translatesAutoresizingMaskIntoConstraints = false
        
        return v
    }()
    
    private lazy var titleLabel: UILabel = {
        let l = UILabel()
        
        l.font = UIFont.systemFont(ofSize: Metrics.largeTitleFontSize, weight: Metrics.buttonTitleFontWeight)
        l.numberOfLines = 0
        l.lineBreakMode = .byWordWrapping
        
        return l
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let l = UILabel()
        
        l.font = UIFont.systemFont(ofSize: Metrics.welcomeDescriptionFontSize, weight: Metrics.welcomeDescriptionFontWeight)
        l.numberOfLines = 0
        l.lineBreakMode = .byWordWrapping
        l.textAlignment = .center
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
        
        b.addTarget(self, action: #selector(addNewTraining), for: .touchUpInside)
        b.translatesAutoresizingMaskIntoConstraints = false
        b.heightAnchor.constraint(equalToConstant: Metrics.buttonHeight).isActive = true
        
        return b
    }()
    
    @objc private func addNewTraining() {
        //delegate?.welcomeViewController(self)
    }
    
    
    public func buildUI() {
        
        self.backgroundColor = .background
        
        self.addSubview(imageView)
        imageView.topAnchor.constraint(equalTo: self.topAnchor, constant: Metrics.paddingTopImageView*2).isActive = true
        imageView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        
        self.addSubview(contentStack)
        contentStack.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: Metrics.paddingTopTitleToImage*2).isActive = true
        contentStack.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -Metrics.padding).isActive = true
        contentStack.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Metrics.padding).isActive = true
        contentStack.bottomAnchor.constraint(equalTo: welcomeButton.topAnchor, constant: -Metrics.padding)
    
        self.addSubview(welcomeButton)
        welcomeButton.heightAnchor.constraint(equalToConstant: Metrics.padding*8)
        welcomeButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Metrics.padding*3).isActive = true
        welcomeButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -Metrics.padding*3).isActive = true
        welcomeButton.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -Metrics.padding*4).isActive = true
        
        updateUI()
    }
    
    
    private func updateUI() {
        imageView.image = viewModel?.image
        titleLabel.text = viewModel?.title
        descriptionLabel.attributedText = viewModel?.attributedDescription
        welcomeButton.setAttributedTitle(viewModel?.attributedButtonTitle, for: .normal)
    }
}
