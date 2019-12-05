//
//  HomeController.swift
//  BackroomSessions_TeamB
//
//  Created by Isumy Aguila on 12/4/19.
//  Copyright © 2019 Isumy Aguila. All rights reserved.
//

import Foundation
import UIKit

class HomeController: UIViewController{
    
    //Properties
    
    //this variable links eachother the Home and Menu controllers
    var delegate: HomeControllerDelegate?
    
    //Init
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        configureNavigationBar()
    }
    
    
    
    //Functions
    func configureNavigationBar(){
        
        navigationController?.navigationBar.barTintColor = .darkGray
        navigationController?.navigationBar.barStyle = .black
        
        navigationItem.title = "Blackroom Sessions"
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "ic_menu_white_3x").withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(handleMenuToggle))
        
    }
    
     @objc func handleMenuToggle() {
        //this code is executed when the hambuguer menu is pressed
        delegate?.handleMenuToggle(forMenuOption: nil)
    }
    
}
