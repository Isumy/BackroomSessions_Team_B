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

class RegistrationView: UIView{
    
    override init(frame: CGRect){
        super.init(frame: frame)
        setup()
    }
    
    func setup(){
        backgroundColor = UIColor(patternImage: UIImage(named: "background") ?? UIImage())
        addSubview(nameTextField)
        addSubview(emailTextField)
        addSubview(phoneTextField)
        addSubview(soundcloudLinkTextField)
        addSubview(youtubeLinkTextField)
        addSubview(websiteLinkTextField)
        addSubview(registerButton)
    }
    
    let nameTextField: UITextField = {
        let tf = UITextField(frame: CGRect(x: 5.0, y: 40.0, width:UIScreen.main.bounds.width - 10, height: 40.0))
        tf.borderStyle = .none
        tf.layer.cornerRadius = 5
        tf.backgroundColor = UIColor(red:216/255, green:216/255, blue:216/255, alpha: 0.2)
        tf.textColor = UIColor(white:0.9, alpha: 0.8)
        tf.font = UIFont.systemFont(ofSize: 20)
        tf.autocorrectionType = .no
        
        //placeholder
        var placeholder = NSMutableAttributedString()
        placeholder = NSMutableAttributedString(attributedString: NSAttributedString(string: "Name", attributes: [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 18), .foregroundColor: UIColor(white: 1, alpha: 0.7)]))
        tf.attributedPlaceholder = placeholder
        return tf
    }()
    
    let emailTextField: UITextField = {
        let tf = UITextField(frame: CGRect(x: 5.0, y: 85.0, width:UIScreen.main.bounds.width - 10, height: 40.0))
        tf.borderStyle = .none
        tf.layer.cornerRadius = 5
        tf.backgroundColor = UIColor(red:216/255, green:216/255, blue:216/255, alpha: 0.2)
        tf.textColor = UIColor(white:0.9, alpha: 0.8)
        tf.font = UIFont.systemFont(ofSize: 20)
        tf.keyboardType = .emailAddress
        tf.autocorrectionType = .no
        
        //placeholder
        var placeholder = NSMutableAttributedString()
        placeholder = NSMutableAttributedString(attributedString: NSAttributedString(string: "Email", attributes: [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 18), .foregroundColor: UIColor(white: 1, alpha: 0.7)]))
        tf.attributedPlaceholder = placeholder
        return tf
    }()
    
    let phoneTextField: UITextField = {
        let tf = UITextField(frame: CGRect(x: 5.0, y: 130.0, width:UIScreen.main.bounds.width - 10, height: 40.0))
        tf.borderStyle = .none
        tf.layer.cornerRadius = 5
        tf.backgroundColor = UIColor(red:216/255, green:216/255, blue:216/255, alpha: 0.2)
        tf.textColor = UIColor(white:0.9, alpha: 0.8)
        tf.font = UIFont.systemFont(ofSize: 20)
        tf.keyboardType = .numberPad
        tf.autocorrectionType = .no
        
        //placeholder
        var placeholder = NSMutableAttributedString()
        placeholder = NSMutableAttributedString(attributedString: NSAttributedString(string: "Phone Number", attributes: [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 18), .foregroundColor: UIColor(white: 1, alpha: 0.7)]))
        tf.attributedPlaceholder = placeholder
        return tf
    }()
    
    let youtubeLinkTextField: UITextField = {
        let tf = UITextField(frame: CGRect(x: 5.0, y: 175.0, width:UIScreen.main.bounds.width - 10, height: 40.0))
        tf.borderStyle = .none
        tf.layer.cornerRadius = 5
        tf.backgroundColor = UIColor(red:216/255, green:216/255, blue:216/255, alpha: 0.2)
        tf.textColor = UIColor(white:0.9, alpha: 0.8)
        tf.font = UIFont.systemFont(ofSize: 20)
        tf.keyboardType = .URL
        tf.autocorrectionType = .no
        
        //placeholder
        var placeholder = NSMutableAttributedString()
        placeholder = NSMutableAttributedString(attributedString: NSAttributedString(string: "Youtube Link", attributes: [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 18), .foregroundColor: UIColor(white: 1, alpha: 0.7)]))
        tf.attributedPlaceholder = placeholder
        return tf
    }()
    
    let soundcloudLinkTextField: UITextField = {
        let tf = UITextField(frame: CGRect(x: 5.0, y: 220.0, width:UIScreen.main.bounds.width - 10, height: 40.0))
        tf.borderStyle = .none
        tf.layer.cornerRadius = 5
        tf.backgroundColor = UIColor(red:216/255, green:216/255, blue:216/255, alpha: 0.2)
        tf.textColor = UIColor(white:0.9, alpha: 0.8)
        tf.font = UIFont.systemFont(ofSize: 20)
         tf.keyboardType = .URL
        tf.autocorrectionType = .no
        
        //placeholder
        var placeholder = NSMutableAttributedString()
        placeholder = NSMutableAttributedString(attributedString: NSAttributedString(string: "Soundcloud Link", attributes: [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 18), .foregroundColor: UIColor(white: 1, alpha: 0.7)]))
        tf.attributedPlaceholder = placeholder
        return tf
    }()
    
    let websiteLinkTextField: UITextField = {
        let tf = UITextField(frame: CGRect(x: 5.0, y: 265.0, width:UIScreen.main.bounds.width - 10, height: 40.0))
        tf.borderStyle = .none
        tf.layer.cornerRadius = 5
        tf.backgroundColor = UIColor(red:216/255, green:216/255, blue:216/255, alpha: 0.2)
        tf.textColor = UIColor(white:0.9, alpha: 0.8)
        tf.font = UIFont.systemFont(ofSize: 20)
        tf.keyboardType = .URL
        tf.autocorrectionType = .no
        
        //placeholder
        var placeholder = NSMutableAttributedString()
        placeholder = NSMutableAttributedString(attributedString: NSAttributedString(string: "Website Link", attributes: [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 18), .foregroundColor: UIColor(white: 1, alpha: 0.7)]))
        tf.attributedPlaceholder = placeholder
        return tf
    }()
    
    let registerButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 5.0, y: 310.0, width:UIScreen.main.bounds.width - 10, height: 40.0))
        let attributedString = NSMutableAttributedString(attributedString: NSAttributedString(string: "Register", attributes: [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 19), .foregroundColor: UIColor.white]))
        button.setAttributedTitle(attributedString, for: .normal)
        button.layer.cornerRadius = 5
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor(red:255/255, green: 127/255, blue: 80/255, alpha: 1).cgColor
        return button
    }()
    
    func mainStackView() -> UIStackView{
        let stackView = UIStackView(arrangedSubviews: [nameTextField, emailTextField, phoneTextField, soundcloudLinkTextField, youtubeLinkTextField, websiteLinkTextField, registerButton])
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        stackView.spacing = 10
        return stackView
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
