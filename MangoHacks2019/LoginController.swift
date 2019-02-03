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
    let LoginStackView = UIStackView()
    var isPressed = false
    
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
        webviewBG.scrollView.contentInset = UIEdgeInsets(top: -20, left: 0, bottom: 0, right: 0)
        self.view.sv(webviewBG)
        webviewBG.fillContainer()
        
        let TitleLabel = UILabel()
        let UserName = UITextView()
        let Password = UITextView()
        let ConfirmPassword = UITextView()
        let LoginStackView = UIStackView()
        let ButtonStackView = UIStackView()
        let SignInBtn = PostButtons()
        let SignUpBtn = PostButtons()
        
        LoginStackView.addArrangedSubview(TitleLabel)
        LoginStackView.addArrangedSubview(UserName)
        LoginStackView.addArrangedSubview(Password)
        LoginStackView.addArrangedSubview(ConfirmPassword)
        LoginStackView.addArrangedSubview(ButtonStackView)
        
        TitleLabel.text = "OMNI"
        TitleLabel.textAlignment = .center
        UserName.text = "Username"
        UserName.textColor = UIColor(red: 0.85, green: 0.85, blue: 0.85, alpha: 1.0)
        Password.text = "Password"
        Password.textColor = UIColor(red: 0.85, green: 0.85, blue: 0.85, alpha: 1.0)
        ConfirmPassword.text = "Confirm Password"
        ConfirmPassword.textColor = UIColor(red: 0.85, green: 0.85, blue: 0.85, alpha: 1.0)
        UserName.delegate = self
        Password.delegate = self
        ConfirmPassword.delegate = self
        UserName.layer.borderWidth = 0.5
        UserName.layer.cornerRadius = 5.0
        UserName.layer.borderColor = UIColor(red: 0.85, green: 0.85, blue: 0.85, alpha: 1.0).cgColor

        
        Password.layer.borderWidth = 0.5
        Password.layer.cornerRadius = 5.0
        Password.layer.borderColor = UIColor(red: 0.85, green: 0.85, blue: 0.85, alpha: 1.0).cgColor
        
        ConfirmPassword.layer.borderWidth = 0.5
        ConfirmPassword.layer.cornerRadius = 5.0
        ConfirmPassword.layer.borderColor = UIColor(red: 0.85, green: 0.85, blue: 0.85, alpha: 1.0).cgColor
        
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

        if !isPressed {
            LoginStackView.width(420).height(200)
            SignInBtn.addTarget(self, action: #selector(SignInBtnClicked), for: .touchUpInside)
        } else {
            LoginStackView.width(420).height(250)
            SignUpBtn.isHidden = true
            SignInBtn.width(420)
            SignInBtn.text("Create Profile")
            SignInBtn.addTarget(self, action: #selector(SignInBtnClickedV2), for: .touchUpInside)
        }

        
        SignUpBtn.addTarget(self, action: #selector(SignUpBtnClicked), for: .touchUpInside)
        //add subviews
        LoginStackView.sv(
            TitleLabel,
            UserName,
            Password,
            ConfirmPassword,
            ButtonStackView
        )
        
        TitleLabel.centerHorizontally()
        UserName.width(200).height(40)
        Password.width(200).height(40)
        ConfirmPassword.width(200).height(40)
        TitleLabel.width(150).height(50)
        LoginStackView.distribution = .equalSpacing
        
        UserName.font = .systemFont(ofSize: 18)
        Password.font = .systemFont(ofSize: 18)
        ConfirmPassword.font = .systemFont(ofSize: 18)
 
        LoginStackView.spacing = 10
        TitleLabel.font = UIFont(name: "Helvetica", size: 50)
        
        LoginStackView.axis = .vertical
        LoginStackView.alignment = .center
        
        webviewBG.sv(
            LoginStackView
        )
        
        LoginStackView.centerInContainer()
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
        //let containerViewController: ContainerController = ContainerController()
        let containerViewController: ContainerController = ContainerController()
        self.present(containerViewController, animated: true, completion: nil)
    }
    
    @objc func SignInBtnClickedV2(sender: UIButton!) {
        //let containerViewController: ContainerController = ContainerController()
        let containerViewController: SignupController = SignupController()
        self.present(containerViewController, animated: true, completion: nil)
    }
    
    @objc func SignUpBtnClicked(sender: UIButton!) {
        print("SignUp Button Pushed")
//        LoginStackView.width(420).height(200)
        isPressed = true
        self.viewDidLoad()
    }
}
