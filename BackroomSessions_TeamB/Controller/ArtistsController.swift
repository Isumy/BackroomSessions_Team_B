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

class ArtistsController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UISearchBarDelegate {
    
    // Properties
    var artistsCollectionView: UICollectionView!
    var delegate: HomeControllerDelegate?       // Links controller with actions in the menu
    
    let persistenceManager: PersistenceManager!
    
    init(persistenceManager: PersistenceManager){
        self.persistenceManager = persistenceManager
        super.init(nibName:nil, bundle:nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var allArtists: [Artist] = []
    var filtered: [Artist] = []
    
    // Init
    override func loadView() {
        super.loadView()
        allArtists = persistenceManager.fetch(Artist.self)
        filtered = allArtists
        
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
        initializeArtists()
    }
    
    override func viewDidLoad(){
        super.viewDidLoad()
        configureCollectionView()
        configureArtistsUI()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        filtered = persistenceManager.fetch(Artist.self)
    }
    
    //This method configure the way the UI for the EventsViewController will look like.
    func configureArtistsUI(){
        
        //Embedding Navigatoion Controller to Events ViewController
        navigationController?.navigationBar.barTintColor = .darkGray
        navigationController?.navigationBar.barStyle = .black
        
        navigationItem.title = "Artists"
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "icons8-back-white").withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(handleDismissVC))
        
        let searchBarController: UISearchController = UISearchController(searchResultsController: nil)
        searchBarController.searchBar.delegate = self
        searchBarController.searchBar.placeholder = "Search Artists..."
        searchBarController.searchBar.showsCancelButton = true
        navigationItem.hidesSearchBarWhenScrolling = false
        navigationItem.searchController = searchBarController
    }
    
    //Selector function to dismiss the ViewController
    @objc func handleDismissVC(){
        dismiss(animated: true, completion: nil)
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filtered = searchText.isEmpty ? allArtists : allArtists.filter { (artist: Artist) -> Bool in
            return artist.name?.range(of: searchText, options: .caseInsensitive, range: nil, locale: nil) != nil
        }

        artistsCollectionView.reloadData()
    }

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        filtered = persistenceManager.fetch(Artist.self)
        searchBar.resignFirstResponder()
        artistsCollectionView.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        filtered = persistenceManager.fetch(Artist.self)
        searchBar.resignFirstResponder()
        artistsCollectionView.reloadData()
    }
    
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
        detailViewController.viewArtist = filtered[indexPath.row]
        detailViewController.delegate = self.delegate
        detailViewController.rootController = self
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.25, execute: {
            self.filtered = self.persistenceManager.fetch(Artist.self)
            self.navigationController!.pushViewController(detailViewController, animated: true)
        })
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    // Displays the collectionView with the number of artists
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return filtered.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // Create an instance of the default ArtistCollectionViewCell
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! ArtistCollectionViewCell
        
        /* Set the text on the cell with the name of the artist that
         is at the nth index of the artists list, where n = row */
        let artist = filtered[indexPath.row]
        
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
    
    func initializeArtists() {
        let modelArtists = ArtistDB.sharedInstance
        let context = persistenceManager.context
        
        if modelArtists.numOfArtists() != allArtists.count {
            for artist in modelArtists.getAllArtists() {
                let newArtist = Artist(context: context)
                
                // If appropriate, configure the new managed object.
                newArtist.name = artist.name
                newArtist.email = artist.email
                newArtist.phoneNumber = artist.phoneNumber
                newArtist.profilePicture = UIImageJPEGRepresentation(artist.picture!, 1)! as NSData
                newArtist.youtubeLink = artist.youtubeLink
                newArtist.soundcloudLink = artist.soundcloudLink
                newArtist.websiteLink = artist.websiteLink
            }
        }
        
        // Save the context.
        do {
            try context.save()
        } catch {
            // Replace this implementation with code to handle the error appropriately.
            // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            let nserror = error as NSError
            fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
        }
    }
}
