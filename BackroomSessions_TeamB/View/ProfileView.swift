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
        profileImageView.image = UIImage(data: artist.profilePicture as! Data)
        addSubview(profileImageView)
    }
    
    let profileImageView: UIImageView = {
        let iv = UIImageView(frame: CGRect(x: UIScreen.main.bounds.width / 2 - 100, y: 30.0, width:200, height: 200.0))
        iv.contentMode = .scaleAspectFit
        return iv
    }()
    
}
