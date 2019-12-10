//
//  RegistrationView.swift
//  BackroomSessions_TeamB
//
//  Created by Genesis Barrios on 12/9/19.
//  Copyright © 2019 Isumy Aguila. All rights reserved.
//

//Necessary properties of an Artist object
//var name: String
//var email: String
//var phoneNumber: String
//var youtubeLink: URL?
//var soundcloudLink: URL?
//var websiteLink: URL?
//var picture: UIImage?

import UIKit

class RegistrationView: UIView, UITextFieldDelegate{
    
    var registerAction: (() -> Void)?
    var profileImageButtonAction: (() -> Void)?
    
    override init(frame: CGRect){
        super.init(frame: frame)
        setup()
    }
    
    func setup(){
        addSubview(scrollView)
        scrollView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        scrollView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        scrollView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        scrollView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 10)
        
        scrollView.addSubview(profileImageButton)
        scrollView.addSubview(profileImageView)
        scrollView.addSubview(nameTextField)
        scrollView.addSubview(emailTextField)
        scrollView.addSubview(phoneTextField)
        scrollView.addSubview(youtubeLinkTextField)
        scrollView.addSubview(soundcloudLinkTextField)
        scrollView.addSubview(websiteLinkTextField)
        scrollView.addSubview(registerButton)
        
