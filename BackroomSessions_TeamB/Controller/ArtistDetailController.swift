//
//  ArtistDetailController.swift
//  BackroomSessions_TeamB
//
//  Created by Leila Adaza on 12/5/19.
//  Copyright © 2019 Isumy Aguila. All rights reserved.
//

import Foundation
import UIKit

class ArtistDetailController: UIViewController {
    
    // Properties
    var viewArtist: Artist?
    var artistNameLabel: UILabel!
    var artistImage: UIImage!
    
    // Init
    override func viewDidLoad(){
        super.viewDidLoad()
        configureDetailView()
    }
    
    // Functions
    func configureDetailView() {
        guard let artist = viewArtist else { return }
        artistNameLabel = UILabel()
        artistImage = UIImage()
        
        artistNameLabel.text = artist.name
        artistImage = artist.picture
        
        let background = UIColor(patternImage: UIImage(named: "background") ?? UIImage())
        view.backgroundColor = background
        view.addSubview(artistNameLabel)
        
        artistNameLabel.translatesAutoresizingMaskIntoConstraints = false
        artistNameLabel.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        artistNameLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        artistNameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        artistNameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 50).isActive = true
        
        artistNameLabel.backgroundColor = UIColor(red: 240/255, green: 96/255, blue: 47/255, alpha: 0.8)
        artistNameLabel.font = UIFont(name: "Avenir", size: 30)
        artistNameLabel.textColor = .white
        artistNameLabel.textAlignment = .center
    }
    
    
}
