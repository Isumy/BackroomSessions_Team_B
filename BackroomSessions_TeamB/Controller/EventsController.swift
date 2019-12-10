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
        
        //Register the cells
        collectionView.register(ImagesCell.self, forCellWithReuseIdentifier: imagesCellId)
        collectionView.register(AlbumsCell.self, forCellWithReuseIdentifier: albumsCellId)
        
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
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: imagesCellId, for: indexPath) as! ImagesCell
            
            
            
            return cell
        }
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: albumsCellId  , for: indexPath) as! AlbumsCell
        
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

//Classes for the cells

class ImagesCell: UICollectionViewCell {
    
    override init(frame: CGRect){
    super.init(frame: frame)
         backgroundColor = .red
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
class AlbumsCell: UICollectionViewCell {
    
    override init(frame: CGRect){
        super.init(frame: frame)
        backgroundColor = .green
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
