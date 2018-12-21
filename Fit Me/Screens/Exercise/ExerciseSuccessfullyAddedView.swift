//
//  ExerciseSuccessfullyAddedView.swift
//  Fit Me
//
//  Created by Douglas Taquary on 04/11/18.
//  Copyright © 2018 Douglas Taquary. All rights reserved.
//

import UIKit

class ExerciseSuccessfullyAddedView: UIView {
    
    public var exercise: Exercise?
    
    var didTapOkButton: (() -> Void)?
    
    public var viewModel: TrainingViewModel? {
        didSet {
            buildUI()
            updateUI()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var closeButton: UIButton = {
        let b = UIButton()
        
        b.heightAnchor.constraint(equalToConstant: Metrics.grid*2).isActive = true
        b.widthAnchor.constraint(equalToConstant: Metrics.grid*2).isActive = true
        b.translatesAutoresizingMaskIntoConstraints = false
        
        return b
    }()
    
    private lazy var imageView: UIImageView = {
        let v = UIImageView()
        
        v.heightAnchor.constraint(equalToConstant: Metrics.iconWelcomeSizeHeight).isActive = true
        v.widthAnchor.constraint(equalToConstant: Metrics.iconWelcomeSizeHeight).isActive = true
        v.translatesAutoresizingMaskIntoConstraints = false
        
        return v
    }()
    
    private lazy var titleLabel: UILabel = {
        let l = UILabel()
        
        l.font = UIFont.systemFont(ofSize: Metrics.addExerciseTitleFontSize, weight: Metrics.addExerciseTitleFontWeight)
        l.numberOfLines = 0
        l.lineBreakMode = .byWordWrapping
        
        return l
    }()
    
    private lazy var okButton: FitmeButton = {
        let b = FitmeButton()
        
        b.heightAnchor.constraint(equalToConstant: Metrics.buttonHeight).isActive = true
        b.translatesAutoresizingMaskIntoConstraints = false
        b.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        
        return b
    }()
    

    
    @objc public func didTapButton() {
        self.didTapOkButton?()
    }
    
    
    public func buildUI() {
        backgroundColor = .background
        
        addSubview(closeButton)
        closeButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Metrics.grid*2).isActive = true
        closeButton.topAnchor.constraint(equalTo: topAnchor, constant: Metrics.grid*2).isActive = true
        
        addSubview(titleLabel)
        titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: Metrics.grid*5).isActive = true
        
        addSubview(imageView)
        imageView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        imageView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: Metrics.grid*2).isActive = true

        addSubview(okButton)
        okButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Metrics.grid*2).isActive = true
        okButton.leadingAnchor.constraint(equalTo: trailingAnchor, constant: Metrics.grid*2).isActive = true
        okButton.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: Metrics.grid*2).isActive = true
        okButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -Metrics.grid*2).isActive = true
        
    }
    
    private func updateUI() {
        titleLabel.text = viewModel?.exerciseTitle
        okButton.setAttributedTitle(viewModel?.attributedButtonTitle, for: .normal)
        imageView.image = viewModel?.image
    }
    
}
