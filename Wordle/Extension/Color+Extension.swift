//
//  Color+Extension.swift
//  Wordle
//
//  Created by Zaid Sheikh on 18/07/2023.
//

import Foundation
import SwiftUI


extension Color{
    
    static var correct: Color{
        Color(UIColor(named: "correct")!)
    }
    
    static var misplaced: Color{
        Color(UIColor(named: "misplaced")!)
    }
    
    static var wrong: Color{
        Color(UIColor(named: "wrong")!)
    }
    
    static var unused: Color{
        Color(UIColor(named: "unused")!)
    }
    
    static var systemBackground: Color{
        Color(.systemBackground)
    }
}
