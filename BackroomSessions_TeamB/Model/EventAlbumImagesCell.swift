//
//  EventAlbumImagesCell.swift
//  BackroomSessions_TeamB
//
//  Created by Isumy Aguila on 12/12/19.
//  Copyright © 2019 Isumy Aguila. All rights reserved.
//

import Foundation
import UIKit

class EventAlbumImagesCell: UICollectionViewCell {
    
    //Properties
    var album: String? {
        
        didSet{
            if let imageName = album{
                imageView.image = UIImage(named: imageName)
            }
        }
    }
    let imageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit//.scaleAspectFill
        //iv.clipsToBounds = true
        iv.layer.cornerRadius = 15
        
        return iv
    }()
    
    //Initializer
    override init(frame: CGRect){
        super.init(frame: frame)
        //backgroundColor = .green
        
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //Function
    func setup(){
        //backgroundColor = .blue
        addSubview(imageView)
        imageView.setAnchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0)
    }
    
}//End of AlbumCell class

