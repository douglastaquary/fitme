//
//  FitmeButton.swift
//  Fit Me
//
//  Created by Douglas Taquary on 05/10/18.
//  Copyright © 2018 Douglas Taquary. All rights reserved.
//
import UIKit

public class FitmeButton: UIButton {
    
    override public required init(frame: CGRect)
    {
        self.title = ""
        
        super.init(frame: frame)
        
        setBackgroundImage(UIImage.image(with: UIColor.actionColor),
                           for: .normal)
        layer.cornerRadius = Metrics.grid
        layer.masksToBounds = true
        let padding = Metrics.grid * 4
        contentEdgeInsets = UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding)
    }
    
    @available(*, unavailable)
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    public var title: String {
        didSet {
            let attributedString = NSAttributedString(string: title,
                                                      font: UIFont.systemFont(ofSize: Metrics.buttonTitleFontSize,
                                                                              weight: Metrics.buttonTitleFontWeight),
                                                      color: UIColor.background)
            
            setAttributedTitle(attributedString,
                               for: .normal)
        }
    }
    
}
