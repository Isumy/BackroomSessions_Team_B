//
//  MenuController.swift
//  BackroomSessions_TeamB
//
//  Created by Isumy Aguila on 12/4/19.
//  Copyright © 2019 Isumy Aguila. All rights reserved.
//

import Foundation
import UIKit

private let reuseIdentifier = "MenuOptionMenu"

class MenuController: UIViewController, UITableViewDelegate, UITableViewDataSource{
   
    
    
    //Properties
    
    var menuTableView: UITableView!
    
     //Init
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
    }
    
   
    
    //Functions
    func configureTableView(){
        menuTableView = UITableView()
        menuTableView.delegate  = self
        menuTableView.dataSource = self
        
        //registering the view cell
        menuTableView.register(MenuOptionViewCell.self, forCellReuseIdentifier: reuseIdentifier)
        
        menuTableView.backgroundColor = .darkGray
        menuTableView.separatorStyle  = .none
        menuTableView.rowHeight  = 80
        
        //Adding menutableview to the subview
        view.addSubview(menuTableView)
        //Creating constraints
        menuTableView.translatesAutoresizingMaskIntoConstraints = false
        menuTableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        menuTableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        menuTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        menuTableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        let cell = menuTableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! MenuOptionViewCell
        //Populating table view
        let menuOption = MenuOption(rawValue: indexPath.row)
        //getting the values 
        cell.descriptionLabel.text = menuOption?.description
        cell.iconImageView.image = menuOption?.image
        
        return cell
    }
    
}


