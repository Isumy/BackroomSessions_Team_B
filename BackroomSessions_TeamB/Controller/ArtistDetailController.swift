//
//  ArtistDetailController.swift
//  BackroomSessions_TeamB
//
//  Created by Leila Adaza on 12/5/19.
//  Copyright © 2019 Isumy Aguila. All rights reserved.
//

import Foundation
import UIKit

class ArtistDetailController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    // Properties
    var viewArtist: Artist?
    var delegate: HomeControllerDelegate?       // Links controller with actions in the menu
    var rootController: UIViewController?
    
    // Init
    override func loadView() {
        super.loadView()
    }
    
    override func viewDidLoad(){
        super.viewDidLoad()
        configureDetailUI()
        configureDetailView()
    }
    
    // Functions
    
    //This method configure the way the UI for the EventsViewController will look like.
    func configureDetailUI() {
        guard let artist = viewArtist else { return }
        let background = UIColor(patternImage: UIImage(named: "background") ?? UIImage())
        view.backgroundColor = background
        
        //Embedding Navigatoion Controller to Events ViewController
        navigationController?.navigationBar.barTintColor = .darkGray
        
        navigationController?.navigationBar.barStyle = .black
        
        navigationItem.title = artist.name
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "icons8-back-white").withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(handleDismissVC))
    }
    
    //Selector function to dismiss the ViewController
    @objc func handleDismissVC(){
        self.navigationController!.popViewController(animated: true)
    }
    
    func textStyle(_ label: UILabel) {
        label.font = UIFont(name: "Avenir", size: 25)
        label.textColor = .white
        label.textAlignment = .center
        label.numberOfLines = 0
        label.lineBreakMode = .byClipping
        label.translatesAutoresizingMaskIntoConstraints = false
        label.allowsDefaultTighteningForTruncation = true
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.25
    }
    
    func configureDetailView() {
        guard let artist = viewArtist else { return }
        guard let artistPicture = artist.profilePicture else { return }
        
        let artistImageView: UIImageView = {
            let image = UIImageView(frame: CGRect(x: UIScreen.main.bounds.width / 2 - 100, y: 70.0, width:200, height: 200.0))
            image.image = UIImage(data: artistPicture as Data)
            image.contentMode = .scaleAspectFit
            return image
        }()
        
        let artistNameLabel: UILabel = {
            let label = UILabel(frame: CGRect(x: 0, y: 275.0, width:UIScreen.main.bounds.width, height: 60.0))
            label.textColor = .white
            label.text = "Name:\(artist.name ?? "")"
            return label
        }()
        
        let artistEmailLabel: UILabel = {
            let label = UILabel(frame: CGRect(x: 0, y: 340.0, width:UIScreen.main.bounds.width, height: 60.0))
            label.textColor = .white
            label.text = "Email:\(artist.email ?? "")"
            return label
        }()
        
        let artistNumberLabel: UILabel = {
            let label = UILabel(frame: CGRect(x: 0, y: 405.0, width:UIScreen.main.bounds.width, height: 60.0))
            label.textColor = .white
            label.text = "Number:\(artist.phoneNumber ?? "")"
            return label
        }()
        
        let artistYoutubeLabel: UILabel = {
            let label = UILabel(frame: CGRect(x: 0, y: 470.0, width:UIScreen.main.bounds.width, height: 60.0))
            label.textColor = .white
            label.text = "Youtube Link:\(artist.youtubeLink?.relativeString ?? "")"
            return label
        }()
        
        let artistSoundcloudLabel: UILabel = {
            let label = UILabel(frame: CGRect(x: 0, y: 535.0, width:UIScreen.main.bounds.width, height: 60.0))
            label.textColor = .white
            label.text = "Soundcloud Link:\(artist.soundcloudLink?.relativeString ?? "")"
            return label
        }()
        
        let artistWebsiteLabel: UILabel = {
            let label = UILabel(frame: CGRect(x: 0, y: 600.0, width:UIScreen.main.bounds.width, height: 60.0))
            label.textColor = .white
            label.text = "Website:\(artist.websiteLink?.relativeString ?? "")"
            return label
        }()
        
        view.addSubview(artistImageView)
        view.addSubview(artistNameLabel)
        view.addSubview(artistEmailLabel)
        view.addSubview(artistNumberLabel)
        view.addSubview(artistYoutubeLabel)
        view.addSubview(artistSoundcloudLabel)
        view.addSubview(artistWebsiteLabel)
        
        //let viewsDictionary = ["label1": artistEmailLabel, "label2": artistNumberLabel, "label3": artistYoutubeLabel, "label4": artistSoundcloudLabel, "label5": artistWebsiteLabel]
        
//        for label in viewsDictionary.keys {
//            view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[\(label)]|", options: [], metrics: nil, views: viewsDictionary as Any as! [String : Any]))
//        }
//
//        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-150-[label1]-20-[label2]-20-[label3]-20-[label4]-20-[label5]", options: [], metrics: nil, views: viewsDictionary as Any as! [String : Any]))
    }
}
