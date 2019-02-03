//
//  SignupController.swift
//  MangoHacks2019
//
//  Created by Tony Fang on 2/2/19.
//  Copyright © 2019 Tony Fang. All rights reserved.
//

import UIKit
import Stevia

class SignupController: UIViewController {
    
    var tableview: UITableView?
    var locChoices: UITableView?
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    func setupViews(){
        self.view.backgroundColor = .white
        
        let bgView = UIView()
        bgView.backgroundColor = UIColor(red:0.90, green:0.91, blue:0.95, alpha:1.0)
        bgView.layer.cornerRadius = 8
        bgView.layer.masksToBounds = true
        
        let nextButton = UIButton()
        nextButton.text("Continue")
        nextButton.layer.cornerRadius = 5
        nextButton.layer.masksToBounds = true
        nextButton.backgroundColor = UIColor(red:0.98, green:0.37, blue:0.38, alpha:1.0)
        nextButton.width(100).height(40)
        self.view.sv(
            bgView,
            nextButton
        )
        
        self.view.layout(
            650,
            |nextButton-35-|)
        
        let langSelect = UIButton()
        let locSelect = UIButton()
        
        let langImage = UIImageView(image: #imageLiteral(resourceName: "worldwide"))
        let locImage = UIImageView(image: #imageLiteral(resourceName: "maps-and-flags"))
        langImage.width(60).height(60)
        locImage.width(60).height(60)
        
        langSelect.width(280).height(50)
        locSelect.width(280).height(50)
        
        
        
        langSelect.backgroundColor = .white
        langSelect.layer.cornerRadius = 5
        langSelect.layer.masksToBounds = true
        locSelect.backgroundColor = .white
        locSelect.layer.cornerRadius = 5
        locSelect.layer.masksToBounds = true
        
        langSelect.addTarget(self, action: #selector(langBtnClicked), for: .touchUpInside)
        nextButton.addTarget(self, action: #selector(nextBtnClicked), for: .touchUpInside)
        bgView.sv([
            langSelect,
            locSelect,
            langImage,
            locImage
            ])
        langImage.centerVertically(-140).centerHorizontally()
        langSelect.centerVertically(-70).centerHorizontally()
        locImage.centerVertically(30).centerHorizontally()
        locSelect.centerVertically(100).centerHorizontally()
        
        
        bgView.width(350).height(400)
        bgView.centerInContainer()
    }
    
    @objc func langBtnClicked(sender: UIButton!) {
//        print("SignUp Button Pushed")
//        let popover = SignupDropDown()
//        popover.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
//
//        self.present(popover, animated: true) {
//            // The popover is visible.
//        }
    }
    
    @objc func nextBtnClicked(sender: UIButton!) {
        let containerViewController: ContainerController = ContainerController()
        self.present(containerViewController, animated: true, completion: nil)
    }
    
    
}
