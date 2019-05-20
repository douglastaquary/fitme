//
//  TrainingViewCell.swift
//  Fit Me
//
//  Created by Santander on 19/05/19.
//  Copyright © 2019 Douglas Taquary. All rights reserved.
//

import UIKit
import FitmeKit

public final class TrainingViewCell: UITableViewCell {
    
    private lazy var trainingView = TrainingView(frame: .zero)
    
    public var viewModel: TrainingViewModel? {
        get {
            return trainingView.viewModel
        }
        set {
            trainingView.viewModel = newValue
        }
    }
    
    public var didReceiveTap: (() -> Void)? {
        get {
            return trainingView.didReceiveTap
        }
        set {
            trainingView.didReceiveTap = newValue
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
        trainingView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(trainingView)
        
        contentView.heightAnchor.constraint(equalToConstant: 88).isActive = true

        trainingView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Metrics.padding*2).isActive = true
        trainingView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -Metrics.padding*2).isActive = true
        trainingView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: Metrics.padding).isActive = true
        trainingView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -Metrics.padding).isActive = true
    }
    
}
