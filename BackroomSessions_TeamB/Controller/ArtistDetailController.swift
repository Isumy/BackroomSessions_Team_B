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
    var artistNameLabel: UILabel!
    var artistEmailLabel: UILabel!
    var artistNumberLabel: UILabel!
    var artistYoutubeLabel: UILabel!
    var artistSoundcloudLabel: UILabel!
    var artistWebsiteLabel: UILabel!
    var artistImage: UIImage!
    var delegate: HomeControllerDelegate?       // Links controller with actions in the menu
    var rootController: UIViewController?
    
    // Init
    override func loadView() {
        super.loadView()
    }
    
    override func viewDidLoad(){
        super.viewDidLoad()
        configureDetailView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        configureDetailUI()
        configurePicture()
    }
    
    // Functions
    func addNameLabel() {
        guard let artist = viewArtist else { return }
        artistNameLabel = UILabel()
        
        artistNameLabel.text = artist.name
        
        let background = UIColor(patternImage: UIImage(named: "background") ?? UIImage())
        view.backgroundColor = background
        view.addSubview(artistNameLabel)
        
        artistNameLabel.backgroundColor = UIColor(red: 240/255, green: 96/255, blue: 47/255, alpha: 0.8)
        artistNameLabel.font = UIFont(name: "Avenir", size: 30)
        artistNameLabel.textColor = .white
        artistNameLabel.textAlignment = .center
        artistNameLabel.numberOfLines = 0
        artistNameLabel.lineBreakMode = .byClipping
        artistNameLabel.translatesAutoresizingMaskIntoConstraints = false
        artistNameLabel.allowsDefaultTighteningForTruncation = true
        artistNameLabel.adjustsFontSizeToFitWidth = true
        artistNameLabel.minimumScaleFactor = 0.25
        
        artistNameLabel.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        artistNameLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        artistNameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        artistNameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 50).isActive = true
//        artistNameLabel.bottomAnchor.constraint(equalTo: view.topAnchor, constant: 50).isActive = true

//        if artist.picture == nil {
//            artistNameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 50).isActive = true
//        } else {
//            view.addSubview(imageView)
//            imageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 50).isActive = true
////            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
//            imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
//            artistNameLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor).isActive = true
//        }
    }
    
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
    
    func configurePicture() {
        guard let artist = viewArtist, let artistPicture = artist.profilePicture else { return }
        
        artistImage = UIImage(data: artistPicture as Data, scale: 1.0)
        let imageView = UIImageView(image: artistImage)
        imageView.frame = CGRect(x: UIScreen.main.bounds.width / 2 - 100, y: 5.0, width:200, height: 200.0)
        imageView.contentMode = .scaleAspectFit
    
        view.addSubview(imageView)
        
//        imageView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
//        imageView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        imageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 50).isActive = true
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
        
        artistEmailLabel = UILabel()
        artistEmailLabel.text = "Email:\n\(artist.email ?? "")"
        
        artistNumberLabel = UILabel()
        artistNumberLabel.text = "Phone Number:\n\(artist.phoneNumber ?? "")"
        
        artistYoutubeLabel = UILabel()
        artistYoutubeLabel.text = "YouTube Link:\n\(artist.youtubeLink?.absoluteString ?? "")"
        
        artistSoundcloudLabel = UILabel()
        artistSoundcloudLabel.text = "SoundCloud Link:\n\(artist.soundcloudLink?.absoluteString ?? "")"
        
        artistWebsiteLabel = UILabel()
        artistWebsiteLabel.text = "Website Link:\n\(artist.websiteLink?.absoluteString ?? "")"
        
        view.addSubview(artistEmailLabel)
        view.addSubview(artistNumberLabel)
        view.addSubview(artistYoutubeLabel)
        view.addSubview(artistSoundcloudLabel)
        view.addSubview(artistWebsiteLabel)
        
        textStyle(artistEmailLabel)
        textStyle(artistNumberLabel)
        textStyle(artistYoutubeLabel)
        textStyle(artistSoundcloudLabel)
        textStyle(artistWebsiteLabel)
        
        let viewsDictionary = ["label1": artistEmailLabel, "label2": artistNumberLabel, "label3": artistYoutubeLabel, "label4": artistSoundcloudLabel, "label5": artistWebsiteLabel]
        
        for label in viewsDictionary.keys {
            view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[\(label)]|", options: [], metrics: nil, views: viewsDictionary as Any as! [String : Any]))
        }
        
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-150-[label1]-20-[label2]-20-[label3]-20-[label4]-20-[label5]", options: [], metrics: nil, views: viewsDictionary as Any as! [String : Any]))
    }
    
    func profileImageButtonPressed(){
        print("profileImageButton pressed")
        showImagePickerControllerActionSheet()
    }
    
    func showImagePickerControllerActionSheet(){
        let alert = UIAlertController(title: "Profile Picture", message: "Please select a source type", preferredStyle: .actionSheet)
        
        alert.addAction(UIAlertAction(title: "Camera", style: .default , handler:{ (UIAlertAction)in
            print("Camera selected")
            self.showImagePickerController(sourceType: "Camera")
        }))
        
        alert.addAction(UIAlertAction(title: "Photo Library", style: .default , handler:{ (UIAlertAction)in
            print("Photo Library selected")
            self.showImagePickerController(sourceType: "Photo Library")
        }))
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .destructive, handler:nil))
        
        self.present(alert, animated: true, completion: {
            print("completion block")
        })
    }
    
    func showImagePickerController(sourceType: String){
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        imagePickerController.allowsEditing = true
        if(sourceType == "Camera"){
            imagePickerController.sourceType = .camera
        }else{
            imagePickerController.sourceType = .photoLibrary
        }
        present(imagePickerController, animated:true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]){
        if let editedImage = info[UIImagePickerControllerEditedImage] as? UIImage {
            self.artistImage = editedImage
        }else if let originalImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            self.artistImage = originalImage
        }
        dismiss(animated: true, completion: nil)
    }
}
