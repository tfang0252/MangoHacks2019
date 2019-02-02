//
//  LoginController.swift
//  MangoHacks2019
//
//  Created by Danny Santos on 2/2/19.
//  Copyright © 2019 Tony Fang. All rights reserved.
//

import UIKit
import Stevia

class LoginController: UIViewController, UITextViewDelegate {

    var selectedText = ""
    
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
        let ButtonStackView = UIStackView()
        let SignInBtn = PostButtons()
        let SignUpBtn = PostButtons()
        
        LoginStackView.addArrangedSubview(TitleLabel)
        LoginStackView.addArrangedSubview(UserName)
        LoginStackView.addArrangedSubview(Password)
        LoginStackView.addArrangedSubview(ButtonStackView)
        
        TitleLabel.text = "OMNI"
        TitleLabel.textAlignment = .center
        UserName.text = "Username"
        UserName.textColor = UIColor(red: 0.85, green: 0.85, blue: 0.85, alpha: 1.0)
        Password.text = "Password"
        Password.textColor = UIColor(red: 0.85, green: 0.85, blue: 0.85, alpha: 1.0)
        UserName.delegate = self
        Password.delegate = self
        UserName.layer.borderWidth = 0.5
        UserName.layer.cornerRadius = 5.0
        UserName.layer.borderColor = UIColor(red: 0.85, green: 0.85, blue: 0.85, alpha: 1.0).cgColor

        
        Password.layer.borderWidth = 0.5
        Password.layer.cornerRadius = 5.0
        Password.layer.borderColor = UIColor(red: 0.85, green: 0.85, blue: 0.85, alpha: 1.0).cgColor
        
        SignInBtn.text("Sign In")
        SignUpBtn.text("Sign Up")
        SignUpBtn.backgroundColor = .darkGray
        
        ButtonStackView.addArrangedSubview(SignUpBtn)
        ButtonStackView.addArrangedSubview(SignInBtn)
        
        ButtonStackView.sv(
            SignUpBtn,
            SignInBtn
        )
        
        SignUpBtn.width(100).height(30)
        SignInBtn.width(100).height(30)
        ButtonStackView.axis = .horizontal
        ButtonStackView.spacing = 5
        ButtonStackView.alignment = .fill
        ButtonStackView.distribution = .equalSpacing
        ButtonStackView.centerInContainer()
        ButtonStackView.width(200).height(30)

        SignInBtn.addTarget(self, action: #selector(SignInBtnClicked), for: .touchUpInside)
        SignUpBtn.addTarget(self, action: #selector(SignUpBtnClicked), for: .touchUpInside)
        //add subviews
        LoginStackView.sv(
            TitleLabel,
            UserName,
            Password,
            ButtonStackView
        )
        
        TitleLabel.centerHorizontally()
        UserName.width(150).height(30)
        Password.width(150).height(30)
        TitleLabel.width(150).height(50)
        LoginStackView.distribution = .equalSpacing
 
        LoginStackView.spacing = 10
        TitleLabel.font = UIFont(name: "Helvetica", size: 50)
        
        LoginStackView.axis = .vertical
        LoginStackView.alignment = .center
        
        webviewBG.sv(
            LoginStackView
        )
        
        LoginStackView.centerInContainer()
        LoginStackView.width(300).height(170)
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == UIColor(red: 0.85, green: 0.85, blue: 0.85, alpha: 1.0) {
            selectedText = textView.text
            textView.text = ""
            textView.textColor = UIColor.black
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = selectedText
            textView.textColor = UIColor(red: 0.85, green: 0.85, blue: 0.85, alpha: 1.0)
        }
    }
    
    @objc func SignInBtnClicked(sender: UIButton!) {
        let containerViewController: ContainerController = ContainerController()
        
        self.present(containerViewController, animated: true, completion: nil)
    }
    
    @objc func SignUpBtnClicked(sender: UIButton!) {
        print("SignUp Button Pushed")
//        let containerViewController: ContainerController = ContainerController()
//
//        self.present(containerViewController, animated: true, completion: nil)
    }
}
