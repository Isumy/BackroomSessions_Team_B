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
    
    let imagesArray = ["Nov19", "Nov20", "Nov23", "Past1", "Past2", "Past3", "Past4"]
    let collectionView: UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 16
        layout.scrollDirection = .vertical
        
        let eventCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        eventCollectionView.backgroundColor = .clear
        
        return eventCollectionView
    }()
    
    let backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(named: "background")
        
        return imageView
    }()
    
    let imagesCellId = "imagesCellId"
    let albumsCellId = "albumsCellId"
    
    //created this delegate to link menucontroller with actions in the menu
    var delegate: HomeControllerDelegate?
    
     //Init
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
        //Calling this method to makle changes to the UI
        configureEventsUI()
    }
    
   
    
    
    //Functions
    
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
            return 9
        }
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 1{ 
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: albumsCellId, for: indexPath) as! EventAlbumImagesCell
            
            
            
            return cell
        }
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: imagesCellId  , for: indexPath) as! EventImagesCell
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if indexPath.section == 1{
            return CGSize(width: (view.frame.width/3) - 16, height: 100)
        }
        return CGSize(width: view.frame.width, height: 300)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        if section == 1 {
            return UIEdgeInsets(top: 10, left: 8, bottom: 10, right: 8)
        }
         return UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0)
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
