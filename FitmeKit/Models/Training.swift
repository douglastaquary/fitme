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
    
}
