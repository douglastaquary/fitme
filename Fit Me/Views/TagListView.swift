//
//  TagListView.swift
//  Fit Me
//
//  Created by Douglas Taquary on 14/10/18.
//  Copyright © 2018 Douglas Taquary. All rights reserved.
//

import UIKit

public class TagListView: UIView {
    
    public var viewModel: TagViewModelProtocol = TagViewModel() {
        didSet {
            update()
        }
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        buildUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        buildUI()
    }
    
    private lazy var contentStack: UIStackView = {
        let v = UIStackView()
        v.axis = .horizontal
        v.spacing = Metrics.grid
        v.translatesAutoresizingMaskIntoConstraints = false
        
        return v
    }()
    
    private lazy var scrollView: UIScrollView = {
        let v = UIScrollView()
        
        v.alwaysBounceHorizontal = true
        v.translatesAutoresizingMaskIntoConstraints = false
        
        return v
    }()
    
    
    private func buildUI() {
        addSubview(scrollView)
        
        backgroundColor = .background
        
        heightAnchor.constraint(equalToConstant: Metrics.cellHeight).isActive = true
        
        scrollView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        scrollView.addSubview(contentStack)
        contentStack.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 1).isActive = true
        contentStack.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 1).isActive = true
        
        update()
    }
}
    
   
extension TagListView {
    func update(){
        
        var oldViews = contentStack.arrangedSubviews as? [UIViewTextView]
        oldViews?.forEach { $0.removeFromSuperview() }
        
        let newViews = viewModel.tags.map { viewModel -> UIView in
            let view = oldViews?.popLast() ?? UIViewTextView()
            view.viewModel = viewModel
            return view
        }
        
        newViews.forEach { contentStack.addArrangedSubview($0) }
        
        contentStack.layoutIfNeeded()
//        scrollView.contentSize = scrollView.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize)
//        
//        scrollView.contentInset = UIEdgeInsets(top: 0, left: Metrics.padding*3, bottom: 0, right: -Metrics.padding)
    }
    
}
