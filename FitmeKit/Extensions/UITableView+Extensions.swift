//
//  UITableView+Extensions.swift
//  Fit Me
//
//  Created by Douglas Taquary on 14/10/18.
//  Copyright © 2018 Douglas Taquary. All rights reserved.
//

import UIKit


extension UITableView {
    func registerCellClasses<T: CaseIterable & RawRepresentable>(
        for sectionType: T.Type,
        using resolver: (T) -> UITableViewCell.Type
        ) where T.RawValue == String {
        for section in sectionType.allCases {
            register(resolver(section), forCellReuseIdentifier: section.rawValue)
        }
    }
}
