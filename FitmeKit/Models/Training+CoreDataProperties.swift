//
//  Training+CoreDataProperties.swift
//  FitmeKit
//
//  Created by Douglas Taquary on 02/10/18.
//  Copyright © 2018 Douglas Taquary. All rights reserved.
//
//

import Foundation
import CoreData


extension Training {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Training> {
        return NSFetchRequest<Training>(entityName: "Training")
    }

    @NSManaged public var identifier: String?
    @NSManaged public var trainingName: String?
    @NSManaged public var tagColor: Int16
    @NSManaged public var day: NSDate?
    @NSManaged public var isToday: Bool
    @NSManaged public var exerciseGroups: NSSet?

}

// MARK: Generated accessors for exerciseGroups
extension Training {

    @objc(addExerciseGroupsObject:)
    @NSManaged public func addToExerciseGroups(_ value: ExerciseGroup)

    @objc(removeExerciseGroupsObject:)
    @NSManaged public func removeFromExerciseGroups(_ value: ExerciseGroup)

    @objc(addExerciseGroups:)
    @NSManaged public func addToExerciseGroups(_ values: NSSet)

    @objc(removeExerciseGroups:)
    @NSManaged public func removeFromExerciseGroups(_ values: NSSet)

}
