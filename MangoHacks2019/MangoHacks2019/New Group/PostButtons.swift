//
//  PostButtons.swift
//  MangoHacks2019
//
//  Created by Zachary Frederick on 2/2/19.
//  Copyright © 2019 Tony Fang. All rights reserved.
//

import UIKit

class PostButtons: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }


    private func setup() {
        self.layer.cornerRadius = 10
        self.layer.masksToBounds = true
        backgroundColor = UIColor(red:0.07, green:0.81, blue:0.40, alpha:1.0)
        setTitleColor(.white, for: .normal)
        isEnabled = true
    }
}
