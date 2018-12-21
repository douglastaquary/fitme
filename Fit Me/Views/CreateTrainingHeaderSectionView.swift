//
//  AddSectionView.swift
//  Fit Me
//
//  Created by Douglas Taquary on 14/10/18.
//  Copyright © 2018 Douglas Taquary. All rights reserved.
//

import UIKit


public class CreateTrainingHeaderSectionView: UIView {
    
    public var viewModel: DayViewModel? {
        didSet {
            buildUI()
        }
    }
    
    var section: Int = 0
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
            
        buildUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var topLineView: UIView = {
        let v = UIView()
        
        v.translatesAutoresizingMaskIntoConstraints = false
        v.heightAnchor.constraint(equalToConstant: 1).isActive = true
        v.tintColor = .secondaryText
        
        return v
    }()
    
    private lazy var bottomLineView: UIView = {
        let v = UIView()
        
        v.translatesAutoresizingMaskIntoConstraints = false
        v.heightAnchor.constraint(equalToConstant: 1).isActive = true
        v.tintColor = .secondaryText
        
        return v
    }()
    
    
    public lazy var sectionLabel: UILabel = {
        let l = UILabel()
        
        l.font = UIFont.systemFont(ofSize: Metrics.addTrainingSectionTitleFontSize, weight: Metrics.addTrainingSectionTitleFontWeight)
        l.textColor = .primaryText
        l.numberOfLines = 1
        l.lineBreakMode = .byTruncatingTail
        l.translatesAutoresizingMaskIntoConstraints = false
        
        return l
    }()
    
    
    private func buildUI() {
        self.backgroundColor = .background
        addSubview(sectionLabel)
        addSubview(topLineView)
        addSubview(bottomLineView)
        
        topLineView.topAnchor.constraint(equalTo: topAnchor, constant: 1).isActive = true
        topLineView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        topLineView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        
        bottomLineView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
        bottomLineView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        bottomLineView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        
        sectionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Metrics.padding*3).isActive = true
        sectionLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -Metrics.padding).isActive = true
    }
}


