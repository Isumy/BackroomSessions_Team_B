//
//  PersistenceManager.swift
//  BackroomSessions_TeamB
//
//  Created by Genesis Barrios on 12/10/19.
//  Copyright © 2019 Isumy Aguila. All rights reserved.
//

import Foundation
import CoreData

final class PersistenceManager{
    private init(){}
    static let shared = PersistenceManager()
    
    // MARK: - Core Data stack
    
    lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
         */
        let container = NSPersistentContainer(name: "BackroomSessions_TeamB")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    lazy var context = persistentContainer.viewContext
    
    // MARK: - Core Data Saving support
    
    func save() {
        if context.hasChanges {
            do {
                try context.save()
                print("saved")
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    func fetch<Artist: NSManagedObject>() -> [Artist]{
        let fetchRequest = NSFetchRequest<Artist>(entityName: "Artist")
        do {
            let fetchedObjects = try context.fetch(fetchRequest)
            return fetchedObjects 
        }catch{
            print(error)
            return [Artist]()
        }
    }
}
