//
//  HomeController.swift
//  BackroomSessions_TeamB
//
//  Created by Isumy Aguila on 12/4/19.
//  Copyright © 2019 Isumy Aguila. All rights reserved.
//

import Foundation
import UIKit

class HomeController: UIViewController{
    
    //Properties
    
    //this variable links eachother the Home and Menu controllers
    var delegate: HomeControllerDelegate?
    
    let backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill//.scaleAspectFill
        imageView.image = UIImage(named: "HomeBackground")
        
        return imageView
    }()
    
    //Init
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let backgroundImageView: UIImageView = {
            let imageView = UIImageView()
            imageView.contentMode = .scaleToFill//.scaleAspectFill
            imageView.image = UIImage(named: "HomeBackground")
            
            return imageView
        }()
        view.addSubview(backgroundImageView)
        
      
        //view.backgroundColor = .white
        configureNavigationBar()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        view.addSubview(backgroundImageView)
        
    }
    
    //Functions
    func configureNavigationBar(){
        
        //Setting backgroun image view
        
       let background = UIColor(patternImage: UIImage(named: "HomeBackground") ?? UIImage())
       view.backgroundColor = background
        

        
        navigationController?.navigationBar.barTintColor = .darkGray
        navigationController?.navigationBar.barStyle = .black
        // navigationController?.navigationBar.setBackgroundImage(#imageLiteral(resourceName: "BRS_LOGO_SINGLE"), for: .top, barMetrics: .compact)// = true
        navigationItem.title = "Backroom Sessions"
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "ic_menu_white_3x").withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(handleMenuToggle))
       
      
        
    }
    
     @objc func handleMenuToggle() {
        //this code is executed when the hambuguer menu is pressed
        delegate?.handleMenuToggle(forMenuOption: nil)
    }
    
}
