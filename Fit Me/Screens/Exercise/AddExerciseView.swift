//
//  AddExerciseView.swift
//  Fit Me
//
//  Created by Douglas Taquary on 04/11/18.
//  Copyright © 2018 Douglas Taquary. All rights reserved.
//

import UIKit

public class AddExerciseView: UIView {
    
    public var exercise: Exercise?
    
    var didTapAddButton: (() -> Void)?
    
    public var viewModel: TrainingViewModel? {
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
    
    private lazy var closeButton: UIButton = {
        let b = UIButton()
        
        b.heightAnchor.constraint(equalToConstant: Metrics.grid*2).isActive = true
        b.widthAnchor.constraint(equalToConstant: Metrics.grid*2).isActive = true
        b.translatesAutoresizingMaskIntoConstraints = false
        
        return b
    }()
    
    private lazy var titleLabel: UILabel = {
        let l = UILabel()
        
        l.font = UIFont.systemFont(ofSize: Metrics.addExerciseTitleFontSize, weight: Metrics.addExerciseTitleFontWeight)
        l.numberOfLines = 0
        l.translatesAutoresizingMaskIntoConstraints = true
        l.lineBreakMode = .byWordWrapping
        
        return l
    }()
    
    private lazy var adicionarButton: FitmeButton = {
        let b = FitmeButton()
        
        b.heightAnchor.constraint(equalToConstant: Metrics.buttonHeight).isActive = true
        b.translatesAutoresizingMaskIntoConstraints = false
        b.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        
        return b
    }()
    
    private lazy var serieTextField: UITextField = {
        let t = UITextField()
        
        t.layer.borderColor = UIColor.primaryText.cgColor
        t.layer.borderWidth = 1
        t.layer.cornerRadius = 10
        t.translatesAutoresizingMaskIntoConstraints =  false
        t.font = UIFont.systemFont(ofSize: Metrics.exerciseTitleFontSize, weight: Metrics.exerciseTitleFontWeight)
        t.textColor = .primaryText
        t.placeholder = "Séries"
        //t.addTarget(self, action: #selector(textFieldDidChanged), for: .editingChanged)
        
        return t
    }()
    
    private lazy var delayTextField: UITextField = {
        let t = UITextField()
        
        t.layer.borderColor = UIColor.primaryText.cgColor
        t.layer.borderWidth = 1
        t.layer.cornerRadius = 10
        t.translatesAutoresizingMaskIntoConstraints =  false
        t.font = UIFont.systemFont(ofSize: Metrics.exerciseTitleFontSize, weight: Metrics.exerciseTitleFontWeight)
        t.textColor = .primaryText
        t.placeholder = "Repetições"
        //t.addTarget(self, action: #selector(textFieldDidChanged), for: .editingChanged)
        
        return t
    }()
    
    @objc public func didTapButton() {
        self.didTapAddButton?()
    }
    

    public func buildUI() {
        backgroundColor = .background

        addSubview(closeButton)
        closeButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Metrics.grid*2).isActive = true
        closeButton.topAnchor.constraint(equalTo: topAnchor, constant: Metrics.grid*2).isActive = true
        
        addSubview(titleLabel)
        titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: Metrics.grid*5).isActive = true
        
        addSubview(serieTextField)
        serieTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Metrics.grid*2).isActive = true
        serieTextField.leadingAnchor.constraint(equalTo: trailingAnchor, constant: Metrics.grid*2).isActive = true
        serieTextField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: Metrics.grid*2).isActive = true

        addSubview(delayTextField)
        delayTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Metrics.grid*2).isActive = true
        delayTextField.leadingAnchor.constraint(equalTo: trailingAnchor, constant: Metrics.grid*2).isActive = true
        delayTextField.topAnchor.constraint(equalTo: serieTextField.bottomAnchor, constant: Metrics.grid).isActive = true

        addSubview(adicionarButton)
        adicionarButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Metrics.grid*2).isActive = true
        adicionarButton.leadingAnchor.constraint(equalTo: trailingAnchor, constant: Metrics.grid*2).isActive = true
        adicionarButton.topAnchor.constraint(equalTo: delayTextField.bottomAnchor, constant: Metrics.grid*2).isActive = true
        adicionarButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -Metrics.grid*2).isActive = true

        updateUI()
    }
    
    private func updateUI() {
        titleLabel.text = viewModel?.exerciseTitle
        adicionarButton.setAttributedTitle(viewModel?.attributedButtonTitle, for: .normal)
    }
    
}
