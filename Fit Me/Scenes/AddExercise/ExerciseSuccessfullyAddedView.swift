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

    
    public var viewModel: TrainingViewModel? {
        didSet {
            buildUI()
            updateUI()
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
    
    private lazy var imageView: UIImageView = {
        let v = UIImageView()
        
        v.image = UIImage(named: "ic_chevron")
        v.translatesAutoresizingMaskIntoConstraints = false
        
        return v
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
    
    
    @objc public func didTapButton() {
        self.didTapOkButton?()
    }
    
    @objc private func tapCloseButton() {
        self.didTapCloseButton?()
    }
    
    
    public func buildUI() {
        backgroundColor = .background
        
        addSubview(continuarButton)
        continuarButton.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(closeButton)
        closeButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Metrics.grid*2).isActive = true
        closeButton.topAnchor.constraint(equalTo: topAnchor, constant: Metrics.grid*2).isActive = true
        
        addSubview(titleLabel)
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: Metrics.grid*5)
        ])
        
        addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.heightAnchor.constraint(equalToConstant: Metrics.iconSuccessfullWidth),
            imageView.widthAnchor.constraint(equalToConstant: Metrics.iconSuccessfullHeight),
            imageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            imageView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: Metrics.grid*2),
            imageView.bottomAnchor.constraint(equalTo: continuarButton.topAnchor, constant: Metrics.grid*2)
        ])

        NSLayoutConstraint.activate([
            continuarButton.heightAnchor.constraint(equalToConstant: 48),
            continuarButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            continuarButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Metrics.grid*2),
            continuarButton.leadingAnchor.constraint(equalTo: trailingAnchor, constant: Metrics.grid*2),
            //continuarButton.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: Metrics.grid*2)
        ])

        continuarButton.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)

         updateUI()
    }
    
    private func updateUI() {
        titleLabel.text = "Exercício Adicionado"//viewModel?.exerciseTitle
        continuarButton.title = "Continuar" //setAttributedTitle(viewModel?.attributedButtonTitle, for: .normal)
        imageView.image = viewModel?.image
    }
    
}
