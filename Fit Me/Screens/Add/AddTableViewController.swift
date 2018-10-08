//
//  AddTableViewController.swift
//  Fit Me
//
//  Created by Douglas Taquary on 07/10/18.
//  Copyright © 2018 Douglas Taquary. All rights reserved.
//

import UIKit

protocol AddTableViewControllerDelegate: class {
    func addTableViewController(_ controler: AddTableViewController)
}

final class AddTableViewController: UIViewController {
    
    weak var delegate: AddTableViewControllerDelegate?
    
    private struct Constants {
        static let roundCellIdentifier = "roundCell"
        static let categoriesCellIdentifier = "categoriesCell"
        static let exerciseCellIdentifier = " exerciseCell"
    }
}
