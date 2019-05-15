//
//  User+CoreDataProperties.swift
//  FitmeKit
//
//  Created by Douglas Taquary on 02/10/18.
//  Copyright © 2018 Douglas Taquary. All rights reserved.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var name: String?
    @NSManaged public var weight: Float
    @NSManaged public var height: Float
    @NSManaged public var age: String?
    @NSManaged public var genre: String?
    @NSManaged public var image: NSData?
    @NSManaged public var userTrainings: NSSet?

}

// MARK: Generated accessors for userTrainings
extension User {

    @objc(addUserTrainingsObject:)
    @NSManaged public func addToUserTrainings(_ value: Training)

    @objc(removeUserTrainingsObject:)
    @NSManaged public func removeFromUserTrainings(_ value: Training)

    @objc(addUserTrainings:)
    @NSManaged public func addToUserTrainings(_ values: NSSet)

    @objc(removeUserTrainings:)
    @NSManaged public func removeFromUserTrainings(_ values: NSSet)

}
