//
//  CategoryView.swift
//  Fit Me
//
//  Created by Douglas Taquary on 07/10/18.
//  Copyright © 2018 Douglas Taquary. All rights reserved.
//

import UIKit

protocol CategorySectionViewDelegate: class {
    func toggleSection(header: CategoryView, section: Int)
}

public class CategoryView: UIView {
    
    public var didTapCategory: (() -> Void)?
    
    var section: Int = 0
    
    public var viewModel: TrainingViewModel? {
        didSet {
            buildUI()
        }
    }
    
    var item: CategoryViewModelItem? {
        didSet {
            guard let item = item else {
                return
            }
            
            categoryLabel.text = item.sectionTitle
            setCollapsed(collapsed: item.isCollapsed)
        }
    }
    
    weak var delegate: CategorySectionViewDelegate?

    public override init(frame: CGRect) {
        super.init(frame: frame)

        addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(didTapHeader)))
        
        buildUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        buildUI()
    }
    
    public lazy var arrowImageView: UIImageView = {
        let i = UIImageView()
        
        i.translatesAutoresizingMaskIntoConstraints =  false
        i.layer.cornerRadius = bounds.size.height/2
        i.image = UIImage(named: "chevron")
        i.heightAnchor.constraint(equalToConstant: Metrics.arrowImageHeight)
        
        return i
    }()
    
    public lazy var categoryLabel: UILabel = {
        let l = UILabel()
        
        l.font = UIFont.systemFont(ofSize: Metrics.categoryTitleFontSize, weight: Metrics.categoryDescriptionFontWeight)
        l.textColor = .primaryText
        l.numberOfLines = 1
        l.lineBreakMode = .byTruncatingTail
        l.translatesAutoresizingMaskIntoConstraints = false
        
        return l
    }()
    
    @objc private func didTapHeader() {
        delegate?.toggleSection(header: self, section: section)
    }
    
    public func setupView(categoria: String) {
        categoryLabel.text = categoria
    }
    
    func setCollapsed(collapsed: Bool) {
        self.arrowImageView.rotate(collapsed ? 0.0 : .pi)
    }
    
    private func buildUI() {
        let contentView = self
        
        self.backgroundColor = .background
        
        addSubview(arrowImageView)
        addSubview(categoryLabel)
        
        self.heightAnchor.constraint(equalToConstant: Metrics.sectionHeaderHeight).isActive = true
        
        arrowImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -Metrics.padding).isActive = true
        arrowImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        
        categoryLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Metrics.padding*3).isActive = true
        categoryLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -Metrics.padding).isActive = true
        
        self.arrowImageView.transform = self.arrowImageView.transform.rotated(by: CGFloat(Double.pi / 2))
    }
    
    private func didTapSection() {
        didTapCategory?()
        UIView.animate(withDuration: 0.3, animations: {
            self.arrowImageView.transform = CGAffineTransform(rotationAngle: .pi*2)
        })
    }
    
    
    @objc private func tapped(_ sender: UITapGestureRecognizer) {
        didTapSection()
    }
    
    // MARK: - Selection animation
    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        didTapSection()
        compress()
    }
    
    public override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        
        expand { print("didTap") }
    }
    
    public override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesCancelled(touches, with: event)
        
        expand { print("didTap") }
    }
    

    

}

