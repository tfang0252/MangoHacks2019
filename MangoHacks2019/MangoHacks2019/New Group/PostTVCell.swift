//
//  PostTVCell.swift
//  MangoHacks2019
//
//  Created by Tony Fang on 2/2/19.
//  Copyright © 2019 Tony Fang. All rights reserved.
//

import UIKit
import Stevia

class PostTVCell: UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        let selectPostBtn = UIButton()
        selectPostBtn.backgroundColor = UIColor(red:0.90, green:0.91, blue:0.95, alpha:1.0)
        selectPostBtn.layer.cornerRadius = 8
        selectPostBtn.clipsToBounds = true
        
        let postTitle = UILabel()
        let postBody = UITextView()
        postTitle.backgroundColor = .green
        postBody.backgroundColor = .blue
        
        let logo = UIImageView()
        logo.backgroundColor = .red
        logo.layer.cornerRadius = 5
        logo.layer.masksToBounds = true
        
        logo.width(30)
        selectPostBtn.sv(
            logo,
            postTitle,
            postBody
        )
        
        selectPostBtn.layout(
            9,
            |-10-logo-10-postTitle-10-| ~ 30,
            5,
            |-10-postBody-10-| ~ 60
        )
        
        sv(selectPostBtn)
        layout(
        5,
        |-10-selectPostBtn-10-| ~ 110,
        5
        )
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
