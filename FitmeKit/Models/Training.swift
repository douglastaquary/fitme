//
//  Training+CoreDataClass.swift
//  FitmeKit
//
//  Created by Douglas Taquary on 02/10/18.
//  Copyright © 2018 Douglas Taquary. All rights reserved.
//
//

import Foundation

public class Training: Model, Codable {

    public var identifier: String
    public let title: String
    public let groups: [ExercisesGroup]

    
    public init(identifier: String, title: String, groups: [ExercisesGroup]) {
        self.identifier = identifier
        self.title = title
        self.groups = groups
    }
    
    public var allExercises: [Exercise] {
        let exercises = groups.map { $0.exercises }.flatMap { $0 }
        return exercises
    }
    
    public var groupNames: [String] {
        let names = groups.map { (group: ExercisesGroup) -> String in
                group.name
            }
            .compactMap {
                $0
            }
            .flatMap { name -> [String] in
                return [name]
            }
        
        return names
    }
    
}
