//
//  ArtistController.swift
//  BackroomSessions_TeamB
//
//  Created by Leila Adaza on 12/5/19.
//  Copyright © 2019 Isumy Aguila. All rights reserved.
//

import Foundation
import UIKit

private let reuseIdentifier = "ArtistCell"

class ArtistsController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    // Properties
    var artistsCollectionView: UICollectionView!
    var delegate: HomeControllerDelegate?       // Links controller with actions in the menu
    let allArtists = ArtistDB.sharedInstance    // Enables use of the ArtistDB model
    
    // Init
    override func loadView() {
        super.loadView()
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(collectionView)
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: self.view.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            ])
        self.artistsCollectionView = collectionView
    }
    
    override func viewDidLoad(){
        super.viewDidLoad()
        configureCollectionView()
    }
    
   /* override func viewDidAppear(_ animated: Bool) {
        let footer = UIImageView(image: UIImage(named: "footer-logo"))
        footer.translatesAutoresizingMaskIntoConstraints = false
        
        view.insertSubview(footer, aboveSubview: artistsCollectionView)
        artistsCollectionView.insertSubview(footer, at: 0)
        
//        footer.topAnchor.constraint(equalTo: self.artistsCollectionView.bottomAnchor).isActive = true
//        footer.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        footer.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        footer.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        footer.heightAnchor.constraint(equalToConstant: 220).isActive = true
        footer.widthAnchor.constraint(equalToConstant: 219).isActive = true
    } */
    
    // Functions
    func configureCollectionView(){
        self.artistsCollectionView.dataSource = self
        self.artistsCollectionView.delegate = self
        self.artistsCollectionView.backgroundColor = UIColor(patternImage: UIImage(named: "background") ?? UIImage())
        
        // Register the view cell
        artistsCollectionView.register(ArtistCollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        
        // Add collectionView to the subview
        view.addSubview(artistsCollectionView)
        
        // Create constraints
        artistsCollectionView.translatesAutoresizingMaskIntoConstraints = false
        artistsCollectionView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        artistsCollectionView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        artistsCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        artistsCollectionView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: artistsCollectionView.bounds.size.width - 16, height: 120)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets.init(top: 8, left: 8, bottom: 8, right: 8)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailViewController = ArtistDetailController()
        detailViewController.viewArtist = allArtists.getAllArtists()[indexPath.row]
        present(detailViewController, animated: true, completion: nil)
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    // Displays the collectionView with the number of artists
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return allArtists.numOfArtists()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // Create an instance of the default ArtistCollectionViewCell
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! ArtistCollectionViewCell
        
        /* Set the text on the cell with the name of the artist that
         is at the nth index of the artists list, where n = row */
        let artist = allArtists.getAllArtists()[indexPath.row]
        
        // Display the Artist name in each cell, going through every Artist
        cell.artistName.text = artist.name
        cell.artistName.font = UIFont(name: "Avenir", size: 25)
        
        // Cell styling
        cell.contentView.layer.cornerRadius = 4.0
        cell.contentView.layer.borderWidth = 1.0
        cell.contentView.layer.borderColor = UIColor(red: 240/255, green: 96/255, blue: 47/255, alpha: 0.8).cgColor
        cell.contentView.layer.masksToBounds = false
        
        return cell
    }
    
}
