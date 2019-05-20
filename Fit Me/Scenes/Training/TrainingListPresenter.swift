//
//  TrainingListPresenter.swift
//  Fit Me
//
//  Created by Santander on 19/05/19.
//  Copyright © 2019 Douglas Taquary. All rights reserved.
//

import UIKit
import FitmeKit

public protocol TrainingListPresenterProtocol {
    
    var controller: TrainingListViewControllerProtocol? { get set }
    
    func closeLoadingView()
    func presentLoadingView()
    func presentTrainingList(trainingList: [TrainingViewModel])
    func presentError(error: String)
    
}

public class TrainingListPresenter: TrainingListPresenterProtocol {

    public weak var controller: TrainingListViewControllerProtocol?
    
    // MARK: - Constructor
    
    init(controller: TrainingListViewControllerProtocol?) {
        self.controller = controller
    }
    
    
    // MARK: - Public
    
    public func closeLoadingView() {
        controller?.hideLoading()
    }
    
    public func presentLoadingView() {
        controller?.displayLoading()
    }
    
    public func presentError(error: String) {
        assertionFailure("Error = \(error)")
    }
    
    public func presentTrainingList(trainingList: [TrainingViewModel]) {
        controller?.displayTrainingList(trainings: trainingList)
    }
    
}

