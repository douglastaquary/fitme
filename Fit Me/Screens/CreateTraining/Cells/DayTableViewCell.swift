//
//  DayTableViewCell.swift
//  Fit Me
//
//  Created by Douglas Taquary on 07/10/18.
//  Copyright © 2018 Douglas Taquary. All rights reserved.
//

import UIKit

final class DayTableViewCell: UITableViewCell {
    
    private lazy var dayListView = DayColorView(frame: .zero)
    
//    public var viewModel: DayViewModel? {
//        get {
//            return dayListView.viewModel
//        }
//        set {
//            dayListView.viewModel = newValue
//        }
//    }
    
//    public var didTapDay: (() -> Void)? {
//        get {
//            return dayListView.didTapDay
//        }
//        set {
//            dayListView.didTapDay = newValue
//        }
//    }
    
    public override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        buildUI()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        buildUI()
    }
    
    private func buildUI() {
        dayListView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(dayListView)
        
        dayListView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        dayListView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        dayListView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        dayListView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
    }
    
}
