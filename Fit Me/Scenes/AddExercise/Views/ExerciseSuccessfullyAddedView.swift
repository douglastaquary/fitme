//
//  ExerciseSuccessfullyAddedView.swift
//  Fit Me
//
//  Created by Douglas Taquary on 04/11/18.
//  Copyright © 2018 Douglas Taquary. All rights reserved.
//

import UIKit
import FitmeKit

public class ExerciseSuccessfullyAddedView: UIView {
    
    public var exercise: Exercise?
    
    let continuarButton = FitmeButton()
    
    public var didTapOkButton: (() -> Void)?
    public var didTapCloseButton: (() -> Void)?

    let viewModel = ExerciseSuccessfullViewModel()

    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        
        buildUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        buildUI()
    }
    
    private lazy var closeButton: UIButton = {
        let b = UIButton()
        
        b.heightAnchor.constraint(equalToConstant: Metrics.grid*3).isActive = true
        b.widthAnchor.constraint(equalToConstant: Metrics.grid*3).isActive = true
        b.translatesAutoresizingMaskIntoConstraints = false
        b.layer.cornerRadius = 12
        b.setImage(UIImage(named: "ic_close"), for: .normal)
        b.clipsToBounds = true
        b.addTarget(self, action: #selector(tapCloseButton), for: .touchUpInside)
        
        return b
    }()
    
    private lazy var listAllButton: UIButton = {
        let b = UIButton()
        
        b.heightAnchor.constraint(equalToConstant: Metrics.grid*6).isActive = true
        b.translatesAutoresizingMaskIntoConstraints = false
        b.layer.cornerRadius = Metrics.grid
        b.setTitleColor(.actionColor, for: .normal)
        b.clipsToBounds = true
        //b.addTarget(self, action: #selector(tapCloseButton), for: .touchUpInside)
        
        return b
    }()
    
    
    private lazy var titleLabel: UILabel = {
        let l = UILabel()
        
        l.font = UIFont.systemFont(ofSize: Metrics.addExerciseTitleFontSize, weight: Metrics.addExerciseTitleFontWeight)
        l.textColor = .exerciseTitleText
        l.numberOfLines = 1
        l.lineBreakMode = .byTruncatingTail
        l.translatesAutoresizingMaskIntoConstraints = false
        
        return l
    }()
    
    private lazy var imageView: UIImageView = {
        let v = UIImageView()
        
        v.translatesAutoresizingMaskIntoConstraints = false

        return v
    }()
    
    
    @objc public func didTapButton() {
        self.didTapOkButton?()
    }
    
    @objc private func tapCloseButton() {
        self.didTapCloseButton?()
    }
    
    
    public func buildUI() {
        backgroundColor = .background
        
        addSubview(listAllButton)
        addSubview(continuarButton)
        addSubview(closeButton)
        addSubview(imageView)
        addSubview(titleLabel)
        
        closeButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Metrics.grid*2).isActive = true
        closeButton.topAnchor.constraint(equalTo: topAnchor, constant: Metrics.grid*2).isActive = true
        
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: Metrics.grid*5)
        ])
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: Metrics.grid*2),
            imageView.heightAnchor.constraint(equalToConstant: Metrics.iconSuccessfullWidth),
            imageView.widthAnchor.constraint(equalToConstant: Metrics.iconSuccessfullHeight),
            imageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            imageView.bottomAnchor.constraint(equalTo: continuarButton.topAnchor, constant: -Metrics.grid*2)
        ])

        continuarButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            continuarButton.heightAnchor.constraint(equalToConstant: 48),
            continuarButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            continuarButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Metrics.grid*2),
            continuarButton.leadingAnchor.constraint(equalTo: trailingAnchor, constant: Metrics.grid*2),
            continuarButton.bottomAnchor.constraint(equalTo: listAllButton.topAnchor, constant: -Metrics.grid*2)
        ])

        NSLayoutConstraint.activate([
            listAllButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            listAllButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Metrics.grid*2),
            listAllButton.leadingAnchor.constraint(equalTo: trailingAnchor, constant: Metrics.grid*2),
            listAllButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -Metrics.grid*2)
        ])

        continuarButton.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)

         updateUI()
    }
    
    private func updateUI() {
        titleLabel.text = viewModel.title
        continuarButton.title = viewModel.continueButtonTitle
        imageView.image = viewModel.imageSuccessfull
        listAllButton.setAttributedTitle(viewModel.attributedButtonDefaultTitle, for: .normal)
    }
    
}
