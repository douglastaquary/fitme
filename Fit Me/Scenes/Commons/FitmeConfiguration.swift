//
//  FitmeConfiguration.swift
//  Fit Me
//
//  Created by Douglas T on 19/05/19.
//  Copyright © 2019 Douglas Taquary. All rights reserved.
//

import Foundation

public protocol FitmeConfigurationConfigurationProtocol {
    func repository() -> Store
}

public class FitmeConfiguration {
    
    public static let defaultConfiguration = FitmeConfiguration()
    
    fileprivate var currentRepository: Store
    
    // MARK: Constructor
    
    public init(repository: Store = TrainingStore()) {
        self.currentRepository = repository
    }
    
    // MARK: - Public
    
    public func update(repository: Store) {
        currentRepository = repository
    }
    
}

extension FitmeConfiguration: FitmeConfigurationConfigurationProtocol {
    
    public func repository() -> Store {
        return currentRepository
    }
    
}
