//
//  EventsController.swift
//  BackroomSessions_TeamB
//
//  Created by Isumy Aguila on 12/4/19.
//  Copyright © 2019 Isumy Aguila. All rights reserved.
//

import Foundation
import UIKit

class EventsController: UIViewController{
    
    //Properties
    
    //created this delegate to link menucontroller with actions in the menu
    var delegate: HomeControllerDelegate?
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
        //Calling this method to makle changes to the UI
        configureEventsUI()
    }
    
    //Init
    
    
    //Functions
    
    //This method configure the way the UI for the EventsViewController will look like.
    func configureEventsUI(){
        
        let background = UIColor(patternImage: UIImage(named: "background") ?? UIImage())
        view.backgroundColor = background
        
        //Embedding Navigatoion Controller to Events ViewController
        navigationController?.navigationBar.barTintColor = .darkGray
        
        navigationController?.navigationBar.barStyle = .black
        
        navigationItem.title = "Events"
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "icons8-back-white").withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(handleDismissVC))
        
    }
    
    //Selector function to dismiss the ViewController
    @objc func handleDismissVC(){
        dismiss(animated: true, completion: nil)
    }
}
