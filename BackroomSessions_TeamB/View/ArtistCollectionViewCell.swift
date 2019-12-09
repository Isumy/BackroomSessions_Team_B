//
//  ArtistCollectionViewCell.swift
//  BackroomSessions_TeamB
//
//  Created by Leila Adaza on 12/5/19.
//  Copyright © 2019 Isumy Aguila. All rights reserved.
//

import Foundation
import UIKit

class ArtistCollectionViewCell: UICollectionViewCell{
    
    // Properties
    weak var artistName: UILabel!
    
    // Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let textLabel = UILabel(frame: .zero)
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(textLabel)
        NSLayoutConstraint.activate([
            textLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            textLabel.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),
            textLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            textLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            ])
        self.artistName = textLabel
        
        self.contentView.backgroundColor = UIColor(red: 240/255, green: 96/255, blue: 47/255, alpha: 0.8)
        self.artistName.textAlignment = .center
        self.artistName.textColor = .white
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Functions
    override func prepareForReuse() {
        super.prepareForReuse()
        
        self.artistName.text = nil
    }
    
}
