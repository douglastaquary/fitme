//
//  CategoryTableViewCell.swift
//  Fit Me
//
//  Created by Douglas Taquary on 07/10/18.
//  Copyright © 2018 Douglas Taquary. All rights reserved.
//

import UIKit

final class CategoryTableViewCell: UITableViewCell {
    
    public lazy var categoryView = CategoryView(frame: .zero)
    
    public var viewModel: TrainingViewModel? {
        get {
            return categoryView.viewModel
        }
        set {
            categoryView.viewModel = newValue
        }
    }
    
    public var didTapCategory: (() -> Void)? {
        get {
            return categoryView.didTapCategory
        }
        set {
            categoryView.didTapCategory = newValue
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
        categoryView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(categoryView)
        
        categoryView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Metrics.padding*3).isActive = true
        categoryView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -Metrics.padding).isActive = true
        categoryView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: Metrics.padding).isActive = true
        categoryView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -Metrics.padding).isActive = true
    }
}
