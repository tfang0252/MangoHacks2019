//
//  LoginController.swift
//  MangoHacks2019
//
//  Created by Danny Santos on 2/2/19.
//  Copyright © 2019 Tony Fang. All rights reserved.
//

import UIKit
import Stevia

class LoginController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        SetUpViews()

        // Do any additional setup after loading the view.
    }
    
    func SetUpViews() {
        //let loginBg = UIImageView (image: #imageLiteral(resourceName: "gifback.gif"))
        let filePath = Bundle.main.path(forResource: "gif9", ofType: "gif")
        let gif = NSData(contentsOfFile: filePath!)
        let webviewBG = UIWebView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height))
        webviewBG.load(gif! as Data,mimeType: "image/gif", textEncodingName: "utf-8", baseURL: NSURL() as URL)
        self.view.sv(webviewBG)
        webviewBG.fillContainer()
        
        let TitleLabel = UILabel()
        let UserName = UITextView()
        let Password = UITextView()
        let LoginStackView = UIStackView()
        
        LoginStackView.addArrangedSubview(TitleLabel)
        LoginStackView.addArrangedSubview(UserName)
        LoginStackView.addArrangedSubview(Password)
        
        TitleLabel.text = "OMNI"
        UserName.text = "Username"
        UserName.textColor = UIColor(red: 0.85, green: 0.85, blue: 0.85, alpha: 1.0)
        Password.text = "Password"
        Password.textColor = UIColor(red: 0.85, green: 0.85, blue: 0.85, alpha: 1.0)
        
        UserName.layer.borderWidth = 0.5
        UserName.layer.cornerRadius = 5.0
        UserName.layer.borderColor = UIColor(red: 0.85, green: 0.85, blue: 0.85, alpha: 1.0).cgColor

        
        Password.layer.borderWidth = 0.5
        Password.layer.cornerRadius = 5.0
        Password.layer.borderColor = UIColor(red: 0.85, green: 0.85, blue: 0.85, alpha: 1.0).cgColor
        
        //add subviews
        LoginStackView.sv(
            TitleLabel,
            UserName,
            Password
        )
        UserName.width(150).height(30)
        Password.width(150).height(30)
        TitleLabel.width(150).height(50)
        LoginStackView.distribution = .equalSpacing
        //LoginStackView.spacing = 15
        TitleLabel.font = UIFont(name: "Helvetica", size: 50)
        
        LoginStackView.axis = .vertical
        LoginStackView.alignment = .center
        
        webviewBG.sv(
            LoginStackView
        )
        
        LoginStackView.centerInContainer()
        LoginStackView.width(300).height(150)
        
        //add constraints
//        self.view.layout(
//        //10,
//        // |-50-view1-50-| ~ 50,
//        // 10,
//        // |-50-view2-50-| ~ 50
//        )
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
