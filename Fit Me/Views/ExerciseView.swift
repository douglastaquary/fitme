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
    
    private lazy var checkImageView: UIImageView = {
        let i = UIImageView()
        
        i.translatesAutoresizingMaskIntoConstraints =  false
        i.heightAnchor.constraint(equalToConstant: Metrics.checkImageHeight).isActive = true
        i.widthAnchor.constraint(equalToConstant: Metrics.checkImageHeight).isActive = true
        i.image = UIImage(named: "empty_circle")
        
        return i
    }()
    
    public lazy var exerciseLabel: UILabel = {
        let l = UILabel()
        
        l.font = UIFont.systemFont(ofSize: Metrics.exerciseTitleFontSize, weight: Metrics.exerciseTitleFontWeight)
        l.textColor = .secondaryText
        l.numberOfLines = 1
        l.lineBreakMode = .byTruncatingTail
        l.translatesAutoresizingMaskIntoConstraints = false
        
        return l
    }()
    
    private func buildUI() {
        self.backgroundColor = .background
        
        addSubview(checkImageView)
        addSubview(exerciseLabel)
        
        self.heightAnchor.constraint(equalToConstant: Metrics.sectionHeaderHeight).isActive = true

        checkImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Metrics.padding*2).isActive = true
        checkImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
        exerciseLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Metrics.padding*3).isActive = true
        exerciseLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(tapped))
        addGestureRecognizer(tap)
    }
    
    @objc private func tapped(_ sender: UITapGestureRecognizer) {
        didTapExercise?()
    }
    
    // MARK: - Selection animation
    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        
        compress()
    }
    
    public override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        
        expand { print("didTap") }
    }
    
    public override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesCancelled(touches, with: event)
        
        expand { print("didTap") }
    }
    
}

