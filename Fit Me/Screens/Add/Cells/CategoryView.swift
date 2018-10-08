//
//  CategoryView.swift
//  Fit Me
//
//  Created by Douglas Taquary on 07/10/18.
//  Copyright © 2018 Douglas Taquary. All rights reserved.
//

import UIKit


public class CategoryView: UIView {
    
    public var didTapCategory: (() -> Void)?
    
    public var viewModel: AddViewModel? {
        didSet {
            buildUI()
        }
    }
    
    private lazy var arrowImageView: UIImageView = {
        let i = UIImageView()
        
        i.translatesAutoresizingMaskIntoConstraints =  false
        i.layer.cornerRadius = bounds.size.height/2
        i.heightAnchor.constraint(equalToConstant: Metrics.arrowImageHeight)
        
        return i
    }()
    
    private lazy var categoryLabel: UILabel = {
        let l = UILabel()
        
        l.font = UIFont.systemFont(ofSize: Metrics.categoryTitleFontSize, weight: Metrics.categoryDescriptionFontWeight)
        l.textColor = .primaryText
        l.numberOfLines = 1
        l.lineBreakMode = .byTruncatingTail
        l.translatesAutoresizingMaskIntoConstraints = false
        
        return l
    }()
    
    private func buildUI() {
        let contentView = self
        
        self.backgroundColor = .background
        
        addSubview(arrowImageView)
        addSubview(categoryLabel)
        
        arrowImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -Metrics.padding).isActive = true
        arrowImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        
        categoryLabel.leadingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        categoryLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
    }
    
    private func didTapSection() {
        didTapCategory?()
        UIView.animate(withDuration: 0.3, animations: {
            self.arrowImageView.transform = self.arrowImageView.transform.rotated(by: CGFloat(Double.pi / 2))
        })
    }
    
    
    @objc private func tapped(_ sender: UITapGestureRecognizer) {
        didTapSection()
    }
    
    // MARK: - Selection animation
    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        
        compress()
    }
    
    public override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        
        expand()
    }
    
    public override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesCancelled(touches, with: event)
        
        expand()
    }
    
    private func compress() {
        UIView.animate(withDuration: 0.24, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 2, options: [.allowUserInteraction, .beginFromCurrentState], animations: {
            self.layer.transform = CATransform3DMakeScale(0.96, 0.96, 1)
        }, completion: nil)
    }
    
    private func expand() {
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 2, options: [.allowUserInteraction, .beginFromCurrentState], animations: {
            self.layer.transform = CATransform3DIdentity
        }, completion: nil)
    }
    

}

