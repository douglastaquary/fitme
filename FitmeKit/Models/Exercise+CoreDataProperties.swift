//
//  Exercise+CoreDataProperties.swift
//  FitmeKit
//
//  Created by Douglas Taquary on 02/10/18.
//  Copyright © 2018 Douglas Taquary. All rights reserved.
//
//

import Foundation
import CoreData


extension Exercise {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Exercise> {
        return NSFetchRequest<Exercise>(entityName: "Exercise")
    }

    @NSManaged public var didComplete: Bool
    @NSManaged public var repeats: Int16
    @NSManaged public var series: Int16
    @NSManaged public var exeerciseName: String?

}
