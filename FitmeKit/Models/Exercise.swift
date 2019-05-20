//
//  ExerciseGroup+CoreDataClass.swift
//  FitmeKit
//
//  Created by Douglas Taquary on 02/10/18.
//  Copyright © 2018 Douglas Taquary. All rights reserved.
//
//

import Foundation

public struct Exercise: Codable {

    public let name: String
    public let series: Int
    public let delay: Int
    
    public init(name: String, series: Int, delay: Int) {
        self.name = name
        self.series = series
        self.delay = delay
    }
    
}
