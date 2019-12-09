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
    var menuController: MenuController!
    //this is the controller shown on top of the ContainerController
    var centerController: UIViewController!
    //keeps track of wheter or not we are showing or hiding the menu.It is false 'coz when the app starts the menu is hiden.
    var isExpanded = false
    
    
    //Init
    override func viewDidLoad() {
        super.viewDidLoad()
        configureHomeController()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }
    override var preferredStatusBarUpdateAnimation: UIStatusBarAnimation{
        return .slide
    }
    
    override var prefersStatusBarHidden: Bool{
        return isExpanded
    }
    
    //Functions
    func configureHomeController(){
        
        let homeController = HomeController()
        homeController.delegate = self
        centerController = UINavigationController(rootViewController: homeController)
        
        view .addSubview(centerController.view)
        addChildViewController(centerController)
        centerController.didMove(toParentViewController: self)
        
    }
    
    func configureMenuController(){
        
        //I only want to add the menu controller once
        if menuController == nil{
            //add the menu controller here
            menuController = MenuController()
            menuController.delegate = self
            view.insertSubview(menuController.view, at: 0)
            addChildViewController(menuController)
            menuController.didMove(toParentViewController: self)
            print("the menu controller was added...")
        }
    }
    
    //this function is to show the MenuController.
    //it receive a boolean variable for whether or not we are show or hiding the menu
    func animatHamburgerMenu(shouldExpand: Bool, menuOption: MenuOption?){
        if shouldExpand{
            
            //show menu with animation function to the right
            UIView.animate(withDuration:0.3 ,delay: 0, usingSpringWithDamping: 0.8,initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
                
                self.centerController.view.frame.origin.x = self.centerController.view.frame.width - 220
                
            },completion: nil )
        }
        else{
            
            //hide menu with animation function to the right
            UIView.animate(withDuration:0.3 ,delay: 0, usingSpringWithDamping: 0.8,initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
                
                self.centerController.view.frame.origin.x = 0
                
                },completion: nil )
            
            UIView.animate(withDuration:0.3 ,delay: 0, usingSpringWithDamping: 0.8,initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
                
                self.centerController.view.frame.origin.x = 0
                
            }){(_) in
                //unwrapping menuOtion in the next line
                guard let menuOption = menuOption else {return}
                
                self.didSelectMenuOption(menuOption: menuOption)
            }
        }
            
     }
    
    //This function handles the options selected in the hamburguer menu
    //Here is where we go to the controller according to the option that was selected from the menu.
    func didSelectMenuOption(menuOption: MenuOption){
        switch menuOption{
            
            
        case .Events:
            //Go to Event controller
            print("Show Events Controller")
        case .Artist:
            //Go to Artist controller
            print("Show Artist Controller")
        case .Favorites:
            //Go to Favorite controller
            print("Show Favorite")
        case .Registration:
            //Go to Registration controller
            print("Show Registrations" )
        }
        
    }
    
}

extension ContainerController: HomeControllerDelegate{
    
    func handleMenuToggle(forMenuOption menuOption: MenuOption?) {
        
        if !isExpanded{
            configureMenuController()
        }
        
        //every time the hamburguer button is pressed it changes the state of isExpanded to the oposite of what it was.
        isExpanded = !isExpanded
        animatHamburgerMenu(shouldExpand: isExpanded, menuOption: menuOption)
    }
}
