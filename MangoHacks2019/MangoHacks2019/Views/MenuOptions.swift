//
//  MenuOptions.swift
//  MangoHacks2019
//
//  Created by Zachary Frederick on 2/2/19.
//  Copyright © 2019 Tony Fang. All rights reserved.
//

import UIKit

enum MenuOption: Int, CustomStringConvertible {
    
    case Home
    case General
    case WhereToEat
    case ThingsToDo
    case HelpAdvice
    case Setting
    case Logout

    
    var description: String {
        switch self {
        
        case .Home: return "Home"
        case .General: return "General"
        case .WhereToEat: return "Where To Eat"
        case .ThingsToDo: return "Things To Do"
        case .HelpAdvice: return "Help/Advice"
        case .Setting: return "Setting"
        case .Logout: return "Logout"

        }
    }
    

}
