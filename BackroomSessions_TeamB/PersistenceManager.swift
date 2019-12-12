//
//  PersistenceManager.swift
//  BackroomSessions_TeamB
//
//  Created by Genesis Barrios on 12/10/19.
//  Copyright © 2019 Isumy Aguila. All rights reserved.
//

import Foundation
import CoreData
import UIKit

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
    
    
    // Allows for new Artists to be created in CoreData
    func newArtist(name: String, email: String, picture: UIImage, phoneNumber: String,
                   youtubeLink: URL?, soundcloudLink: URL?, websiteLink: URL?) {
        let artist = NSEntityDescription.insertNewObject(forEntityName: "Artist", into: context) as! Artist
        
        artist.profilePicture = UIImageJPEGRepresentation(picture, 1)! as NSData
        
        artist.name = name
        artist.email = email
        artist.phoneNumber = phoneNumber
        artist.youtubeLink = youtubeLink
        artist.soundcloudLink = soundcloudLink
        artist.websiteLink = websiteLink
        artist.registered = true
        
        save()
    }
}
