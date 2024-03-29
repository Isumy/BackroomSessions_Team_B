//
//  EventsController.swift
//  BackroomSessions_TeamB
//
//  Created by Isumy Aguila on 12/4/19.
//  Copyright © 2019 Isumy Aguila. All rights reserved.
//
import Foundation
import UIKit

class EventsController: UIViewController, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource{
    
    //Properties
    
    let pastEventImagesArray = ["past1", "past2", "past3", "past4"]
    //let upcomingEventImagesArray = ["Nov19", "Nov20", "Nov23"]
    let persistenceManager: PersistenceManager!
    
    //Init
    init(persistenceManager: PersistenceManager){
        self.persistenceManager = persistenceManager
        super.init(nibName:nil, bundle:nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var upcomingEventsImagesArray: [Events] = []
    
    let collectionView: UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        //layout.minimumLineSpacing = 16
        layout.scrollDirection = .vertical
        
        let eventCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        eventCollectionView.backgroundColor = .clear
        
        return eventCollectionView
    }()
    
    let backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill//.scaleAspectFill
        imageView.image = UIImage(named: "background")
        
        return imageView
    }()
    
    let imagesCellId = "imagesCellId"
    let albumsCellId = "albumsCellId"
    
    //created this delegate to link menucontroller with actions in the menu
    var delegate: HomeControllerDelegate?
    
    //Init
    
    override func loadView() {
        super.loadView()
        createEvent(imgName: "Nov19", title: "Greetings From Chicago!", date: "11/19/2019", city: "Chicago", fav: true)
        createEvent(imgName: "Nov20", title: "Greetings From Philly!", date: "11/19/2019", city: "Philadelphia", fav: false)
        createEvent(imgName: "Nov23", title: "Greetings From New York!", date: "11/23/2019", city: "New York", fav:false)
    }
    
    override func viewDidLoad(){
        super.viewDidLoad()
        upcomingEventsImagesArray = persistenceManager.fetch(Events.self)
        
        //Calling this method to makle changes to the UI
        configureEventsUI()
    }
    
    //Functions
    func createEvent(imgName: String, title: String, date: String, city: String, fav: Bool){
        let event = Events(context: persistenceManager.context)
        event.imageEvent = UIImageJPEGRepresentation(#imageLiteral(resourceName: "footer-logo"), 1)! as NSData
        event.imageName = imgName
        event.title = title
        event.date = date
        event.city = city
        event.favorite = fav
        persistenceManager.save()
    }
    
    //This method configure the way the UI for the EventsViewController will look like.
    func configureEventsUI(){
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        //Register the cell classes
        collectionView.register(EventImagesCell.self, forCellWithReuseIdentifier: imagesCellId)
        collectionView.register(EventAlbumImagesCell.self, forCellWithReuseIdentifier: albumsCellId)
        
        //  let background = UIColor(patternImage: UIImage(named: "background") ?? UIImage())
        //view.backgroundColor = background
        
        //Embedding Navigatoion Controller to Events ViewController
        navigationController?.navigationBar.barTintColor = .darkGray
        
        navigationController?.navigationBar.barStyle = .black
        
        navigationItem.title = "Events"
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "icons8-back-white").withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(handleDismissVC))
        
        
        //Setting backgroun image view
        view.addSubview(backgroundImageView)
        //add collection view as a subview
        view.addSubview(collectionView)
        
        //Contraints
        backgroundImageView.setAnchor(top: view.topAnchor , left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0)
        
        collectionView.setAnchor(top: view.topAnchor , left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0)
        
        
    }
    
    //Selector function to dismiss the ViewController
    @objc func handleDismissVC(){
        dismiss(animated: true, completion: nil)
    }
    
    //Conforming to protocols for CollectionView
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 1
        {
            return upcomingEventsImagesArray.count
        }
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 1{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: albumsCellId, for: indexPath) as! EventAlbumImagesCell
            cell.album = upcomingEventsImagesArray[indexPath.item].imageName
            
            
            return cell
        }
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: imagesCellId  , for: indexPath) as! EventImagesCell
        //passing array of past images two the cell
        cell.images = pastEventImagesArray
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if indexPath.section == 1{
            return CGSize(width: (view.frame.width) - 50, height: 200)
        }
        return CGSize(width: view.frame.width, height: 150)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        if section == 1 {
            return UIEdgeInsets(top: 1, left: 0, bottom: 1, right: 0)
        }
        return UIEdgeInsets(top: 1, left: 0, bottom: 1, right: 0)
    }
    
    //Segue to EventTableViewViewController
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let eventTableViewController = EventTableViewController(persistenceManager: PersistenceManager.shared)
        // detailViewController.viewArtist = filtered[indexPath.row]
        //eventTableViewController.delegate = self.delegate
        eventTableViewController.rootController = self
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.25, execute: {
            //self.filtered = self.persistenceManager.fetch()
            self.navigationController!.pushViewController(eventTableViewController, animated: true)
        })
    }
}
/*
 //Classes for the cells
 class ImagesCell: UICollectionViewCell , UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
 
 //Properties
 let collectionView: UICollectionView = {
 let layout = UICollectionViewFlowLayout()
 layout.minimumLineSpacing = 30
 layout.scrollDirection = .horizontal
 //Initializing collection VIew with frame and layout
 let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
 cv.backgroundColor = .clear
 
 return cv
 }()
 
 let cellIdentifier = "cellIdentifier"
 //Init
 override init(frame: CGRect){
 super.init(frame: frame)
 
 
 //Calling setup for collection view cell initialization
 setup()
 }
 
 required init?(coder aDecoder: NSCoder) {
 fatalError("init(coder:) has not been implemented")
 }
 
 //funtions
 
 func setup(){
 backgroundColor = .red
 addSubview(collectionView)
 
 collectionView.setAnchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 0 , paddingLeft: 0, paddingBottom: 0, paddingRight: 0)
 
 collectionView.delegate = self
 collectionView.dataSource = self
 
 
 //registering IconCell
 collectionView.register(IconCell.self, forCellWithReuseIdentifier: cellIdentifier)
 }
 //Implementing required methods in order to conform to the delegates
 func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
 return 5
 }
 
 func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
 
 let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! IconCell
 
 return cell
 }
 
 func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
 
 return CGSize(width: 200, height: frame.height - 20)
 }
 
 func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
 
 return UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
 }
 
 
 //Creating inner class for icon cell
 private class IconCell: UICollectionViewCell{
 
 let imageView: UIImageView = {
 let iv = UIImageView()
 iv.contentMode = .scaleAspectFill
 iv.clipsToBounds = true
 iv.layer.cornerRadius = 15
 
 return iv
 }()
 
 //Ini
 override init(frame: CGRect) {
 super.init(frame: frame)
 
 
 
 }
 
 required init?(coder aDecoder: NSCoder) {
 fatalError("init(coder:) has not been implemented")
 }
 //funtions
 
 func setup(){
 
 backgroundColor = .blue
 addSubview(imageView)
 imageView.setAnchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0)
 }
 
 
 }// End of Icon class
 
 }//end of Imagecell Class
 */

/*
 class AlbumsCell: UICollectionViewCell {
 
 override init(frame: CGRect){
 super.init(frame: frame)
 backgroundColor = .green
 }
 
 required init?(coder aDecoder: NSCoder) {
 fatalError("init(coder:) has not been implemented")
 }
 }//End of AlbumCell class
 */
