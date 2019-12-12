//
//  EventsController.swift
//  BackroomSessions_TeamB
//
//  Created by Isumy Aguila on 12/4/19.
//  Copyright © 2019 Isumy Aguila. All rights reserved.
//

import UIKit

class RegistrationController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    var registrationView: RegistrationView!
    var profileView: ProfileView!
    var artist: [Artist]!
    
    //delegate to link menucontroller with actions in the menu
    var delegate: HomeControllerDelegate?
    
    let persistenceManager: PersistenceManager!
    
    init(persistenceManager: PersistenceManager){
        self.persistenceManager = persistenceManager
        super.init(nibName:nil, bundle:nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Init
    override func loadView() {
        super.loadView()
    }
    
    override func viewDidLoad(){
        super.viewDidLoad()
        artist = registered()
        if(artist.count > 0){
            setupProfileView(artist: artist[0])
        }else{
            setupView()
        }
        configureRegistrationUI()
        persistenceManager?.save()
    }
    
    func registered() -> [Artist]{
        let allArtists = persistenceManager.fetch(Artist.self)
        for i in 0...allArtists.count{
            if(allArtists[i].registered == true){
                return [allArtists[i]]
            }
        }
        return [Artist()]
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    func setupView(){
        self.registrationView = RegistrationView(frame: self.view.frame)
        self.registrationView.registerAction = registerPressed
        self.registrationView.profileImageButtonAction = profileImageButtonPressed
        self.view.addSubview(registrationView)
        NSLayoutConstraint.activate([
            registrationView.topAnchor.constraint(equalTo: self.view.topAnchor),
            registrationView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            registrationView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            registrationView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            ])
    }
    
    func setupProfileView(artist: Artist){
        self.profileView = ProfileView(frame: self.view.frame)
        self.view.addSubview(profileView)
        NSLayoutConstraint.activate([
            profileView.topAnchor.constraint(equalTo: self.view.topAnchor),
            profileView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            profileView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            profileView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            ])
        self.profileView.artist = artist
        self.profileView.setup()
    }
    
    //create core data artist 
    func registerPressed(){
        print("register pressed")
        let artist = Artist(context: persistenceManager.context)
        artist.profilePicture = UIImageJPEGRepresentation(registrationView.profileImageView.image!, 1)! as NSData
        
        artist.name = registrationView.nameTextField.text
        artist.email = registrationView.emailTextField.text
        artist.phoneNumber = registrationView.phoneTextField.text
        artist.youtubeLink = NSURL(string: registrationView.youtubeLinkTextField.text!)! as URL
        artist.soundcloudLink = NSURL(string: registrationView.soundcloudLinkTextField.text!)! as URL
        artist.websiteLink = NSURL(string: registrationView.websiteLinkTextField.text!)! as URL
        artist.registered = true
        persistenceManager.save()
    }
    
    //Functions
    func configureRegistrationUI(){
        
        let background = UIColor(patternImage: UIImage(named: "background") ?? UIImage())
        view.backgroundColor = background
        
        //Embedding Navigatoion Controller to Events ViewController
        navigationController?.navigationBar.barTintColor = .darkGray
        
        navigationController?.navigationBar.barStyle = .black
        
        if(artist.count > 0){
             navigationItem.title = "Your Artist Information"
        }else{
             navigationItem.title = "Registration"
        }
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "icons8-back-white").withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(handleDismissVC))
    }
    
    //Selector function to dismiss the ViewController
    @objc func handleDismissVC(){
        dismiss(animated: true, completion: nil)
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
        if let editedImage = info[UIImagePickerControllerEditedImage] as? UIImage{
            self.registrationView.profileImageView.image = editedImage
        }else if let originalImage = info[UIImagePickerControllerOriginalImage] as? UIImage{
            self.registrationView.profileImageView.image = originalImage
        }
        dismiss(animated: true, completion: nil)
    }

}

