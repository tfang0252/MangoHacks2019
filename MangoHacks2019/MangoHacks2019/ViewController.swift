//
//  ViewController.swift
//  MangoHacks2019
//
//  Created by Tony Fang on 2/1/19.
//  Copyright © 2019 Tony Fang. All rights reserved.
//

import UIKit
import Stevia
import SwiftGoogleTranslate


class ViewController: UIViewController {
    
    @objc func injected() {
        viewDidLoad()
        viewWillAppear(true)
        viewDidAppear(true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        SwiftGoogleTranslate.shared.start(with: "AIzaSyBjz0Mw9supVoUGdcLaz0pY3m1SVvuElH4")
        
        
        let textf = "Danny does not know French"
        
        SwiftGoogleTranslate.shared.translate(textf, "fr", "en") { (text, error) in
            if let t = text {
                print(t)
            }
        }
        
        
    }


}

