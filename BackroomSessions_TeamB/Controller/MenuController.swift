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
    }
    
   
    
    //Functions
    func configureTableView(){
        menuTableView = UITableView()
        menuTableView.delegate  = self
        menuTableView.dataSource = self
        
        menuTableView.register(MenuOptionViewCell.self, forCellReuseIdentifier: reuseIdentifier)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        let cell = menuTableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! MenuOptionViewCell
        
        
        return cell
    }
    
}


