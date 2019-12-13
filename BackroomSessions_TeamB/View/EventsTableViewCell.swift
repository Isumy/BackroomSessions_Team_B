//
//  EventsTableViewCell.swift
//  BackroomSessions_TeamB
//
//  Created by Isumy Aguila on 12/13/19.
//  Copyright © 2019 Isumy Aguila. All rights reserved.
//

import UIKit

class EventsTableViewCell: UITableViewCell {
    
    lazy var cellBackView: UIView = {
        let cellView = UIView(frame: CGRect(x: 10, y: 6, width: self.frame.width - 20, height: 110))
        cellView .backgroundColor = UIColor(red: 240/255, green: 96/255, blue: 47/255, alpha: 0.8)
        
        return cellView
    }()

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        addSubview(cellBackView)
    }

    override func layoutSubviews() {
        contentView.backgroundColor = UIColor.clear
        backgroundColor = UIColor.clear
        cellBackView.layer.cornerRadius = 5
        cellBackView.clipsToBounds = true
        
    }
}
