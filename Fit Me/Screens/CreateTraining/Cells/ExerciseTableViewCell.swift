//
//  ExerciseTableViewCell.swift
//  Fit Me
//
//  Created by Douglas Taquary on 07/10/18.
//  Copyright © 2018 Douglas Taquary. All rights reserved.
//

import UIKit

final class ExerciseTableViewCell: UITableViewCell {
    
    public lazy var exerciseView = ExerciseView(frame: .zero)
    
    public var viewModel: TrainingViewModel? {
        get {
            return exerciseView.viewModel
        }
        set {
            exerciseView.viewModel = newValue
        }
    }
    
    public var didTapCategory: (() -> Void)? {
        get {
            return exerciseView.didTapExercise
        }
        set {
            exerciseView.didTapExercise = newValue
        }
    }
    
    public override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        buildUI()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        buildUI()
    }
    
    private func buildUI() {
        exerciseView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(exerciseView)
        
        exerciseView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        exerciseView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        exerciseView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        exerciseView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
    }
}
