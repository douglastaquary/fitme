//
//  DayView.swift
//  Fit Me
//
//  Created by Douglas Taquary on 07/10/18.
//  Copyright © 2018 Douglas Taquary. All rights reserved.
//

import UIKit


public class DayView: UIView {
    
    public var didTapDay: (() -> Void)?
    
    
    public var viewModel: AddViewModel? {
        didSet {
            buildUI()
        }
    }
    
    var viewState: CellState = .unselected {
        didSet {
            if viewState == .unselected {
                expand()
            } else {
                expand()
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
    
    private lazy var dayLabel: UILabel = {
        let l = UILabel()
        
        l.font = UIFont.systemFont(ofSize: Metrics.addTrainingSectionTitleFontSize, weight: Metrics.addTrainingSectionTitleFontWeight)
        l.textColor = .primaryText
        l.numberOfLines = 1
        l.lineBreakMode = .byTruncatingTail
        l.translatesAutoresizingMaskIntoConstraints = false
        
        return l
    }()
    
    private func buildUI() {
        let contentView = self
        
        self.backgroundColor = .background
        
        addSubview(circleView)
        addSubview(dayLabel)
        
        circleView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        circleView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        
        dayLabel.centerXAnchor.constraint(equalTo: circleView.centerXAnchor).isActive = true
        dayLabel.centerYAnchor.constraint(equalTo: circleView.centerYAnchor).isActive = true
    }
    
    public func setupDayTap(with section: Int) {
        if section == 2 {
            switchDaySelected()
        }
    }
    
    @objc private func didTapCell() {
        
        if viewState == .selected {
            viewState = .unselected
            didTapDay?()
        } else {
            viewState = .selected
            didTapDay?()
        }
    }
    
    private func tagStyle() {
        dayLabel.isHidden = true
        circleView.alpha = 1
        circleView.tintColor = .defaultTag
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
            self.switchDaySelected()
        })
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

