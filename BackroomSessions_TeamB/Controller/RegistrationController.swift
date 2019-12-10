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
        configureRegistrationsUI()
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
    //This method configure the way the UI for the EventsViewController will look like.
    func configureRegistrationsUI(){
        
        let background = UIColor(patternImage: UIImage(named: "background") ?? UIImage())
        view.backgroundColor = background
        
        //Embedding Navigatoion Controller to Events ViewController
        navigationController?.navigationBar.barTintColor = .darkGray
        
        navigationController?.navigationBar.barStyle = .black
        
        navigationItem.title = "Registrations"
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "icons8-back-white").withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(handleDismissVC))
        
    }
    
    //Selector function to dismiss the ViewController
    @objc func handleDismissVC(){
        dismiss(animated: true, completion: nil)
    }
    
}
