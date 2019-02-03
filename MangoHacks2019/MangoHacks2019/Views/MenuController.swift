//
//  MenuController.swift
//  MangoHacks2019
//
//  Created by Zachary Frederick on 2/2/19.
//  Copyright © 2019 Tony Fang. All rights reserved.
//

import UIKit

private let reuseIdentifer = "MenuOptionCell"

class MenuController: UIViewController {
    
    // MARK: - Properties
    
    var tableView: UITableView!
    var profileStackView: UIStackView!
    var profileName: UILabel!
    var profileImage: UIImageView!
    var delegate: HomeControllerDelegate?
    
    var images: [UIImage] = [UIImage(named: "house-outline-2")!,
                             UIImage(named: "general")!,
                             UIImage(named: "eat")!,
                             UIImage(named: "do")!,
                             UIImage(named: "help")!,
                             UIImage(named: "settings-2")!,
                             UIImage(named: "logout-2.png")!]
    
    // MARK: - Init
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        configureProfileStackView()
        view.backgroundColor = UIColor(red:0.26, green:0.52, blue:0.96, alpha:1.0)
    }
    
    // MARK: - Handlers
    
    func configureTableView() {
        tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(MenuOptionCell.self, forCellReuseIdentifier: reuseIdentifer)
        tableView.backgroundColor = UIColor(red:0.26, green:0.52, blue:0.96, alpha:1.0)
        //tableView.separatorStyle = .none
        tableView.rowHeight = 80
        
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 200).isActive = true
    }
    
    func configureProfileStackView() {
        profileStackView = UIStackView()
        profileName = UILabel()
        profileImage = UIImageView(image: #imageLiteral(resourceName: "llama"))
        
        profileName.text = "Fachary Zrederick"
        profileName.textColor = .white
        profileStackView.addArrangedSubview(profileImage)
        profileStackView.addArrangedSubview(profileName)
        
        view.addSubview(profileStackView)
        
        profileStackView.translatesAutoresizingMaskIntoConstraints = false
        profileImage.translatesAutoresizingMaskIntoConstraints = false
        profileStackView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        profileStackView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        profileStackView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        profileStackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 50).isActive = true
        
        profileImage.heightAnchor.constraint(equalToConstant: 50).isActive = true
        profileImage.widthAnchor.constraint(equalToConstant: 150).isActive = true
        
    }
}

extension MenuController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return images.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifer, for: indexPath) as! MenuOptionCell
        
        let menuOption = MenuOption(rawValue: indexPath.row)
        cell.descriptionLabel.text = menuOption?.description
        cell.iconImageView.image = images[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let menuOption = MenuOption(rawValue: indexPath.row)
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifer, for: indexPath) as! MenuOptionCell
        cell.descriptionLabel.textColor = .black 
        delegate?.handleMenuToggle(forMenuOption: menuOption)
    }
    
}
