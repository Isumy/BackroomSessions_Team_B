//
//  ProfileView.swift
//  BackroomSessions_TeamB
//
//  Created by Genesis Barrios on 12/11/19.
//  Copyright © 2019 Isumy Aguila. All rights reserved.
//

import Foundation
import UIKit
class ProfileView: UIView{
    
    var artist = Artist()
    
    override init(frame: CGRect){
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(){
        let nameLabel = UILabel(frame: CGRect(x: 30, y: 30, width: 200, height: 21))
        nameLabel.textColor = .white
        nameLabel.text = artist.name
        addSubview(nameLabel)
    }
    
}
