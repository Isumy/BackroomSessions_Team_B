//
//  ImagesCell.swift
//  BackroomSessions_TeamB
//
//  Created by Isumy Aguila on 12/12/19.
//  Copyright © 2019 Isumy Aguila. All rights reserved.
//

import Foundation
import UIKit

class EventImagesCell: UICollectionViewCell , UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    //Properties
    
     //switch to core data
    var images: [String]? {
        
        didSet{
        collectionView.reloadData()
        }
    }
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 30
        layout.scrollDirection = .horizontal
        //Initializing collection VIew with frame and layout
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .clear
        
        return cv
    }()
    
    let IconCellIdentifier = "cellIdentifier"
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
        collectionView.register(IconCell.self, forCellWithReuseIdentifier: IconCellIdentifier)
    }
    //Implementing required methods in order to conform to the delegates
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: IconCellIdentifier, for: indexPath) as! IconCell
        
        //switch to core data
        if let imageName = images?[indexPath.item] {
            cell.imageView.image = UIImage(named: imageName)
        }
        
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
            
            setup()
            
        }
        
        required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        //funtions
        
        func setup(){
            //backgroundColor = .blue
            addSubview(imageView)
            imageView.setAnchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0)
        }
        
        
    }// End of Icon class
    
}//end of Imagecell Class

