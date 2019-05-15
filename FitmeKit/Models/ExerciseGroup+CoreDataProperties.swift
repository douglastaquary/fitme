//
//  ExerciseGroup+CoreDataProperties.swift
//  FitmeKit
//
//  Created by Douglas Taquary on 02/10/18.
//  Copyright © 2018 Douglas Taquary. All rights reserved.
//
//

import Foundation
import CoreData


extension ExerciseGroup {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ExerciseGroup> {
        return NSFetchRequest<ExerciseGroup>(entityName: "ExerciseGroup")
    }

    @NSManaged public var groupName: String?
    @NSManaged public var exercises: NSSet?

}

// MARK: Generated accessors for exercises
extension ExerciseGroup {

    @objc(addExercisesObject:)
    @NSManaged public func addToExercises(_ value: Exercise)

    @objc(removeExercisesObject:)
    @NSManaged public func removeFromExercises(_ value: Exercise)

    @objc(addExercises:)
    @NSManaged public func addToExercises(_ values: NSSet)

    @objc(removeExercises:)
    @NSManaged public func removeFromExercises(_ values: NSSet)

}
