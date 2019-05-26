//
//  ExerciseListViewCell.swift
//  Fit Me
//
//  Created by Santander on 20/05/19.
//  Copyright © 2019 Douglas Taquary. All rights reserved.
//
import UIKit
import FitmeKit

public final class ExerciseListViewCell: UITableViewCell {
    
    private lazy var exerciseListView = ExerciseListView(frame: .zero)
    
    public var viewModel: ExerciseListViewModel? {
        get {
            return exerciseListView.viewModel
        }
        set {
            exerciseListView.viewModel = newValue
        }
    }
    
    public var didUncheck: (() -> Void)? {
        get {
            return exerciseListView.didUncheck
        }
        set {
            exerciseListView.didUncheck = newValue
        }
    }
    
    public var didChecked: (() -> Void)? {
        get {
            return exerciseListView.didChecked
        }
        set {
            exerciseListView.didChecked = newValue
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
        exerciseListView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(exerciseListView)
        
        NSLayoutConstraint.activate([
            exerciseListView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Metrics.padding*2),
            exerciseListView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -Metrics.padding*2),
            exerciseListView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: Metrics.padding),
            exerciseListView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -Metrics.padding)
        ])

    }
    
}

