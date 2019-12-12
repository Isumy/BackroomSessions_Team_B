//
//  Artist+CoreDataProperties.swift
//  BackroomSessions_TeamB
//
//  Created by Genesis Barrios on 12/11/19.
//  Copyright © 2019 Isumy Aguila. All rights reserved.
//
//

import Foundation
import CoreData


extension Artist {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Artist> {
        return NSFetchRequest<Artist>(entityName: "Artist")
    }

    @NSManaged public var email: String?
    @NSManaged public var name: String?
    @NSManaged public var phoneNumber: String?
    @NSManaged public var profilePicture: NSData?
    @NSManaged public var soundcloudLink: URL?
    @NSManaged public var websiteLink: URL?
    @NSManaged public var youtubeLink: URL?
    @NSManaged public var registered: Bool

}