        self.nameTextField.delegate = self
        self.emailTextField.delegate = self
        self.phoneTextField.delegate = self
        self.soundcloudLinkTextField.delegate = self
        self.youtubeLinkTextField.delegate = self
        self.websiteLinkTextField.delegate = self
    }
    
    let scrollView: UIScrollView = {
        let view = UIScrollView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentSize.height = 1000
        view.backgroundColor = UIColor(patternImage: UIImage(named: "background") ?? UIImage())
       return view
    }()
    
    let profileImageView: UIImageView = {
        let iv = UIImageView(frame: CGRect(x: UIScreen.main.bounds.width / 2 - 100, y: 30.0, width:200, height: 200.0))
        iv.contentMode = .scaleAspectFit
        return iv
    }()
    
    let profileImageButton: UIButton = {
        let button = UIButton(frame: CGRect(x: UIScreen.main.bounds.width / 2 - 100, y: 30.0, width:200, height: 200.0))
        
        let attributedString = NSMutableAttributedString(attributedString: NSAttributedString(string: "+", attributes: [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 25), .foregroundColor: UIColor.white]))
        button.setAttributedTitle(attributedString, for: .normal)
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor(red:255/255, green: 127/255, blue: 80/255, alpha: 1).cgColor
        button.backgroundColor = .clear
        button.layer.masksToBounds = true
        button.addTarget(self, action: #selector(profileImageButtonTapped), for: .touchUpInside)
        return button
    }()
    
    @objc func profileImageButtonTapped(){
        profileImageButtonAction?()
    }
    
    let nameTextField: UITextField = {
        let tf = UITextField(frame: CGRect(x: 5.0, y: 235.0, width:UIScreen.main.bounds.width - 10, height: 60.0))
        tf.borderStyle = .none
        tf.layer.cornerRadius = 5
        tf.backgroundColor = UIColor(red:216/255, green:216/255, blue:216/255, alpha: 0.4)
        tf.textColor = UIColor(white:0.9, alpha: 0.8)
        tf.font = UIFont.systemFont(ofSize: 20)
        tf.autocorrectionType = .no
        
        //placeholder
        var placeholder = NSMutableAttributedString()
        placeholder = NSMutableAttributedString(attributedString: NSAttributedString(string: "Name", attributes: [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 20), .foregroundColor: UIColor(white: 1, alpha: 0.8)]))
        tf.attributedPlaceholder = placeholder
        return tf
    }()
    
    let emailTextField: UITextField = {
        let tf = UITextField(frame: CGRect(x: 5.0, y: 300.0, width:UIScreen.main.bounds.width - 10, height: 60.0))
        tf.borderStyle = .none
        tf.layer.cornerRadius = 5
        tf.backgroundColor = UIColor(red:216/255, green:216/255, blue:216/255, alpha: 0.4)
        tf.textColor = UIColor(white:0.9, alpha: 0.8)
        tf.font = UIFont.systemFont(ofSize: 20)
        tf.keyboardType = .emailAddress
        tf.autocorrectionType = .no
        
        //placeholder
        var placeholder = NSMutableAttributedString()
        placeholder = NSMutableAttributedString(attributedString: NSAttributedString(string: "Email", attributes: [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 20), .foregroundColor: UIColor(white: 1, alpha: 0.8)]))
        tf.attributedPlaceholder = placeholder
        return tf
    }()
    
    let phoneTextField: UITextField = {
        let tf = UITextField(frame: CGRect(x: 5.0, y: 365.0, width:UIScreen.main.bounds.width - 10, height: 60.0))
        tf.borderStyle = .none
        tf.layer.cornerRadius = 5
        tf.backgroundColor = UIColor(red:216/255, green:216/255, blue:216/255, alpha: 0.4)
        tf.textColor = UIColor(white:0.9, alpha: 0.8)
        tf.font = UIFont.systemFont(ofSize: 20)
        tf.keyboardType = .numberPad
        tf.autocorrectionType = .no
        
        //placeholder
        var placeholder = NSMutableAttributedString()
        placeholder = NSMutableAttributedString(attributedString: NSAttributedString(string: "Phone Number", attributes: [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 20), .foregroundColor: UIColor(white: 1, alpha: 0.8)]))
        tf.attributedPlaceholder = placeholder
        return tf
    }()
    
    let youtubeLinkTextField: UITextField = {
        let tf = UITextField(frame: CGRect(x: 5.0, y: 430.0, width:UIScreen.main.bounds.width - 10, height: 60.0))
        tf.borderStyle = .none
        tf.layer.cornerRadius = 5
        tf.backgroundColor = UIColor(red:216/255, green:216/255, blue:216/255, alpha: 0.4)
        tf.textColor = UIColor(white:0.9, alpha: 0.8)
        tf.font = UIFont.systemFont(ofSize: 20)
        tf.keyboardType = .URL
        tf.autocorrectionType = .no
        
        //placeholder
        var placeholder = NSMutableAttributedString()
        placeholder = NSMutableAttributedString(attributedString: NSAttributedString(string: "Youtube Link", attributes: [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 20), .foregroundColor: UIColor(white: 1, alpha: 0.8)]))
        tf.attributedPlaceholder = placeholder
        return tf
    }()
    
    let soundcloudLinkTextField: UITextField = {
        let tf = UITextField(frame: CGRect(x: 5.0, y: 495.0, width:UIScreen.main.bounds.width - 10, height: 60.0))
        tf.borderStyle = .none
        tf.layer.cornerRadius = 5
        tf.backgroundColor = UIColor(red:216/255, green:216/255, blue:216/255, alpha: 0.4)
        tf.textColor = UIColor(white:0.9, alpha: 0.8)
        tf.font = UIFont.systemFont(ofSize: 20)
         tf.keyboardType = .URL
        tf.autocorrectionType = .no
        
        //placeholder
        var placeholder = NSMutableAttributedString()
        placeholder = NSMutableAttributedString(attributedString: NSAttributedString(string: "Soundcloud Link", attributes: [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 20), .foregroundColor: UIColor(white: 1, alpha: 0.8)]))
        tf.attributedPlaceholder = placeholder
        return tf
    }()
    
    let websiteLinkTextField: UITextField = {
        let tf = UITextField(frame: CGRect(x: 5.0, y: 560.0, width:UIScreen.main.bounds.width - 10, height: 60.0))
        tf.borderStyle = .none
        tf.layer.cornerRadius = 5
        tf.backgroundColor = UIColor(red:216/255, green:216/255, blue:216/255, alpha: 0.4)
        tf.textColor = UIColor(white:0.9, alpha: 0.8)
        tf.font = UIFont.systemFont(ofSize: 20)
        tf.keyboardType = .URL
        tf.autocorrectionType = .no
        
        //placeholder
        var placeholder = NSMutableAttributedString()
        placeholder = NSMutableAttributedString(attributedString: NSAttributedString(string: "Website Link", attributes: [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 20), .foregroundColor: UIColor(white: 1, alpha: 0.8)]))
        tf.attributedPlaceholder = placeholder
        return tf
    }()
    
    let registerButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 5.0, y: 625.0, width:UIScreen.main.bounds.width - 10, height: 60.0))
        let attributedString = NSMutableAttributedString(attributedString: NSAttributedString(string: "Register", attributes: [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 19), .foregroundColor: UIColor.white]))
        button.setAttributedTitle(attributedString, for: .normal)
        button.layer.cornerRadius = 5
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor(red:255/255, green: 127/255, blue: 80/255, alpha: 1).cgColor
        button.addTarget(self, action: #selector(handleRegistration), for: .touchUpInside)
        return button
    }()
    
    @objc func handleRegistration(){
        registerAction?()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
