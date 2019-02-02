//
//  HomeController.swift
//  MangoHacks2019
//
//  Created by Zachary Frederick on 2/2/19.
//  Copyright © 2019 Tony Fang. All rights reserved.
//

import UIKit

class HomeController: UIViewController {
    
    // MARK: - Properties
    
    var delegate: HomeControllerDelegate?
    var postBtnStackView: UIStackView!
    var newPostBtn: UIButton!
    var pastPostBtn: UIButton!
    
    // MARK: - Init
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        configureNavigationBar()
        configurePostBtnStackView()
    }
    
    // MARK: - Handlers
    
    @objc func handleMenuToggle() {
        delegate?.handleMenuToggle(forMenuOption: nil)
    }
    
    func configureNavigationBar() {
        navigationController?.navigationBar.barTintColor = UIColor(red:0.26, green:0.52, blue:0.96, alpha:1.0)
        navigationController?.navigationBar.barStyle = .black
        
        navigationItem.title = "OMNI"
        self.navigationController!.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont(name: "Helvetica", size: 28.0)!]
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "ic_menu_white_3x-1").withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(handleMenuToggle))
    }
    
    func configurePostBtnStackView() {
        postBtnStackView = UIStackView()
        newPostBtn = PostButtons()
        pastPostBtn = PostButtons()
        
        newPostBtn.setTitle("New Post", for: .normal)
        pastPostBtn.setTitle("View Past Post", for: .normal)
       
       
        postBtnStackView.addArrangedSubview(newPostBtn)
        postBtnStackView.addArrangedSubview(pastPostBtn)
        postBtnStackView.distribution = .fillEqually
        postBtnStackView.alignment = .fill
        postBtnStackView.spacing = 10

        view.addSubview(postBtnStackView)
        
        postBtnStackView.translatesAutoresizingMaskIntoConstraints = false
        
        postBtnStackView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10).isActive = true
        postBtnStackView.heightAnchor.constraint(equalToConstant: 60).isActive = true
        postBtnStackView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10).isActive = true
        postBtnStackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
 
        
    }
}
