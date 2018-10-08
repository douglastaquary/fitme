//
//  ExerciseView.swift
//  Fit Me
//
//  Created by Douglas Taquary on 07/10/18.
//  Copyright © 2018 Douglas Taquary. All rights reserved.
//

import UIKit


public class ExerciseView: UIView {
    
    public var didTapExercise: (() -> Void)?
    
    public var viewModel: AddViewModel? {
        didSet {
            buildUI()
        }
    }
    
    private lazy var checkImageView: UIImageView = {
        let i = UIImageView()
        
        i.translatesAutoresizingMaskIntoConstraints =  false
        i.layer.cornerRadius = bounds.size.height/2
        i.heightAnchor.constraint(equalToConstant: Metrics.checkImageHeight)
        
        return i
    }()
    
    private lazy var exerciseLabel: UILabel = {
        let l = UILabel()
        
        l.font = UIFont.systemFont(ofSize: Metrics.exerciseTitleFontSize, weight: Metrics.exerciseTitleFontWeight)
        l.textColor = .primaryText
        l.numberOfLines = 1
        l.layer.opacity = 0.5
        l.lineBreakMode = .byTruncatingTail
        l.translatesAutoresizingMaskIntoConstraints = false
        
        return l
    }()
    
    private func buildUI() {
        let contentView = self
        
        self.backgroundColor = .background
        
        addSubview(checkImageView)
        addSubview(exerciseLabel)
        
        checkImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -Metrics.padding).isActive = true
        checkImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        
        exerciseLabel.leadingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        exerciseLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
    }
    
    private func didTap() {
        didTapExercise?()
//        UIView.animate(withDuration: 0.3, animations: {
//            self.arrowImageView.transform = self.arrowImageView.transform.rotated(by: CGFloat(Double.pi / 2))
//        })
    }
    
    
    @objc private func tapped(_ sender: UITapGestureRecognizer) {
        didTap()
    }
    
    // MARK: - Selection animation
    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        
        compress()
    }
    
    public override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        
        expand()
    }
    
    public override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesCancelled(touches, with: event)
        
        expand()
    }
    
    private func compress() {
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

