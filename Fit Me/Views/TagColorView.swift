//
//  RoundColorView.swift
//  Fit Me
//
//  Created by Douglas Taquary on 07/10/18.
//  Copyright © 2018 Douglas Taquary. All rights reserved.
//

import UIKit

typealias Callback = () -> Void

public enum CellState {
    case selected
    case unselected
}

public class TagColorView: UIView {
    
    public var didTapTag: (() -> Void)?
    
    private var circleBackground: UIColor?
    
    public var viewModel: TagViewModel? {
        didSet {
            buildUI()
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
    
    var viewState: CellState = .unselected {
        didSet {
            if viewState == .unselected {
                unselectedTag()
            } else {
                selectedTag()
            }
        }
    }
    
    public lazy var circleView: UIView = {
        let v = UIView()
        
        v.translatesAutoresizingMaskIntoConstraints =  false
        v.layer.cornerRadius = bounds.size.height/2
        v.heightAnchor.constraint(equalToConstant: Metrics.tagCircleColorSize)
        v.widthAnchor.constraint(equalToConstant: Metrics.tagCircleColorSize)
        v.backgroundColor = .blue
        v.layer.masksToBounds = true
        
        return v
    }()
    
    
    private func buildUI() {
       // let contentView = self
        
//        let stackView = UIStackView()
//        stackView.spacing = Metrics.grid
//
//        stackView.translatesAutoresizingMaskIntoConstraints = false
//        contentView.addSubview(stackView)
////
////        contentView.heightAnchor.constraint(equalToConstant: Metrics.tagCircleColorSize)
////        contentView.widthAnchor.constraint(equalToConstant: Metrics.tagCircleColorSize)
////
//        stackView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
//        stackView.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
//        stackView.rightAnchor.constraint(equalTo: contentView.rightAnchor).isActive = true
//        stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
//
//
//        stackView.addArrangedSubview(circleView)
//
        addSubview(circleView)

        circleView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        circleView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }
    

    @objc private func didTapCell() {
        if viewState == .selected {
            viewState = .unselected
            didTapTag?()
        } else {
            viewState = .selected
            didTapTag?()
        }
    }
    
    
    private func dayStyle() {
        circleView.alpha = 0
    }
    
    
    @objc private func tapped(_ sender: UITapGestureRecognizer) {
        didTapCell()
    }
    
    // MARK: - Selection animation
    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        
        compress()
    }
    
    public override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        
        expand { print("didTap") }
    }
    
    public override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesCancelled(touches, with: event)
        
        expand { self.selectedTag() }
    }
    
    private func selectedTag() {
        UIView.animate(withDuration: 0.24, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 2, options: [.allowUserInteraction, .beginFromCurrentState], animations: {
            self.layer.transform = CATransform3DMakeScale(1.2, 1.2, 1)
        }, completion: nil)
    }
    
    
    private func unselectedTag() {
        UIView.animate(withDuration: 0.24, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 2, options: [.allowUserInteraction, .beginFromCurrentState], animations: {
            self.layer.transform = CATransform3DIdentity
            self.circleView.backgroundColor = .background
        }, completion: nil)
    }
}

