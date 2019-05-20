//
//  NibView.swift
//  Fit Me
//
//  Created by Douglas Taquary on 19/05/19.
//  Copyright © 2019 Douglas Taquary. All rights reserved.
//

import UIKit

@IBDesignable
open class NibView: UIView {
    
    public var nibContainerView: UIView {
        return self
    }
    
    // MARK: - Constructor
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        self.setupNib()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setupNib()
    }
    
    // MARK: - Public
    
    public func nibName() -> String {
        return type(of: self).description().components(separatedBy: ".").last! // swiftlint:disable:this force_cast
    }
    
    public func loadNib() -> UIView {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: nibName(), bundle: bundle)
        return nib.instantiate(withOwner: self, options: nil)[0] as! UIView // swiftlint:disable:this force_cast
    }
    
    // MARK: - Private
    
    fileprivate func setupNib() {
        let view = loadNib()
        nibContainerView.addSubview(view)
        
        view.backgroundColor = .clear
        view.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            view.leadingAnchor.constraint(equalTo: leadingAnchor),
            view.trailingAnchor.constraint(equalTo: trailingAnchor),
            view.topAnchor.constraint(equalTo: topAnchor),
            view.bottomAnchor.constraint(equalTo: bottomAnchor)
            ])
    }
    
}

