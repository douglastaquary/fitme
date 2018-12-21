//
//  Store.swift
//  Fit Me
//
//  Created by Douglas Taquary on 14/10/18.
//  Copyright © 2018 Douglas Taquary. All rights reserved.
//

import Foundation

public enum Result<T> {
    case success(T)
    case error(Error)
}

public protocol Store {
    associatedtype Model
    typealias StoreCompletionBlock = (Result<Model>) -> Void
    typealias StoreCollectionCompletionBlock = (Result<[Model]>) -> Void
    
    func store(models: [Model], completion: @escaping StoreCollectionCompletionBlock)
    func fetchAll(completion: @escaping StoreCollectionCompletionBlock)
    func fetch(with identifier: String, completion: @escaping StoreCompletionBlock)
    func fetch(from userActivity: NSUserActivity, completion: @escaping StoreCompletionBlock)
}
