//
//  EventsController.swift
//  BackroomSessions_TeamB
//
//  Created by Isumy Aguila on 12/4/19.
//  Copyright © 2019 Isumy Aguila. All rights reserved.
//

import Foundation
import UIKit

//Necessary properties of an Artist object
//var name: String
//var email: String
//var phoneNumber: String
//var youtubeLink: URL?
//var soundcloudLink: URL?
//var websiteLink: URL?
//var picture: UIImage?

class RegistrationController: UIViewController{
    var registrationView: RegistrationView!
    
    //Properties
    //delegate to link menucontroller with actions in the menu
    var delegate: HomeControllerDelegate?
    
    override func viewDidLoad(){
        super.viewDidLoad()
        setupView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    func setupView(){
        let mainView = RegistrationView(frame: self.view.frame)
        self.registrationView = mainView
        self.view.addSubview(registrationView)
        NSLayoutConstraint.activate([
            registrationView.topAnchor.constraint(equalTo: self.view.topAnchor),
            registrationView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            registrationView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            registrationView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            ])
    }
    
    //Init
    
    //Functions
    
    
}
