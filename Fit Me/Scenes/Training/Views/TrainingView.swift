//
//  TrainingView.swift
//  Fit Me
//
//  Created by Santander on 19/05/19.
//  Copyright © 2019 Douglas Taquary. All rights reserved.
//
import UIKit
import FitmeKit

public class TrainingView: UIView {
    
    public var didReceiveTap: (() -> Void)?
    
    public var viewModel: TrainingViewModel? {
        didSet {
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
    

    
    private lazy var titleLabel: UILabel = {
        let l = UILabel()
        
        l.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        l.textColor = .background
        l.numberOfLines = 1
        l.lineBreakMode = .byTruncatingTail
        l.translatesAutoresizingMaskIntoConstraints = false
        
        return l
    }()
    
    
    private lazy var subtitleLabel: UILabel = {
        let l = UILabel()
        
        l.numberOfLines = 1
        l.textColor = .background
        l.font = UIFont.systemFont(ofSize: 24, weight: .regular)
        l.lineBreakMode = .byWordWrapping
        l.translatesAutoresizingMaskIntoConstraints = false
        l.setContentCompressionResistancePriority(.required, for: .vertical)
        
        return l
    }()
    
    private func buildUI() {
        addSubview(titleLabel)
        addSubview(subtitleLabel)
        
        backgroundColor = UIColor(red:0.11, green:0.66, blue:0.54, alpha:1)
        
        titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true
        titleLabel.topAnchor.constraint(equalTo: topAnchor, constant:  16).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -32).isActive = true
        
        subtitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true
        subtitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -32).isActive = true
        subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8).isActive = true
        subtitleLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -24).isActive = true
        
        layer.cornerRadius = 10
        
        heightAnchor.constraint(equalToConstant: 88).isActive = true
        
        //setupBackgroundColor()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(tapped))
        addGestureRecognizer(tap)
    }
    
    @objc private func tapped(_ sender: UITapGestureRecognizer) {
        didReceiveTap?()
    }
    
    private func setupBackgroundColor() {

        //let layer = UIView(frame: CGRect(x: 20, y: 285, width: 336, height: 88))
        //layer.cornerRadius = 10
        let gradient = CAGradientLayer()
        gradient.frame = CGRect(x: 0, y: 0, width: 336, height: 88)
        gradient.colors = [
//            UIColor(red:0.11, green:0.66, blue:0.54, alpha:1).cgColor,
            UIColor(red:0.24, green:0.83, blue:0.75, alpha:1).cgColor
        ]
        gradient.locations = [0, 1]
        gradient.startPoint = CGPoint(x: 0, y: 0.5)
        gradient.endPoint = CGPoint(x: 1, y: 0.5)
        gradient.cornerRadius = 10
        layer.addSublayer(gradient)
        //addSubview(layer)
    }
    
    private func updateUI() {
        guard let viewModel = viewModel else { return }
        
        titleLabel.text = viewModel.title

        let arrayGroupName = viewModel.exercisesGroup.map { $0.name }
        let arrayOfNames = arrayGroupName.map { String($0) }
        let subtitleArray = arrayOfNames.joined(separator: ", ")
        subtitleLabel.attributedText = NSAttributedString(string: subtitleArray)
    }
    
    // MARK: - Selection animation
    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        
        press()
    }
    
    public override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        
        expand()
    }
    
    public override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesCancelled(touches, with: event)
        
        expand()
    }
    
    private func press() {
        UIView.animate(withDuration: 0.24, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 2, options: [.allowUserInteraction, .beginFromCurrentState], animations: {
            self.layer.transform = CATransform3DMakeScale(0.96, 0.96, 1)
        }, completion: nil)
    }
    
    private func expand() {
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 2, options: [.allowUserInteraction, .beginFromCurrentState], animations: {
            self.layer.transform = CATransform3DIdentity
        }, completion: nil)
    }
    
}

