//
//  SignupDropDown.swift
//  MangoHacks2019
//
//  Created by Tony Fang on 2/2/19.
//  Copyright © 2019 Tony Fang. All rights reserved.
//

import UIKit

class SignupDropDown: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let view = UIView()
        view.backgroundColor = .red
        self.view.sv(
            view
        )
        
        view.width(280).height(400)
        view.centerVertically(-20).centerHorizontally()
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
