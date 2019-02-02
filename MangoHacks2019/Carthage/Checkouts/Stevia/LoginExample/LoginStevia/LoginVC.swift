//
//  ViewController.swift
//  LoginStevia
//
//  Created by Sacha Durand Saint Omer on 01/10/15.
//  Copyright © 2015 Sacha Durand Saint Omer. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {

    var v: LoginViewStevia!
    override func loadView() {
        v = LoginViewStevia()
        view = v
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Link actions
        v.login.addTarget(self, action: #selector(login), for: .touchUpInside)
        
        // Here we want to reload the view after injection
        // this is only needed for live reload
        on("INJECTION_BUNDLE_NOTIFICATION") {
            self.loadView()
        }
    }
    
    @objc
    func login() {
        print("login tapped")
    }
}

