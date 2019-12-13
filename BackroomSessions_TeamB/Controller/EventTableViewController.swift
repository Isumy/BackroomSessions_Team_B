//
//  EventTableViewController.swift
//  BackroomSessions_TeamB
//
//  Created by Isumy Aguila on 12/13/19.
//  Copyright © 2019 Isumy Aguila. All rights reserved.
//

import Foundation
import UIKit

class EventTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    

    //Properties
    
    var eventsTableView = UITableView()
     var rootController: UIViewController?
    var delegate: HomeControllerDelegate?
    
    let backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill//.scaleAspectFill
        imageView.image = UIImage(named: "background")
        
        return imageView
    }()
    
    //Initialize
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTableView()
        //view.backgroundColor = .red
    }
    //functions
    
    
    func setTableView(){
        //creating tableview to display the events
        eventsTableView.frame = self.view.frame
        eventsTableView.backgroundColor = UIColor.clear
        eventsTableView.separatorColor = UIColor.clear
        
        eventsTableView.delegate = self
        eventsTableView.dataSource = self
       
        //Setting backgroun image view
        view.addSubview(backgroundImageView)
        
        self.view.addSubview(eventsTableView)
        //register the cell
        eventsTableView.register(EventsTableViewCell.self, forCellReuseIdentifier: "Cell")
    }
    
    //conforming to table view protocols
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 8
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = eventsTableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = "\(indexPath.row)"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 118
    }
}
