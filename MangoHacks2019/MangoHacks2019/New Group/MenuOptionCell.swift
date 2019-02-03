//
//  MenuOptionCell.swift
//  MangoHacks2019
//
//  Created by Zachary Frederick on 2/2/19.
//  Copyright © 2019 Tony Fang. All rights reserved.
//

import UIKit
import Stevia

class MenuOptionCell: UITableViewCell {
    
    // MARK: - Properties
    
    let iconImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        return iv
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 16)
        label.text = "Sample text"
        return label
    }()
    
    // MARK: - Init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = UIColor(red:0.26, green:0.52, blue:0.96, alpha:0.3)
        
//        addSubview(iconImageView)
//        iconImageView.translatesAutoresizingMaskIntoConstraints = false
//        iconImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
//        iconImageView.leftAnchor.constraint(equalTo: leftAnchor, constant: 12).isActive = true
//        iconImageView.heightAnchor.constraint(equalToConstant: 24).isActive = true
//        iconImageView.widthAnchor.constraint(equalToConstant: 24).isActive = true
//
//        addSubview(descriptionLabel)
//        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
//        descriptionLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
//        descriptionLabel.leftAnchor.constraint(equalTo: iconImageView.rightAnchor, constant: 12).isActive = true
        
        sv(
        iconImageView,
        descriptionLabel
        )
       
        iconImageView.width(15).height(15)
        descriptionLabel.centerVertically().centerHorizontally(-100)
        iconImageView.centerVertically().centerHorizontally(-170)
        descriptionLabel.textAlignment = .left
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Handlers
}
