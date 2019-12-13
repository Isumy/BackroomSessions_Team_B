//
//  Events+CoreDataProperties.swift
//  BackroomSessions_TeamB
//
//  Created by Genesis Barrios on 12/13/19.
//  Copyright © 2019 Isumy Aguila. All rights reserved.
//

import Foundation
import CoreData


extension Events {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Events> {
        return NSFetchRequest<Events>(entityName: "Events")
    }

    @NSManaged public var city: String?
    @NSManaged public var date: String?
    @NSManaged public var favorite: Bool
    @NSManaged public var imageEvent: NSData?
    @NSManaged public var imageName: String?
    @NSManaged public var title: String?

}
