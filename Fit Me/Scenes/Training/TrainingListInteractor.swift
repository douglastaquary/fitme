//
//  TrainingListInteractor.swift
//  Fit Me
//
//  Created by Douglas T on 19/05/19.
//  Copyright © 2019 Douglas Taquary. All rights reserved.
//

import FitmeKit
import Foundation

public protocol TrainingListInteractorProtocol {
    
    var presenter: TrainingListPresenterProtocol? { get set }
    var repository: Store? { get set }
    //var application: FitmeApplicationProtocol { get set }
    
    func fetchTrainigs()
    func goToTrainingDetail(training: TrainingViewModel)
    
}


public class TrainingListInteractor: TrainingListInteractorProtocol {
    
    public var presenter: TrainingListPresenterProtocol?
    public var repository: Store?
    
    public init(presenter: TrainingListPresenterProtocol, repository: Store) {
        self.presenter = presenter
        self.repository = repository
    }
    
    public func fetchTrainigs() {
        
    }
    
    public func fetchImageBannerOnCms(urlImage: String?) {
        
    }
    
    public func goToTrainingDetail(training: TrainingViewModel) {
        
    }
    
    
}
