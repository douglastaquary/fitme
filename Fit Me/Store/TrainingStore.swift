//
//  TrainingStore.swift
//  Fit Me
//
//  Created by Douglas Taquary on 14/10/18.
//  Copyright © 2018 Douglas Taquary. All rights reserved.
//

import Foundation
import CoreData

public final class TrainingStore: Store {
    
    var coreData = CoreDataStack()
    
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
        let request: NSFetchRequest<Training> = Training.fetchRequest()
        
        let moc = coreData.persistentContainer.viewContext
        do {
            let allTrainings = try moc.fetch(request)
            return allTrainings
        } catch {
            fatalError("Failed to fetch all trainings")
        }
    }()
    
    public func fetchAll(completion: @escaping (Result<[Training]>) -> Void) {
        DispatchQueue.main.async {
            completion(.success(self.backingStore))
        }
    }
    
    public func fetch(with identifier: String, completion: @escaping (Result<Training>) -> Void) {
        guard let model = backingStore.first(where: { $0.identifier == identifier }) else {
            completion(.error(FetchError.notFound(identifier)))
            return
        }
        
        completion(.success(model))
    }
    
    public func store(models: [Training], completion: @escaping (Result<[Training]>) -> Void) {
        fatalError("Demo does not support storage")
    }
    
    public func fetch(from userActivity: NSUserActivity, completion: @escaping (Result<Training>) -> Void) {
        let key = TrainingViewModel.Keys.identifier
        
        guard let productIdentifier = userActivity.userInfo?[key] as? String else {
            completion(.error(FetchError.parse(key)))
            return
        }
        
        fetch(with: productIdentifier, completion: completion)
    }
    
}
