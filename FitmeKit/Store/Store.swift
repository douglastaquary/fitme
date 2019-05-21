//
//  Store.swift
//  Fit Me
//
//  Created by Douglas Taquary on 14/10/18.
//  Copyright © 2018 Douglas Taquary. All rights reserved.
//

import Foundation
import FitmeKit

public protocol Store {
    
    func store(models: [Training], completion: @escaping (Result<[Training], Error>) -> Void)
    func fetchAll(completion: @escaping (Result<[Training], Error>) -> Void)
    func fetch(with identifier: String, completion: @escaping (Result<Training, Error>) -> Void)
    func fetch(from userActivity: NSUserActivity, completion: @escaping (Result<Training, Error>) -> Void)
}

//public protocol Exercises {
//    
//    func store(models: [Training], completion: @escaping (Result<[Training], Error>) -> Void)
//    func fetchAll(completion: @escaping (Result<[Training], Error>) -> Void)
//    func fetch(with identifier: String, completion: @escaping (Result<Training, Error>) -> Void)
//    func fetch(from userActivity: NSUserActivity, completion: @escaping (Result<Training, Error>) -> Void)
//}
