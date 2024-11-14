//
//  JokeType.swift
//  Dad Jokes
//
//  Created by keith Talbot on 11/12/24.
//

import Foundation

enum JokeType: String, Codable, CaseIterable {
    case programming = "Programming",
    misc = "Misc",
    dark = "Dark",
    pun = "Pun"
    //spooky = "Spooky",
    //chirstmas = "Christmas"
         

    var type: String {
        
        switch self {
            
        case .programming:
            return "programming"
        case .misc:
            return "misc"
        case .dark:
            return "dark"
        case .pun:
            return "pun"
//        case .spooky:
//            return "spooky"
//        case .chirstmas:
//            return "chirstmas"
        }
        }
        
    }



