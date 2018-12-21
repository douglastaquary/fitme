//
// TagColorTableViewCell.swift
//  Fit Me
//
//  Created by Douglas Taquary on 07/10/18.
//  Copyright © 2018 Douglas Taquary. All rights reserved.
//

import UIKit

final class TagColorTableViewCell: UITableViewCell {
    
    public lazy var tagListView = TagView()
    
//    public var viewModel: TagViewModel? {
//        get {
//            return tagListView.viewModel
//        }
//        set {
//            tagListView.viewModel = newValue
//        }
//    }
//
//    public var didTapTag: (() -> Void)? {
//        get {
//            return tagListView. .didTapTag
//        }
//        set {
//            tagListView.didTapTag = newValue
//        }
//    }
    
    private lazy var topLineView: UIView = {
        let v = UIView()
        
        v.translatesAutoresizingMaskIntoConstraints = false
        v.heightAnchor.constraint(equalToConstant: 1).isActive = true
        v.tintColor = .secondaryText
        v.layer.opacity = 0.7
        
        return v
    }()
    
    private lazy var bottomLineView: UIView = {
        let v = UIView()
        
        v.translatesAutoresizingMaskIntoConstraints = false
        v.heightAnchor.constraint(equalToConstant: 1).isActive = true
        v.tintColor = .secondaryText
        v.layer.opacity = 0.7
        
        return v
    }()
    
    public override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        buildUI()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        buildUI()
    }
    
    private func buildUI() {
        tagListView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(tagListView)
        
        tagListView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Metrics.grid*2).isActive = true
        tagListView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -Metrics.grid*2).isActive = true
        tagListView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        tagListView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
    }
}
