//
//  DayTableViewCell.swift
//  Fit Me
//
//  Created by Douglas Taquary on 07/10/18.
//  Copyright © 2018 Douglas Taquary. All rights reserved.
//

import UIKit

final class DayTableViewCell: UITableViewCell {
    
    private lazy var dayView = DayView(frame: .zero)
    
    public var viewModel: AddViewModel? {
        get {
            return dayView.viewModel
        }
        set {
            dayView.viewModel = newValue
        }
    }
    
    public var didTapDay: (() -> Void)? {
        get {
            return dayView.didTapDay
        }
        set {
            dayView.didTapDay = newValue
        }
    }
    
    public override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        buildUI()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        buildUI()
    }
    
    private func buildUI() {
        dayView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(dayView)
        
        dayView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Metrics.padding).isActive = true
        dayView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -Metrics.padding).isActive = true
        dayView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: Metrics.padding).isActive = true
        dayView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -Metrics.padding).isActive = true
    }
}
