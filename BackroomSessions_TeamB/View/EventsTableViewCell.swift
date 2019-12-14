//
//  EventsTableViewCell.swift
//  BackroomSessions_TeamB
//
//  Created by Isumy Aguila on 12/13/19.
//  Copyright © 2019 Isumy Aguila. All rights reserved.
//
import UIKit

class EventsTableViewCell: UITableViewCell {
    
    //Properties
    
    //this is the background view of the cells
    lazy var cellBackView: UIView = {
        let cellView = UIView(frame: CGRect(x: 10, y: 6, width: self.frame.width - 20, height: 120))
        cellView .backgroundColor = UIColor(red: 240/255, green: 96/255, blue: 47/255, alpha: 0.8)
        
        return cellView
    }()
    
    lazy var eventImage: UIImageView = {
        let eventImage = UIImageView(frame: CGRect(x: 4, y: 6, width: -118, height: -118))
        eventImage.contentMode = .scaleAspectFit
        
        return eventImage
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 116, y: 8, width: cellBackView.frame.width - 116, height: 60))
        label.textAlignment = .left
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize:  18)
        
        return label
    }()
    
    lazy var cityLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 116, y: 42, width: cellBackView.frame.width - 116, height: 60))
        label.textAlignment = .left
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize:  18)
        
        return label
    }()
    
    //Init
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
        addSubview(cellBackView)
        cellBackView.addSubview(eventImage)
        cellBackView.addSubview(titleLabel)
        cellBackView.addSubview(cityLabel)
    }
    
    override func layoutSubviews() {
        contentView.backgroundColor = UIColor.clear
        backgroundColor = UIColor.clear
        cellBackView.layer.cornerRadius = 5
        cellBackView.clipsToBounds = true
        
        eventImage.layer.cornerRadius = 15
        eventImage.clipsToBounds = true
    }
}

