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

    
    public var viewModel: AddViewModel? {
        didSet {
            buildUI()
        }
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
    
    private lazy var circleView: UIView = {
        let v = UIView()
        
        v.translatesAutoresizingMaskIntoConstraints =  false
        v.layer.cornerRadius = bounds.size.height/2
        v.heightAnchor.constraint(equalToConstant: Metrics.tagCircleColorSize)
        v.layer.masksToBounds = true
        
        return v
    }()
    

    private func buildUI() {
        let contentView = self
        
        self.backgroundColor = .background
        
        addSubview(circleView)
        
        circleView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        circleView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true

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
        }, completion: { _ in
            self.selectedTag()
        })
    }
    
    private func selectedTag() {
        UIView.animate(withDuration: 0.24, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 2, options: [.allowUserInteraction, .beginFromCurrentState], animations: {
            self.layer.transform = CATransform3DMakeScale(1.2, 1.2, 1)
        }, completion: nil)
    }
    
    
    private func unselectedTag() {
        UIView.animate(withDuration: 0.24, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 2, options: [.allowUserInteraction, .beginFromCurrentState], animations: {
            self.layer.transform = CATransform3DIdentity
        }, completion: nil)
    }
    
    private func switchDaySelected() {
        if circleView.isHidden {
            UIView.animate(withDuration: 0.2, animations: {
                self.circleView.alpha = 1
            })
        } else {
            UIView.animate(withDuration: 0.2, animations: {
                self.circleView.alpha = 0
            })
        }
    }
}
