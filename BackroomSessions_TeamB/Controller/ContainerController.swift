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
    //this is created only one time
    var menuController: UIViewController!
    //Init
    override func viewDidLoad() {
        super.viewDidLoad()
        configureHomeController()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }
    //Functions
    func configureHomeController(){
        
        let homeController = HomeController()
        homeController.delegate = self
        let navigationController = UINavigationController(rootViewController: homeController)
        
        view .addSubview(navigationController.view)
        addChildViewController(navigationController)
        navigationController.didMove(toParentViewController: self)
        
    }
    
    func configureMenuController(){
        
        //I only want to add the menu controller once
        if menuController == nil{
            //add the menu controller here
            menuController = MenuController()
            view.insertSubview(menuController.view, at: 0)
            addChildViewController(menuController)
            menuController.didMove(toParentViewController: self)
            print("the menu controller was added...")
        }
    }
}
extension ContainerController: HomeControllerDelegate{
    
    func handleMenuToggle() {
        configureMenuController()
    }
}
