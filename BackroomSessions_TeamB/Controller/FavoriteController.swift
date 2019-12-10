//
//  FavoriteController.swift
//  BackroomSessions_TeamB
//
//  Created by Leila Adaza on 12/5/19.
//  Copyright © 2019 Isumy Aguila. All rights reserved.
//

import Foundation
import UIKit

class FavoriteController: UIViewController {
    
    // Properties
    var delegate: HomeControllerDelegate?
    //Init
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
        //view.backgroundColor = .green
        configureFavoriteUI()
    }
    
   
    
    // Functions
    //This method configure the way the UI for the EventsViewController will look like.
    func configureFavoriteUI(){
        
        let background = UIColor(patternImage: UIImage(named: "background") ?? UIImage())
        view.backgroundColor = background
        
        //Embedding Navigatoion Controller to Events ViewController
        navigationController?.navigationBar.barTintColor = .darkGray
        
        navigationController?.navigationBar.barStyle = .black
        
        navigationItem.title = "Favorites"
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "icons8-back-white").withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(handleDismissVC))
        
    }
    
    //Selector function to dismiss the ViewController
    @objc func handleDismissVC(){
        dismiss(animated: true, completion: nil)
    }
    
}
