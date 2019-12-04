//
//  ContainerController.swift
//  BackroomSessions_TeamB
//
//  Created by Isumy Aguila on 12/4/19.
//  Copyright © 2019 Isumy Aguila. All rights reserved.
//

import Foundation
import UIKit

class ContainerController: UIViewController{
    
    //Properties
    override func viewDidLoad() {
        super.viewDidLoad()
        configureHomeController()
    }
    
    //Init
    
    //Functions
    func configureHomeController(){
        let homeController = HomeController()
        let navigationController = UINavigationController(rootViewController: homeController)
        
        view .addSubview(navigationController.view)
        addChildViewController(navigationController)
        navigationController.didMove(toParentViewController: self)
        
    }
    
    func configureMenuController(){
        
    }
}
