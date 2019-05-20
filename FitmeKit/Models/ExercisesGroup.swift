//
//  Category.swift
//  FitmeKit
//
//  Created by Douglas T on 19/05/19.
//  Copyright © 2019 Douglas Taquary. All rights reserved.
//

import Foundation

public struct ExercisesGroup: Codable {
    
    public let name: String
    public let tagColor: String
    public let weekDays: [String]
    public let exercises: [Exercise]
    
    public init(name: String, tagColor: String, weekDays: [String], exercises: [Exercise]) {
        self.name = name
        self.tagColor = tagColor
        self.weekDays = weekDays
        self.exercises = exercises
    }
    
}

