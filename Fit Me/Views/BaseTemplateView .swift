//
//  BaseTemplateView .swift
//  Fit Me
//
//  Created by Douglas Taquary on 21/10/18.
//  Copyright © 2018 Douglas Taquary. All rights reserved.
//

import UIKit

/// Default implementtation to UIView
open class BaseViewTemplate: UIView {
    
    public var shouldLayoutSubviews = false
    @IBOutlet public weak var view: UIView!
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        
        xibSetup("\(type(of: self))")
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        xibSetup("\(type(of: self))")
    }
    
    open func xibSetup( _ named: String ) {
        view = loadViewFromNib( named )
        
        // use bounds not frame or it'll be offset
        view.frame = bounds
        
        // Make the view stretch with containing view
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        // Adding custom subview on top of our view (over any custom drawing > see note below)
        addSubview(view)
        
        // setup
        setup()
    }
    
    internal func loadViewFromNib(_ named: String) -> UIView {
        
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: named, bundle: bundle)
        
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        
        return view
    }
    
    override open func layoutSubviews() {
        guard shouldLayoutSubviews else { return }
        
        super.layoutSubviews()
        
        if let size = superview?.frame.size {
            frame.size = size
        }
    }
    
    public func registerDismissViewOnTap() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(BaseViewTemplate.onTapToDismissView(_:)))
        view.addGestureRecognizer(tap)
    }
    
    @objc func onTapToDismissView( _ gesture: UITapGestureRecognizer ) {
        resignFirstResponderNow()
    }
    
    public func resignFirstResponderNow() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
    
    open func setup(){}
    
}
