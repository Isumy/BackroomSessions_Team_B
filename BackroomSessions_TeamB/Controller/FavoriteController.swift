//
//  FavoriteController.swift
//  BackroomSessions_TeamB
//
//  Created by Genesis Barrios on 12/5/19.
//  Copyright © 2019 Isumy Aguila. All rights reserved.
//

import Foundation
import UIKit

private let reuseIdentifier = "FavCell"

class FavoriteController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    // Properties
    var delegate: HomeControllerDelegate?
    var events: [Events] = []
    var favoritesCollectionView: UICollectionView!
    let persistenceManager: PersistenceManager!
    
    //Init
    init(persistenceManager: PersistenceManager){
        self.persistenceManager = persistenceManager
        super.init(nibName:nil, bundle:nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Init
    override func loadView() {
        super.loadView()
        events = persistenceManager.fetch(Events.self)
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(collectionView)
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: self.view.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            ])
        self.favoritesCollectionView = collectionView
    }
    
    override func viewDidLoad(){
        super.viewDidLoad()
        configureCollectionView()
        configureFavoriteUI()
        createEvent()
    }
    
    // Functions
    func createEvent(){
        let event = Events(context: persistenceManager.context)
        event.imageEvent = UIImageJPEGRepresentation(#imageLiteral(resourceName: "footer-logo"), 1)! as NSData
        event.imageName = "Nov19"
        event.title = "Nov 19 Show"
        event.date = "11/29/2019"
        event.city = "10000 SW 56 ST MIAMI, FL 33165"
        event.favorite = true
        persistenceManager.save()
    }
    
    //This method configure the way the UI for the EventsViewController will look like.
    func configureFavoriteUI(){
        
        let background = UIColor(patternImage: UIImage(named: "background") ?? UIImage())
        view.backgroundColor = background
        
        //Embedding Navigatoion Controller to Events ViewController
        navigationController?.navigationBar.barTintColor = .darkGray
        
        navigationController?.navigationBar.barStyle = .black
        
        navigationItem.title = "Favorites"
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "icons8-back-white").withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(handleDismissVC))
        
    }
    
    func configureCollectionView(){
        self.favoritesCollectionView.dataSource = self
        self.favoritesCollectionView.delegate = self
        self.favoritesCollectionView.backgroundColor = UIColor(patternImage: UIImage(named: "background") ?? UIImage())
        
        // Register the view cell
        favoritesCollectionView.register(ArtistCollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        
        // Add collectionView to the subview
        view.addSubview(favoritesCollectionView)
        
        // Create constraints
        favoritesCollectionView.translatesAutoresizingMaskIntoConstraints = false
        favoritesCollectionView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        favoritesCollectionView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        favoritesCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        favoritesCollectionView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: favoritesCollectionView.bounds.size.width - 16, height: 120)
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
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    // Displays the collectionView with the number of artists
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return events.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // Create an instance of the default ArtistCollectionViewCell
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! ArtistCollectionViewCell
        
        /* Set the text on the cell with the name of the artist that
         is at the nth index of the artists list, where n = row */
        let artist = events[indexPath.row]
        
        // Display the Artist name in each cell, going through every Artist
        cell.artistName.text = artist.title
        cell.artistName.font = UIFont(name: "Avenir", size: 25)
        
        // Cell styling
        cell.contentView.layer.cornerRadius = 4.0
        cell.contentView.layer.borderWidth = 1.0
        cell.contentView.layer.borderColor = UIColor(red: 240/255, green: 96/255, blue: 47/255, alpha: 0.8).cgColor
        cell.contentView.layer.masksToBounds = false
        
        return cell
    }
    
    //Selector function to dismiss the ViewController
    @objc func handleDismissVC(){
        dismiss(animated: true, completion: nil)
    }
    
}

