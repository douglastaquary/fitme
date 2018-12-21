//
//  TrainingNameTableViewCell.swift
//  Fit Me
//
//  Created by Douglas Taquary on 14/10/18.
//  Copyright © 2018 Douglas Taquary. All rights reserved.
//

import UIKit


final class TrainingNameTableViewCell: UITableViewCell {
    
    private lazy var trainingNameView = TrainingNameView(frame: .zero)
    
    public var viewModel: TrainingViewModel? {
        get {
            return trainingNameView.viewModel
        }
        set {
            trainingNameView.viewModel = newValue
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
        trainingNameView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(trainingNameView)

        trainingNameView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Metrics.padding).isActive = true
        trainingNameView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -Metrics.padding).isActive = true
        trainingNameView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        trainingNameView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
    }
}
