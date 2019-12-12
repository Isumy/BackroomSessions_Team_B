//
//  ArtistDB.swift
//  BackroomSessions_TeamB
//
//  Created by Leila Adaza on 12/5/19.
//  Copyright © 2019 Isumy Aguila. All rights reserved.
//
import Foundation
import UIKit

// Artist object
class ArtistModel: NSObject {
    
    // Necessary properties of an Artist object
    var name: String
    var email: String
    var phoneNumber: String
    var youtubeLink: URL?
    var soundcloudLink: URL?
    var websiteLink: URL?
    var picture: UIImage?
    
    // Initializer for the properties of an Artist object
    init(name: String, email: String, phoneNumber: String,
         youtubeLink: URL?, soundcloudLink: URL?, websiteLink: URL?) {
        self.name = name
        self.email = email
        self.phoneNumber = phoneNumber
        self.youtubeLink = youtubeLink
        self.soundcloudLink = soundcloudLink
        self.websiteLink = websiteLink
        self.picture = UIImage(named: "icons8-artist")
    }
}

final class ArtistDB {
    // cannot be subclassed
    
    static let sharedInstance = ArtistDB ()
    // create only one instance of this class.
    
    // Prevent direct property access
    private var artists: [ArtistModel] = [
        ArtistModel(name: "Yoshi Thompkins", email: "thompkinsyoshi@gmail.com", phoneNumber: "", youtubeLink: URL(string: "https://www.youtube.com/channel/UCqq7C6JakuUUT2SNS0KFW9g"), soundcloudLink: URL(string: "https://soundcloud.com/toshjompkins"), websiteLink: nil),
        ArtistModel(name: "Bause Mason", email: "bausemason@gmail.com", phoneNumber: "", youtubeLink: URL(string: "https://www.youtube.com/channel/UCkbAZZXEFh3h6KXk4wpAe6A"), soundcloudLink: URL(string: "https://soundcloud.com/bausemason"), websiteLink: URL(string: "https://www.backroomsessionsmia.com/")),
        ArtistModel(name: "Mahogany Purple", email: "", phoneNumber: "", youtubeLink: nil, soundcloudLink: nil, websiteLink: URL(string: "https://linktr.ee/MahoganyPurple")),
        ArtistModel(name: "Crack/Daniels", email: "", phoneNumber: "", youtubeLink: URL(string: "https://www.youtube.com/channel/UCYG3yZlwPXQPW9GeYMVmo3g"), soundcloudLink: URL(string: "https://soundcloud.com/crack_daniels/"), websiteLink: nil),
        ArtistModel(name: "Luna", email: "plsreachluna@gmail.com", phoneNumber: "", youtubeLink: nil, soundcloudLink: URL(string: "https://soundcloud.com/lunabelunar"), websiteLink: nil),
        ArtistModel(name: "Josty", email: "", phoneNumber: "", youtubeLink: nil, soundcloudLink: URL(string: "https://soundcloud.com/johnathon-micheal-stacey"), websiteLink: nil),
        ArtistModel(name: "HONNA", email: "hannaho9494@gmail.com", phoneNumber: "", youtubeLink: URL(string: "https://www.youtube.com/channel/UCZrvG6C3b86PomOZPabr9YA"), soundcloudLink: nil, websiteLink: URL(string: "https://www.facebook.com/honnamusic/")),
        ArtistModel(name: "Khadijat", email: "", phoneNumber: "", youtubeLink: URL(string: "https://www.youtube.com/channel/UCBB06m51QrEBNL7gly8M9YA"), soundcloudLink: nil, websiteLink: nil),
        ArtistModel(name: "Covi Sky", email: "", phoneNumber: "", youtubeLink: nil, soundcloudLink: URL(string: "https://soundcloud.com/covisky"), websiteLink: nil),
        ArtistModel(name: "DKIRK", email: "", phoneNumber: "", youtubeLink: URL(string: "https://www.youtube.com/dkirk94"), soundcloudLink: URL(string: "https://soundcloud.com/dkirk94"), websiteLink: URL(string: "https://www.facebook.com/dkirkmusic/")),
        ArtistModel(name: "Genesis Barrios", email: "genmiami@gmail.com", phoneNumber: "", youtubeLink: URL(string: "https://www.youtube.com/channel/UC6UqDNOGyJ5lZoY716lRIog"), soundcloudLink: URL(string: "https://soundcloud.com/genesisbarrios"), websiteLink: URL(string: "https://genesisbarrios.github.io/"))
    ]
    
    private init () {
        // Prevent unauthorized initialization
    }
    
    // Return number of artists
    func numOfArtists () -> Int {
        return artists.count
    }
    
    // Gets all artists and returns them
    func getAllArtists () -> [ArtistModel] {
        // If I wanted to sort them by name, I would do so with the following code:
        // artists.sort { $0.name < $1.name }
        
        return artists
    }
    
    func getSomeArtists (_ startIndex: Int, _ lastIndex: Int) -> [ArtistModel] {
        return Array(artists[startIndex...lastIndex])
    }
    
    // Creates a new artist and adds it to the array
    func addArtist (name: String, email: String, phoneNumber: String,
                    youtubeLink: URL?, soundcloudLink: URL?, websiteLink: URL?) {
        let newArtist = ArtistModel(name: name, email: email, phoneNumber: phoneNumber,
                               youtubeLink: youtubeLink, soundcloudLink: soundcloudLink, websiteLink: websiteLink)
        
        artists.append(newArtist)
    }
    
    // Removes an artist from the array
    func removeArtist (_ artist: ArtistModel) {
        if let index = artists.index(of: artist) {
            artists.remove(at: index)
        }
    }
    
    // Finds an artist in the array and returns it or nil
    func findArtist (_ name: String) -> ArtistModel? {
        for artist in getAllArtists() {
            if artist.name == name {
                return artist
            }
        }
        return nil
    }
}

