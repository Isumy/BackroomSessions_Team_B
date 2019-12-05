//
//  Protocols.swift
//  BackroomSessions_TeamB
//
//  Created by Isumy Aguila on 12/4/19.
//  Copyright © 2019 Isumy Aguila. All rights reserved.
//

protocol HomeControllerDelegate{
    
    //the toggle is actually going to be handle by the ContainerController, that way the menuController can be added
    func handleMenuToggle(forMenuOption menuOption: MenuOption?)
}

