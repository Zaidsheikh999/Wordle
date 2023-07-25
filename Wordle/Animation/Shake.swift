//
//  Shake.swift
//  Wordle
//
//  Created by Zaid Sheikh on 18/07/2023.
//

import Foundation
import SwiftUI

struct Shake: GeometryEffect {
   
    var amount: CGFloat = 10
    var shakePerUnit = 3
    var animatableData: CGFloat
    
    
    func effectValue(size: CGSize) -> ProjectionTransform {
        ProjectionTransform(CGAffineTransform(translationX: amount * sin(animatableData * .pi * CGFloat(shakePerUnit)), y: 0))
    }
}
