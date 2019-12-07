//
//  MenuOption.swift
//  BackroomSessions_TeamB
//
//  Created by Isumy Aguila on 12/5/19.
//  Copyright © 2019 Isumy Aguila. All rights reserved.
//

import Foundation
import UIKit

enum MenuOption: Int, CustomStringConvertible{
    
    case Events
    case Artist
    case Favorites
    case Registration
    
    var description: String {
        switch self {
        case .Events:
            return "Events"
        case .Artist:
            return "Artists"
        case .Favorites:
            return "Favorites"
        case .Registration:
            return "Registration"
        }
    }
    
    var image: UIImage {
        switch self {
        case .Events:
            return UIImage(named: "icons8-Events") ?? UIImage()
        case .Artist:
            return UIImage(named: "icons8-artist") ?? UIImage()
        case .Favorites:
            return UIImage(named: "icons8-favorite-cart") ?? UIImage()
        case .Registration: 
             return UIImage(named: "icons8-registration") ?? UIImage()
        }
    }
    
    
}
