////
////  ArtistDB.swift
////  BackroomSessions_TeamB
////
////  Created by Leila Adaza on 12/5/19.
////  Copyright © 2019 Isumy Aguila. All rights reserved.
////
//import Foundation
//import UIKit
//
//// Artist object
//class Artist: NSObject {
//    
//    // Necessary properties of an Artist object
//    var name: String
//    var email: String
//    var phoneNumber: String
//    var youtubeLink: URL?
//    var soundcloudLink: URL?
//    var websiteLink: URL?
//    var picture: UIImage?
//    
//    // Initializer for the properties of an Artist object
//    init(name: String, email: String, phoneNumber: String,
//         youtubeLink: URL?, soundcloudLink: URL?, websiteLink: URL?) {
//        self.name = name
//        self.email = email
//        self.phoneNumber = phoneNumber
//        self.youtubeLink = youtubeLink
//        self.soundcloudLink = soundcloudLink
//        self.websiteLink = websiteLink
//        self.picture = UIImage()
//    }
//}
//
//final class ArtistDB {
//    // cannot be subclassed
//    
//    static let sharedInstance = ArtistDB ()
//    // create only one instance of this class.
//    
//    // Prevent direct property access
//    private var artists: [Artist] = [
//        Artist(name: "Yoshi Thompkins", email: "", phoneNumber: "", youtubeLink: nil, soundcloudLink: nil, websiteLink: nil),
//        Artist(name: "Bause Mason", email: "", phoneNumber: "", youtubeLink: nil, soundcloudLink: nil, websiteLink: nil),
//        Artist(name: "Pink Tacos NYC", email: "", phoneNumber: "", youtubeLink: nil, soundcloudLink: nil, websiteLink: nil),
//        Artist(name: "Crack/Daniels", email: "", phoneNumber: "", youtubeLink: nil, soundcloudLink: nil, websiteLink: nil),
//        Artist(name: "Luna", email: "", phoneNumber: "", youtubeLink: nil, soundcloudLink: nil, websiteLink: nil),
//        Artist(name: "Josty", email: "", phoneNumber: "", youtubeLink: nil, soundcloudLink: nil, websiteLink: nil),
//        Artist(name: "Shisui", email: "", phoneNumber: "", youtubeLink: nil, soundcloudLink: nil, websiteLink: nil),
//        Artist(name: "Khadijat", email: "", phoneNumber: "", youtubeLink: nil, soundcloudLink: nil, websiteLink: nil),
//        Artist(name: "Covi Sky", email: "", phoneNumber: "", youtubeLink: nil, soundcloudLink: nil, websiteLink: nil),
//        Artist(name: "DKIRK", email: "", phoneNumber: "", youtubeLink: nil, soundcloudLink: nil, websiteLink: nil),
//        Artist(name: "Sandy Melara", email: "", phoneNumber: "", youtubeLink: nil, soundcloudLink: nil, websiteLink: nil)
//    ]
//    
//    private init () {
//        // Prevent unauthorized initialization
//    }
//    
//    // Return number of artists
//    func numOfArtists () -> Int {
//        return artists.count
//    }
//    
//    // Gets all artists and returns them
//    func getAllArtists () -> [Artist] {
//        // If I wanted to sort them by name, I would do so with the following code:
//        // artists.sort { $0.name < $1.name }
//        
//        return artists
//    }
//    
//    func getSomeArtists (_ startIndex: Int, _ lastIndex: Int) -> [Artist] {
//        return Array(artists[startIndex...lastIndex])
//    }
//    
//    // Creates a new artist and adds it to the array
//    func addArtist (name: String, email: String, phoneNumber: String,
//                    youtubeLink: URL?, soundcloudLink: URL?, websiteLink: URL?) {
//        let newArtist = Artist(name: name, email: email, phoneNumber: phoneNumber,
//                               youtubeLink: youtubeLink, soundcloudLink: soundcloudLink, websiteLink: websiteLink)
//        
//        artists.append(newArtist)
//    }
//    
//    // Removes an artist from the array
//    func removeArtist (_ artist: Artist) {
//        if let index = artists.index(of: artist) {
//            artists.remove(at: index)
//        }
//    }
//    
//    // Finds an artist in the array and returns it or nil
//    func findArtist (_ name: String) -> Artist? {
//        for artist in getAllArtists() {
//            if artist.name == name {
//                return artist
//            }
//        }
//        return nil
//    }
//}

