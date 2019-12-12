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
        profileImageView.image = UIImage(data: artist.profilePicture! as Data)
        addSubview(profileImageView)
        
        artistNameLabel.text = "Name: \(artist.name ?? "")"
        addSubview(artistNameLabel)
        
        artistEmailLabel.text = "Email:\(artist.email ?? "")"
        addSubview(artistEmailLabel)
        
        artistNumberLabel.text = "Number:\(artist.phoneNumber ?? "")"
        addSubview(artistNumberLabel)
        
        artistYoutubeLabel.text = "Youtube Link:\n\(artist.youtubeLink?.relativeString ?? "")"
        addSubview(artistYoutubeLabel)
        
        artistSoundcloudLabel.text = "Youtube Link:\n\(artist.youtubeLink?.relativeString ?? "")"
        addSubview(artistSoundcloudLabel)
        
        artistWebsiteLabel.text = "Website:\(artist.websiteLink?.relativeString ?? "")"
        addSubview(artistWebsiteLabel)
    }
    
    let profileImageView: UIImageView = {
        let iv = UIImageView(frame: CGRect(x: UIScreen.main.bounds.width / 2 - 100, y: 70.0, width:200, height: 200.0))
        iv.contentMode = .scaleAspectFit
        return iv
    }()

    let artistNameLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 275.0, width:UIScreen.main.bounds.width, height: 60.0))
        label.textColor = .white
        return label
    }()
    
    let artistEmailLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 340.0, width:UIScreen.main.bounds.width, height: 60.0))
        label.textColor = .white
        return label
    }()

    let artistNumberLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 405.0, width:UIScreen.main.bounds.width, height: 60.0))
        label.textColor = .white
        return label
    }()

    let artistYoutubeLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 470.0, width:UIScreen.main.bounds.width, height: 60.0))
        label.textColor = .white
        return label
    }()

    let artistSoundcloudLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 535.0, width:UIScreen.main.bounds.width, height: 60.0))
        label.textColor = .white
        return label
    }()

    let artistWebsiteLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 600.0, width:UIScreen.main.bounds.width, height: 60.0))
        label.textColor = .white
        return label
    }()
    
}
