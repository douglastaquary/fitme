//
//  ExerciseListInteractor.swift
//  Fit Me
//
//  Created by Santander on 20/05/19.
//  Copyright © 2019 Douglas Taquary. All rights reserved.
//

import FitmeKit
import Foundation

public protocol ExerciseListInteractorProtocol {
    
    var presenter: ExerciseListPresenterProtocol? { get set }
    var repository: TrainingViewModel { get set }
    
    func fetchExercises()
}


public class ExerciseListInteractor: ExerciseListInteractorProtocol {
    
    public var presenter: ExerciseListPresenterProtocol?
    public var repository: TrainingViewModel
    
    public init(presenter: ExerciseListPresenterProtocol, repository: TrainingViewModel) {
        self.presenter = presenter
        self.repository = repository
    }
    
    public func fetchExercises() {
        self.presenter?.presentListExercise(of: repository)
    }
    
}


