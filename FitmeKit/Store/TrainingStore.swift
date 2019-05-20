//
//  TrainingStore.swift
//  Fit Me
//
//  Created by Douglas Taquary on 14/10/18.
//  Copyright © 2018 Douglas Taquary. All rights reserved.
//

import Foundation
import FitmeKit

public final class TrainingStore: Store {
    

    public enum FetchError: Error {
        case notFound(String)
        case parse(String)
        
        var localizedDescription: String {
            switch self {
            case .parse(let key):
                return String(format: NSLocalizedString("Unable to parse key %@ from activity", comment: "Unable to parse user activity error"), key)
            case .notFound(let identifier):
                return String(format: NSLocalizedString("Unable to find training with identifier %@", comment: "Training not found error"), identifier)
            }
        }
    }
    
    public init() {
        
    }
    
    public typealias Model = Training
    
    private let fakeNetworkingDelay: TimeInterval = 0.5
    
    private lazy var backingStore: [Training] = {
        guard let url = Bundle.fitmeKit.url(forResource: "list_workouts", withExtension: "json") else {
            fatalError("Missing Missing demo.json from FitmeKit resources")
        }
        
        do {
           let data = try Data(contentsOf: url)
            return try JSONDecoder().decode([Training].self, from: data)
        } catch {
             fatalError("Failed to load demo content: \(String(describing: error))")
        }

    }()
    
    public func fetchAll(completion: @escaping (Result<[Training], Error>) -> Void) {
        DispatchQueue.main.async {
            completion(.success(self.backingStore))
        }
    }
    
    public func fetch(with identifier: String, completion: @escaping (Result<Training, Error>) -> Void) {
        guard let model = backingStore.first(where: { $0.identifier == identifier }) else {
            completion(.failure(FetchError.notFound(identifier)))
            return
        }
        
        completion(.success(model))
    }
    
    public func store(models: [Training], completion: @escaping (Result<[Training], Error>) -> Void) {
        fatalError("Demo does not support storage")
    }
    
    public func fetch(from userActivity: NSUserActivity, completion: @escaping (Result<Training, Error>) -> Void) {
        let key = TrainingViewModel.Keys.identifier
        
        guard let trainingIdentifier = userActivity.userInfo?[key] as? String else {
            completion(.failure(FetchError.parse(key)))
            return
        }
        
        fetch(with: trainingIdentifier, completion: completion)
    }
    
}
