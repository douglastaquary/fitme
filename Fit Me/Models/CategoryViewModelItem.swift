//
//  CategoryViewModelItem.swift
//  Fit Me
//
//  Created by Douglas Taquary on 21/10/18.
//  Copyright © 2018 Douglas Taquary. All rights reserved.
//

import Foundation

protocol CategoryViewModelItem {
    var type: TrainingViewModelItemType { get }
    var sectionTitle: String { get }
    var rowCount: Int { get }
    var items: [String] { get }
    var isCollapsible: Bool { get }
    var isCollapsed: Bool { get set }
}

extension CategoryViewModelItem {
    var rowCount: Int {
        return items.count
    }
    
    var isCollapsible: Bool {
        return true
    }
}
