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
    }
    
    // Functions
    
    //This method configure the way the UI for the ArtistDetailController will look like.
    func configureDetailUI() {
        guard let artist = viewArtist else { return }
        let background = UIColor(patternImage: UIImage(named: "background") ?? UIImage())
        view.backgroundColor = background
        
        //Embedding Navigatoion Controller to Artist Detail ViewController
        navigationController?.navigationBar.barTintColor = .darkGray
        
        navigationController?.navigationBar.barStyle = .black
        
        navigationItem.title = artist.name
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "icons8-back-white").withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(handleDismissVC))
        
        configureDetailView()
    }
    
    //Selector function to dismiss the ViewController
    @objc func handleDismissVC(){
        self.navigationController!.popViewController(animated: true)
    }
    
    func textStyle(_ label: UILabel) {
        label.font = UIFont(name: "Avenir", size: 25)
        label.textColor = .white
        label.textAlignment = .left
        label.numberOfLines = 3
        label.lineBreakMode = .byWordWrapping
        label.adjustsFontSizeToFitWidth = true
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
            let label = UILabel(frame: CGRect(x: 0, y: 285.0, width:UIScreen.main.bounds.width, height: 30.0))
            label.text = "Name: \(artist.name ?? "")"
            
            return label
        }()
        
        let artistEmailLabel: UILabel = {
            let label = UILabel(frame: CGRect(x: 0, y: 330.0, width:UIScreen.main.bounds.width, height: 30.0))
            label.text = "Email: \(artist.email ?? "")"
            
            return label
        }()
        
        let artistNumberLabel: UILabel = {
            let label = UILabel(frame: CGRect(x: 0, y: 375.0, width:UIScreen.main.bounds.width, height: 30.0))
            label.text = "Number: \(artist.phoneNumber ?? "")"
            
            return label
        }()
        
        let artistYoutubeLabel: UILabel = {
            let label = UILabel(frame: CGRect(x: 0, y: 420.0, width:UIScreen.main.bounds.width, height: 30.0))
            label.text = "Youtube Link:"
            
            return label
        }()
        
        let youTubeLink: UITextView = {
            let link = UITextView(frame: CGRect(x: 0, y: 455.0, width:UIScreen.main.bounds.width, height: 30.0))
            link.text = artist.youtubeLink?.relativeString ?? ""
            link.dataDetectorTypes = UIDataDetectorTypes.link
            link.isEditable = false
            
            link.font = UIFont(name: "Avenir", size: 12)
            link.backgroundColor = UIColor(red: 240/255, green: 96/255, blue: 47/255, alpha: 0.8)
            link.tintColor = .white
            link.textAlignment = .left
            link.adjustsFontForContentSizeCategory = true
            
            return link
        }()
        
        let artistSoundcloudLabel: UILabel = {
            let label = UILabel(frame: CGRect(x: 0, y: 500.0, width:UIScreen.main.bounds.width, height: 30.0))
            label.text = "Soundcloud Link:"
            
            return label
        }()
        
        let soundcloudLink: UITextView = {
            let link = UITextView(frame: CGRect(x: 0, y: 535.0, width:UIScreen.main.bounds.width, height: 30.0))
            link.text = artist.soundcloudLink?.relativeString ?? ""
            link.dataDetectorTypes = UIDataDetectorTypes.link
            link.isEditable = false
            
            link.font = UIFont(name: "Avenir", size: 12)
            link.backgroundColor = UIColor(red: 240/255, green: 96/255, blue: 47/255, alpha: 0.8)
            link.tintColor = .white
            link.textAlignment = .left
            link.adjustsFontForContentSizeCategory = true
            
            return link
        }()
        
        let artistWebsiteLabel: UILabel = {
            let label = UILabel(frame: CGRect(x: 0, y: 570.0, width:UIScreen.main.bounds.width, height: 30.0))
            label.text = "Website:"
            
            return label
        }()
        
        let websiteLink: UITextView = {
            let link = UITextView(frame: CGRect(x: 0, y: 615.0, width:UIScreen.main.bounds.width, height: 30.0))
            link.text = artist.websiteLink?.relativeString ?? ""
            link.dataDetectorTypes = UIDataDetectorTypes.link
            link.isEditable = false
            
            link.font = UIFont(name: "Avenir", size: 12)
            link.backgroundColor = UIColor(red: 240/255, green: 96/255, blue: 47/255, alpha: 0.8)
            link.tintColor = .white
            link.textAlignment = .left
            link.adjustsFontForContentSizeCategory = true
            
            return link
        }()
        
        view.addSubview(artistImageView)
        view.addSubview(artistNameLabel)
        view.addSubview(artistEmailLabel)
        view.addSubview(artistNumberLabel)
        view.addSubview(artistYoutubeLabel)
        view.addSubview(youTubeLink)
        view.addSubview(artistSoundcloudLabel)
        view.addSubview(soundcloudLink)
        view.addSubview(artistWebsiteLabel)
        view.addSubview(websiteLink)
        
        textStyle(artistNameLabel)
        textStyle(artistEmailLabel)
        textStyle(artistNumberLabel)
        textStyle(artistYoutubeLabel)
        textStyle(artistSoundcloudLabel)
        textStyle(artistWebsiteLabel)
    }
}
