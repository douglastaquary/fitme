//
//  CoreDataStack.swift
//  FitmeKit
//
//  Created by Douglas Taquary on 02/10/18.
//  Copyright © 2018 Douglas Taquary. All rights reserved.
//

import Foundation
import CoreData

public class CoreDataStack {
    
    // MARK: - Core Data stack
    
     lazy var persistentContainer: NSPersistentContainer = {

        let container = NSPersistentContainer(name: "Fit_Me")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {

                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    public init() {}
    
    // MARK: - Core Data Saving support
    
    public func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {

                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }

}
