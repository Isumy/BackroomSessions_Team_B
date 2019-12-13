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
    /////*****Only for testing
  
    
    //********
    
    var eventsTableView = UITableView()
     var rootController: UIViewController?
    var delegate: HomeControllerDelegate?
    
    let backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill//.scaleAspectFill
        imageView.image = UIImage(named: "background")
        
        return imageView
    }()
    
    /////*****Only for testing, delete after core data
    var eventArray = [EventModal]()
    
    //********
    //Initialize
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTableView()
        //view.backgroundColor = .red
        
        /////*****Only for testing, needs to be deleted after implementing core data
        
        eventArray.append(EventModal(eventImage: #imageLiteral(resourceName: "nov20"), eventTitle: "Tampa Event", eventCity: "Tampa"))
        eventArray.append(EventModal(eventImage: #imageLiteral(resourceName: "Nov23"), eventTitle: "New York Event", eventCity: "New York"))
        eventArray.append(EventModal(eventImage: #imageLiteral(resourceName: "nov20"), eventTitle: "MiamiEvent", eventCity: "Miami"))
        
        //********
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
        return eventArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = eventsTableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? EventsTableViewCell else {fatalError("Unable to create cell") }
        cell.eventImage.image = eventArray[indexPath.row].eventImage
        cell.titleLabel.text = eventArray[indexPath.row].eventTitle
        cell.cityLabel.text = eventArray[indexPath.row].eventCity
        
        //cell.textLabel?.text = "\(indexPath.row)"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 118
    }
}

//class created to test passing data to cellview, I need to change it to core data
class EventModal{
    var eventImage: UIImage?
    var eventTitle: String?
    var eventCity: String?
    
    init(eventImage: UIImage, eventTitle: String, eventCity: String){
        
        self.eventImage = eventImage
        self.eventTitle = eventTitle
        self.eventCity = eventCity
    }
}
