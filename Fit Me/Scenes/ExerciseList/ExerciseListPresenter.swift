//
//  ExerciseListPresenter.swift
//  Fit Me
//
//  Created by Santander on 20/05/19.
//  Copyright © 2019 Douglas Taquary. All rights reserved.
//

import UIKit
import FitmeKit

public protocol ExerciseListPresenterProtocol {
    
    var controller: ExerciseListViewControllerProtocol? { get set }
    
    func presentListExercise(of training: TrainingViewModel)
}

public class ExerciseListPresenter: ExerciseListPresenterProtocol {

    
    public weak var controller: ExerciseListViewControllerProtocol?
    
    // MARK: - Constructor
    
    init(controller: ExerciseListViewControllerProtocol?) {
        self.controller = controller
    }
    
    // MARK: - Public
    
    public func presentListExercise(of training: TrainingViewModel) {
        controller?.displayExercisesList(viewModel: training)

    }

}


