//
//  MenuOptions.swift
//  MangoHacks2019
//
//  Created by Zachary Frederick on 2/2/19.
//  Copyright © 2019 Tony Fang. All rights reserved.
//

import UIKit

enum MenuOption: Int, CustomStringConvertible {
    
    case General
    case HandyMan
    case MeetUp
    case OutToEat
    case Settings
    
    var description: String {
        switch self {
        case .General: return "General"
        case .HandyMan: return "Handy Man"
        case .MeetUp: return "Meet Up"
        case .OutToEat: return "Where To Eat"
        case .Settings: return "Settings"
        }
    }
    
    var image: UIImage {
        switch self {
        case .General: return UIImage(named: "ic_person_outline_white_2x") ?? UIImage()
        case .HandyMan: return UIImage(named: "ic_mail_outline_white_2x") ?? UIImage()
        case .MeetUp: return UIImage(named: "ic_menu_white_3x") ?? UIImage()
        case .OutToEat: return UIImage(named: "baseline_settings_white_24dp") ?? UIImage()
        case .Settings: return UIImage(named: "baseline_settings_white_24dp") ?? UIImage()
        }
    }
}
