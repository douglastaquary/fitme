//
//  TrainingNameView.swift
//  Fit Me
//
//  Created by Douglas Taquary on 14/10/18.
//  Copyright © 2018 Douglas Taquary. All rights reserved.
//


import UIKit


public class TrainingNameView: UIView {

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
    
    var valueCompletion: ((String?) -> Void)?
    
    private lazy var nameTextField: UITextField = {
        let t = UITextField()
        
        //t.heightAnchor.constraint(equalToConstant: Metrics.textFieldHeight)
        t.translatesAutoresizingMaskIntoConstraints =  false
        t.font = UIFont.systemFont(ofSize: Metrics.exerciseTitleFontSize, weight: Metrics.exerciseTitleFontWeight)
        t.textColor = .primaryText
        t.placeholder = "Nome do seu treino"
        t.addTarget(self, action: #selector(textFieldDidChanged), for: .editingChanged)
        
        return t
    }()
    
    
    private func buildUI() {
        self.backgroundColor = .background
        
        addSubview(nameTextField)
        nameTextField.heightAnchor.constraint(equalToConstant: Metrics.textFieldHeight).isActive = true
        
        nameTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Metrics.padding*2).isActive = true
        nameTextField.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        nameTextField.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        nameTextField.topAnchor.constraint(equalTo: topAnchor).isActive = true
    }
    
    @objc func textFieldDidChanged(_ textField: UITextField) {
        self.valueCompletion?(textField.text)
    }
    
}
