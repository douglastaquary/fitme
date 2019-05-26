//
//  AddExerciseView.swift
//  Fit Me
//
//  Created by Douglas Taquary on 04/11/18.
//  Copyright © 2018 Douglas Taquary. All rights reserved.
//

import UIKit
import FitmeKit

public class AddExerciseView: UIView {
    
    public var exercise: Exercise?
    
    public var didTapAddButton: (() -> Void)?
    public var didTapCloseButton: (() -> Void)?
    
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
        
        b.heightAnchor.constraint(equalToConstant: Metrics.grid*3).isActive = true
        b.widthAnchor.constraint(equalToConstant: Metrics.grid*3).isActive = true
        b.translatesAutoresizingMaskIntoConstraints = false
        b.layer.cornerRadius = 12
        b.setImage(UIImage(named: "ic_close"), for: .normal)
        b.clipsToBounds = true
        b.addTarget(self, action: #selector(tapCloseButton), for: .touchUpInside)
        
        return b
    }()
    
    private lazy var titleLabel: UILabel = {
        let l = UILabel()
        
        l.font = UIFont.systemFont(ofSize: Metrics.addExerciseTitleFontSize, weight: Metrics.addExerciseTitleFontWeight)
        l.textColor = .actionColor
        l.numberOfLines = 1
        l.lineBreakMode = .byTruncatingTail
        l.translatesAutoresizingMaskIntoConstraints = false
        
        return l
    }()
    
    
    private lazy var serieTextField: UITextField = {
        let t = UITextField()
        
        t.layer.borderColor = UIColor.primaryText.cgColor
        t.layer.borderWidth = 1
        t.layer.cornerRadius = 10
        t.translatesAutoresizingMaskIntoConstraints = false
        t.font = UIFont.systemFont(ofSize: Metrics.exerciseTitleFontSize, weight: Metrics.exerciseTitleFontWeight)
        t.textColor = .primaryText
        t.placeholder = "Séries"
        t.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
        t.setLeftPaddingPoints(Metrics.grid)
        return t
    }()
    
    
    private lazy var delayTextField: UITextField = {
        let t = UITextField()
        
        t.layer.borderColor = UIColor.primaryText.cgColor
        t.layer.borderWidth = 1
        t.layer.cornerRadius = 10
        t.translatesAutoresizingMaskIntoConstraints = false
        t.font = UIFont.systemFont(ofSize: Metrics.exerciseTitleFontSize, weight: Metrics.exerciseTitleFontWeight)
        t.textColor = .primaryText
        t.placeholder = "Repetições"
        t.setLeftPaddingPoints(Metrics.grid)
        t.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
        
        return t
    }()
    
    let adicionarButton = FitmeButton()
    
    @objc private func didTapButton() {
        self.didTapAddButton?()
    }
    
    @objc private func tapCloseButton() {
        self.didTapCloseButton?()
    }
    

    public func buildUI() {
        backgroundColor = .background
        
        addSubview(closeButton)
        NSLayoutConstraint.activate([
            closeButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Metrics.grid*2),
            closeButton.topAnchor.constraint(equalTo: topAnchor, constant: Metrics.grid*2)
        ])

        addSubview(titleLabel)
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: Metrics.grid*5)
        ])

        addSubview(serieTextField)
        adicionarButton.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            serieTextField.heightAnchor.constraint(equalToConstant: 48),
            serieTextField.centerXAnchor.constraint(equalTo: centerXAnchor),
            serieTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Metrics.grid*2),
            serieTextField.leadingAnchor.constraint(equalTo: trailingAnchor, constant: Metrics.grid*2),
            serieTextField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: Metrics.grid*2)
        ])
        
        addSubview(delayTextField)
        delayTextField.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            delayTextField.heightAnchor.constraint(equalToConstant: 48),
            delayTextField.centerXAnchor.constraint(equalTo: centerXAnchor),
            delayTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Metrics.grid*2),
            delayTextField.leadingAnchor.constraint(equalTo: trailingAnchor, constant: Metrics.grid*2),
            delayTextField.topAnchor.constraint(equalTo: serieTextField.bottomAnchor, constant: Metrics.grid*2)
        ])

        addSubview(adicionarButton)
        adicionarButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            adicionarButton.heightAnchor.constraint(equalToConstant: 48),
            adicionarButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            adicionarButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Metrics.grid*2),
            adicionarButton.leadingAnchor.constraint(equalTo: trailingAnchor, constant: Metrics.grid*2),
            adicionarButton.topAnchor.constraint(equalTo: delayTextField.bottomAnchor, constant: Metrics.grid*2)
        ])
        
        adicionarButton.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)

        updateUI()
    }
    
    private func updateUI() {
        titleLabel.text = "Bíceps"//viewModel?.exerciseTitle
        adicionarButton.title = "Adicionar"
    }
    
    @objc func textDidChange(_ textField:UITextField) {
        
        print ("TextField did changed")
    }
    
}
