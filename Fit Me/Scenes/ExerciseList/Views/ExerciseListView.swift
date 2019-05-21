//
//  ExerciseListView.swift
//  Fit Me
//
//  Created by Santander on 20/05/19.
//  Copyright © 2019 Douglas Taquary. All rights reserved.
//

import UIKit
import FitmeKit

public class ExerciseListView: UIView {
    
    public var didReceiveTap: (() -> Void)?
    
    public var viewModel: ExerciseListViewModel? {
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
        
        l.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        l.textColor = .success
        l.numberOfLines = 1
        l.lineBreakMode = .byTruncatingTail
        l.translatesAutoresizingMaskIntoConstraints = false
        
        return l
    }()
    
    
    private lazy var subtitleLabel: UILabel = {
        let l = UILabel()
        
        l.numberOfLines = 1
        l.lineBreakMode = .byWordWrapping
        l.translatesAutoresizingMaskIntoConstraints = false
        l.setContentCompressionResistancePriority(.required, for: .vertical)
        
        return l
    }()
    
    private lazy var serieTimes: UILabel = {
        let l = UILabel()
        
        l.numberOfLines = 1
        l.lineBreakMode = .byWordWrapping
        l.translatesAutoresizingMaskIntoConstraints = false
        l.setContentCompressionResistancePriority(.required, for: .vertical)
        
        return l
    }()
    
    private lazy var checkImageView: UIImageView = {
        let i = UIImageView()
        
        i.translatesAutoresizingMaskIntoConstraints =  false
        i.heightAnchor.constraint(equalToConstant: Metrics.checkImageHeight).isActive = true
        i.widthAnchor.constraint(equalToConstant: Metrics.checkImageHeight).isActive = true
        i.image = UIImage(named: "empty_circle")
        
        return i
    }()
    
    private lazy var lineBottomView: UIView = {
        let v = UIView()
        
        v.translatesAutoresizingMaskIntoConstraints =  false
        v.heightAnchor.constraint(equalToConstant: 1).isActive = true
        v.backgroundColor = UIColor(red:0.85, green:0.85, blue:0.85, alpha:1)
        
        return v
    }()
    
    private func buildUI() {
        addSubview(titleLabel)
        addSubview(subtitleLabel)
        addSubview(serieTimes)
        addSubview(checkImageView)
        addSubview(lineBottomView)
        
        backgroundColor = .background
        
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant:  16),
            titleLabel.trailingAnchor.constraint(equalTo: serieTimes.leadingAnchor, constant: -4),
            titleLabel.widthAnchor.constraint(equalToConstant: 100),
            
            subtitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            subtitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -32),
            subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 4),
            subtitleLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -24),
            
            serieTimes.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor),
            serieTimes.leadingAnchor.constraint(equalTo: titleLabel.trailingAnchor, constant: 24),
            serieTimes.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -32),

            
            lineBottomView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
            lineBottomView.trailingAnchor.constraint(equalTo: trailingAnchor, constant:  -16),
            lineBottomView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            
            checkImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Metrics.padding*2),
            checkImageView.centerYAnchor.constraint(equalTo: subtitleLabel.centerYAnchor)
        ])
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(tapped))
        addGestureRecognizer(tap)
    }
    
    @objc private func tapped(_ sender: UITapGestureRecognizer) {
        didReceiveTap?()
    }
    
    private func updateUI() {
        guard let viewModel = viewModel else { return }
        
        titleLabel.text = "Exercício"
//        let arrayGroupName = viewModel.exercisesGroup.map { $0.name }
//        let arrayOfNames = arrayGroupName.map { String($0) }
//        let subtitleArray = arrayOfNames.joined(separator: ", ")
        subtitleLabel.attributedText = viewModel.attributedsubtitle
        serieTimes.attributedText = viewModel.attributedDelaySeries
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

