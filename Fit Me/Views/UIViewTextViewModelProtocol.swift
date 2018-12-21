//
//  UIViewTextViewModelProtocol.swift
//  Fit Me
//
//  Created by Douglas Taquary on 21/10/18.
//  Copyright © 2018 Douglas Taquary. All rights reserved.
//

import UIKit

public protocol UIViewTextViewModelProtocol {
    var color: UIColor? { get }
    var text: NSAttributedString? { get }
}

public class UIViewTextView: UIView {
    
    struct EmptyViewModel: UIViewTextViewModelProtocol {
        let color: UIColor? = .background
        let text: NSAttributedString? = NSAttributedString()
    }
    
    let circle: UIView = {
        let v = UIView()
        
        v.layer.cornerRadius = Metrics.grid*3
        v.layer.masksToBounds = true
        v.contentMode = .center
        v.backgroundColor = .actionColor
        v.setContentHuggingPriority(.required, for: .horizontal)
        
        return v
    }()
    
    let textLabel: UILabel = {
        let l = UILabel()
        
        l.font = UIFont.systemFont(ofSize: Metrics.addTrainingSectionTitleFontSize, weight: Metrics.addTrainingSectionTitleFontWeight)
        l.textColor = .primaryText
        l.numberOfLines = 1
        l.lineBreakMode = .byTruncatingTail
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
        
    }()
    
    public var viewModel: UIViewTextViewModelProtocol {
        didSet {
            update()
        }
    }
    
    override public init(frame: CGRect) {
        viewModel = EmptyViewModel()
        super.init(frame: frame)
        setUp()
        update()
    }
    
    @available(*, unavailable)
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUp() {
        let contentView = self
        
        let stackView = UIStackView()
        stackView.spacing = Metrics.grid
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(stackView)
        
        contentView.heightAnchor.constraint(equalToConstant: Metrics.tagCircleColorSize)
        contentView.widthAnchor.constraint(equalToConstant: Metrics.tagCircleColorSize)
        
        stackView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        stackView.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
        stackView.rightAnchor.constraint(equalTo: contentView.rightAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        
        circle.addSubview(textLabel)
        
        textLabel.centerXAnchor.constraint(equalTo: circle.centerXAnchor).isActive = true
        textLabel.centerYAnchor.constraint(equalTo: circle.centerYAnchor).isActive = true
        
        stackView.addArrangedSubview(circle)
    }
    
    func update() {
        let circleColor = viewModel.color
        circle.isHidden = circleColor == nil
        
        let text = viewModel.text
        textLabel.attributedText = text
        textLabel.isHidden = text == nil
    }
    
}
