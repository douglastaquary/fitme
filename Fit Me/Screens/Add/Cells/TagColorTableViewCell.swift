//
//  RoundTableViewCell.swift
//  Fit Me
//
//  Created by Douglas Taquary on 07/10/18.
//  Copyright © 2018 Douglas Taquary. All rights reserved.
//

import UIKit

final class RoundTableViewCell: UITableViewCell {
    
    private lazy var tagView = TagColorView(frame: .zero)
    
    public var viewModel: AddViewModel? {
        get {
            return tagView.viewModel
        }
        set {
            tagView.viewModel = newValue
        }
    }
    
    public var didTapTag: (() -> Void)? {
        get {
            return tagView.didTapTag
        }
        set {
            tagView.didTapTag = newValue
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
        tagView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(tagView)
        
        tagView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Metrics.padding).isActive = true
        tagView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -Metrics.padding).isActive = true
        tagView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: Metrics.padding).isActive = true
        tagView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -Metrics.padding).isActive = true
    }
}
